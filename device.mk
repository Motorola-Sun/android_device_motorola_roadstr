#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2712
TARGET_SCREEN_WIDTH := 1220

# Fingerprint
TARGET_HAS_UDFPS := true

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.vendor.st21nfc.rc \
    init.oem.fingerprint2.sh

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 36

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
TARGET_USES_TIKTAP_VIBRATOR := true

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml
ODM_MANIFEST_SKUS += dn dnes n nes nv
ODM_MANIFEST_DN_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_dn.xml
ODM_MANIFEST_DNES_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_dnes.xml
ODM_MANIFEST_N_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_n.xml
ODM_MANIFEST_NES_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_nes.xml
ODM_MANIFEST_NV_FILES := $(LOCAL_PATH)/configs/vintf/sku/manifest_nv.xml

# Inherit from motorola sm8750-common
$(call inherit-product, device/motorola/sm8750-common/common.mk)

# Vendor
$(call inherit-product, vendor/motorola/roadstr/roadstr-vendor.mk)
