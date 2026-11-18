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

# Vendor
include vendor/motorola/roadstr/BoardConfigVendor.mk
