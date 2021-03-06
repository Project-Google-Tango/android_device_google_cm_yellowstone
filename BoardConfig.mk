#
# Copyright (C) 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/google/yellowstone

BOARD_SUPPORT_NVOICE := true

BOARD_SUPPORT_NVAUDIOFX :=true


# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_FAMILY := t12x
TARGET_BOOTLOADER_BOARD_NAME := ardbeg

TARGET_KERNEL_DT_NAME := tegra124-ardbeg

# Kernel cmdline
TARGET_KERNEL_SOURCE := kernel/google/master
TARGET_KERNEL_CONFIG := yellowstone_defconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.ccihwid=6
# usb_port_owner_info=1

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

# powerhal
BOARD_USES_POWERHAL := true
TARGET_POWERHAL_VARIANT := tegra

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true


# Reserved for when audio.primary.tegra works
# USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= $(DEVICE_PATH)/bluetooth

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/data/misc/wifi/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/data/misc/wifi/firmware/fw_bcmdhd_apsta_a0.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/data/misc/wifi/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"


TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true


# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8588608
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 1443438592
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 18388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1509949440
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119358357504

# Graphics
USE_OPENGL_RENDERER := true

# UBOOT/XLOADER
TARGET_USE_XLOADER := false
TARGET_USE_UBOOT := false
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_TYPE := fastboot

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.ardbeg
LZMA_RAMDISK_TARGETS := recovery


# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := true

# Using the NCT partition
TARGET_USE_NCT := true
# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := false

# TWRP
ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/twrp.mk
endif

ART_USE_HSPACE_COMPACT=true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

BOARD_HARDWARE_CLASS := device/google/yellowstone/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += device/google/yellowstone/sepolicy

BOARD_SEPOLICY_UNION += \
	te_macros \
	agpsd.te \
	app.te \
	bluetooth.te \
	bootanim.te \
	cvc.te \
	device.te \
	dhcp.te \
	domain.te \
	drmserver.te \
	fild.te \
	file_contexts \
	file.te \
	genfs_contexts \
	gpload.te \
	gpsd.te \
	healthd.te\
	hostapd.te \
	installd.te \
	mediaserver.te \
	mock_modem.te \
	netd.te \
	platform_app.te \
	property_contexts \
	property.te \
	raydium.te \
	recovery.te \
	sensorhubd.te \
	service.te \
	service_contexts \
	set_hwui.te \
	shell.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	tee.te \
	ueventd.te \
	untrusted_app.te \
	usb.te \
	ussrd.te \
	ussr_setup.te \
	vold.te \
	wifi_loader.te \
	wpa.te \
	zygote.te

# Inherit from the proprietary version
include vendor/google/yellowstone/BoardConfigVendor.mk

