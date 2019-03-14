#
# Copyright (C) 2018 The LineageOS Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/yellowstone/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_yellowstone
PRODUCT_DEVICE := yellowstone
PRODUCT_BRAND := google
PRODUCT_MODEL := Yellowstone
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=google/tango/yellowstone:4.4.2/KOT49H.161129/161129002:user/release-keys \
    PRODUCT_NAME=tango \
    PRIVATE_BUILD_DESC="ardbeg-user 4.4.2 KOT49H.161129 161129002 release-keys"

## including rild here to create modem for data only skus without dialer and
## mms apps , not including generic.mk
PRODUCT_PACKAGES += rild

## enable Wifi Access Point monitor (needed for two-step SAR backoff)
PRODUCT_PACKAGES += icera-config

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modem.do=1 \
    ril.icera-config-args=notifier:ON,datastall:ON,lwaactivate

PRODUCT_COPY_FILES += $(LOCAL_PATH)/ril_atc.config:system/etc/ril_atc.config
