#
# SPDX-FileCopyrightText: The ResurrectedRemixOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from rhodep device
$(call inherit-product, device/motorola/rhodep/device.mk)

# Inherit some common RR stuff.
$(call inherit-product, vendor/rr/config/common_full_phone.mk)

PRODUCT_NAME := rr_rhodep
PRODUCT_DEVICE := rhodep
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g82 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="rhodep_g-user 13 T1SUS33.1-124-6-16 5406e-b418a2 release-keys" \
    BuildFingerprint=motorola/rhodep_g/rhodep:13/T1SUS33.1-124-6-16/5406e-b418a2:user/release-keys \
    DeviceProduct=rhodep_g

BOARD_OTA_ENABLE_REPLACE_ZSTD := false 

# RR Flags
RR_MAINTAINER := Akky
WITH_GMS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_EXCLUDES_AUDIOFX := false
TARGET_SUPPORTS_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2400
TARGET_BOOTANIMATION_HALF_RES := false
