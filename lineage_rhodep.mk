#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from rhodep device
$(call inherit-product, device/motorola/rhodep/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_rhodep
PRODUCT_DEVICE := rhodep
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g82 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="rhodep_g-user 13 T1SUS33.1-124-6-16 5406e-b418a2 release-keys" \
    BuildFingerprint=motorola/rhodep_g/rhodep:13/T1SUS33.1-124-6-16/5406e-b418a2:user/release-keys \
    DeviceProduct=rhodep_g

# ADDITIONAL FLAGS
TARGET_DISABLE_EPPE := true
TARGET_ENABLE_BLUR := true

# Moto Camera 4
TARGET_MOTCAMERA4 := rhodep
TARGET_USES_MOTCAMERA4 := true

$(call inherit-product, vendor/motorola/MotCamera4-sm6375/motcamera4.mk)
