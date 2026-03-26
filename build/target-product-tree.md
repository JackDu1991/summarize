# build/target/product 树

- [target-product-files.md](target-product-files.md)

## 顶层 product 文件
- `AndroidProducts.mk`
- `aosp_64bitonly_x86_64.mk`
- `aosp_arm.mk`
- `aosp_arm64.mk`
- `aosp_base.mk`
- `aosp_base_telephony.mk`
- `aosp_product.mk`
- `aosp_x86.mk`
- `aosp_x86_64.mk`
- `aosp_x86_arm.mk`
- `base.mk`
- `base_product.mk`
- `base_system.mk`
- `base_system_ext.mk`
- `base_vendor.mk`
- `full.mk`
- `full_base.mk`
- `full_base_telephony.mk`
- `full_x86.mk`
- `generic.mk`
- `generic_no_telephony.mk`
- `generic_ramdisk.mk`
- `generic_system.mk`
- `generic_system_arm64.mk`
- `generic_system_x86.mk`
- `generic_system_x86_64.mk`
- `generic_system_x86_arm.mk`
- `generic_x86.mk`
- `mainline_sdk.mk`
- `mainline_system.mk`
- `mainline_system_arm64.mk`
- `mainline_system_x86.mk`
- `mainline_system_x86_64.mk`
- `mainline_system_x86_arm.mk`
- `media_product.mk`
- `media_system.mk`
- `media_system_ext.mk`
- `media_vendor.mk`
- `module_arm.mk`
- `module_arm64.mk`
- `module_common.mk`
- `module_x86.mk`
- `module_x86_64.mk`
- `sdk.mk`
- `sdk_arm64.mk`
- `sdk_phone_arm64.mk`
- `sdk_phone_armv7.mk`
- `sdk_phone_x86.mk`
- `sdk_phone_x86_64.mk`
- `sdk_x86.mk`
- `sdk_x86_64.mk`
- `telephony.mk`
- `telephony_product.mk`
- `telephony_system.mk`
- `telephony_system_ext.mk`
- `telephony_vendor.mk`
- `updatable_apex.mk`
- `userspace_reboot.mk`
- `vboot.mk`
- `verity.mk`
- `virtual_ab_ota.mk`
- `virtual_ab_ota_plus_non_ab.mk`
- `virtual_ab_ota_retrofit.mk`

## 子目录
- `gsi/`
- `security/`
- `sysconfig/`
- `virtual_ab_ota/`

## 子目录说明
- `gsi/` 包含 `current.txt`、`28.txt` 到 `32.txt` 以及设备 init / key 相关文件。
- `security/` 包含签名密钥材料和相关证书。
- `sysconfig/` 包含 XML 包白名单 / 预装包配置。
- `virtual_ab_ota/` 包含 virtual A/B OTA 流程的启动和 retrofit make 片段。
