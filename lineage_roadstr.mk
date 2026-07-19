#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from roadstr device
$(call inherit-product, device/motorola/roadstr/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_roadstr
PRODUCT_DEVICE := roadstr
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="roadstr_g-user 16 W1WRS36.39-115-4 edd95a-8ad0d release-keys" \
    BuildFingerprint=motorola/roadstr_g/roadstr:16/W1WRS36.39-115-4/edd95a-8ad0d:user/release-keys \
    DeviceName=roadstr \
    DeviceProduct=roadstr_g \
    SystemDevice=roadstr \
    SystemName=roadstr_g

PRODUCT_GMS_CLIENTID_BASE := android-motorola
