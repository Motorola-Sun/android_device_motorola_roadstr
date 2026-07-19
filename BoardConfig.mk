#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/roadstr

# Inherit from motorola sm8750-common
include device/motorola/sm8750-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_DEVICE)

# Display
TARGET_SCREEN_DENSITY := 480

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 21537751040 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_SUPER_PARTITION_SIZE := 21541945344

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# Security
BOOT_SECURITY_PATCH := 2026-08-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified boot
BOARD_AVB_ROLLBACK_INDEX := 50
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)

# Vendor
include vendor/motorola/roadstr/BoardConfigVendor.mk
