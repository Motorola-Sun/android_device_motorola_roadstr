#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_star import (
    extract_star_firmware,
    star_firmware_regex,
)

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import lib_fixups
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/motorola/sm8750-common',
    'vendor/motorola/sm8750-common',
    'hardware/motorola',
    'hardware/qcom-caf/sm8750',
    'vendor/qcom/opensource/commonsys-intf/display',
]

blob_fixups: blob_fixups_user_type = {
    (
         'vendor/bin/hw/android.hardware.biometrics.fingerprint@2.1-goodixservice',
         'vendor/bin/hw/android.hardware.biometrics.fingerprint-service-jv',
         'vendor/lib64/libgf_hal.so',
    ): blob_fixup()
        .replace_needed('android.hardware.biometrics.common-V3-ndk.so', 'android.hardware.biometrics.common-V4-ndk.so')
        .replace_needed('android.hardware.biometrics.fingerprint-V3-ndk.so', 'android.hardware.biometrics.fingerprint-V4-ndk.so')
        .binary_regex_replace(b'(?<=\x00)/default\x00', b'/wrapper\x00'),
    (
        'vendor/lib64/camera/components/com.qti.node.dewarp.so',
        'vendor/lib64/hw/com.qti.chi.override.so',
        'vendor/lib64/libcamximageformatutils.so',
        'vendor/lib64/libchifeature2.so',
        'vendor/lib64/vendor.qti.hardware.camera.offlinecamera-service-impl.so',
        'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so',
    ): blob_fixup()
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so'),
    (
        'vendor/lib64/libcamxcoreutils.so',
        'vendor/lib64/libcamxods.so',
    ): blob_fixup()
        .replace_needed('libtinyxml2.so', 'libtinyxml2-v36.so'),
}

extract_fns: extract_fns_user_type = {
    star_firmware_regex: extract_star_firmware,
}

module = ExtractUtilsModule(
    'roadstr',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
    extract_fns=extract_fns,
    add_generated_carriersettings=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm8750-common', module.vendor)
    utils.run()
