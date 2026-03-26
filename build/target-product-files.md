# build/target/product 文件级目录

本页逐项说明 `build/target/product` 下的重要文件。

## 产品定义入口
- `AndroidProducts.mk`：枚举构建系统可以选择的产品 makefile。

## AOSP 和基础产品
- `aosp_64bitonly_x86_64.mk`：仅面向 x86_64 的 AOSP 产品变体。
- `aosp_arm.mk` / `aosp_arm64.mk` / `aosp_x86.mk` / `aosp_x86_64.mk` / `aosp_x86_arm.mk`：核心 AOSP 设备目标。
- `aosp_base.mk` / `aosp_base_telephony.mk` / `aosp_product.mk`：基础产品定义和继承关系。
- `base.mk` / `base_product.mk` / `base_system.mk` / `base_system_ext.mk` / `base_vendor.mk`：共享的基础产品层。

## 通用与模拟器产品
- `generic.mk` / `generic_no_telephony.mk` / `generic_ramdisk.mk`：通用产品配置。
- `generic_system.mk` / `generic_system_arm64.mk` / `generic_system_x86.mk` / `generic_system_x86_64.mk` / `generic_system_x86_arm.mk`：仅 system 的通用产品变体。
- `generic_x86.mk`：通用 x86 目标。
- `emulator.mk` / `emulator_system.mk` / `emulator_vendor.mk`：模拟器产品栈。

## SDK 与 module 产品
- `sdk.mk` / `sdk_arm64.mk` / `sdk_phone_arm64.mk` / `sdk_phone_armv7.mk` / `sdk_phone_x86.mk` / `sdk_phone_x86_64.mk` / `sdk_x86.mk` / `sdk_x86_64.mk`：面向 SDK 的产品变体。
- `module_arm.mk` / `module_arm64.mk` / `module_common.mk` / `module_x86.mk` / `module_x86_64.mk`：面向 module 的产品定义。
- `mainline_sdk.mk`：mainline SDK 产品配置。

## Mainline、Telephony、GSI 与特性产品
- `mainline_system.mk` / `mainline_system_arm64.mk` / `mainline_system_x86.mk` / `mainline_system_x86_64.mk` / `mainline_system_x86_arm.mk`：mainline system 变体。
- `telephony.mk` / `telephony_product.mk` / `telephony_system.mk` / `telephony_system_ext.mk` / `telephony_vendor.mk`：支持 telephony 的产品层。
- `gsi/` 与 `gsi_*` 文件：Generic System Image 相关内容。
- `security/`、`sysconfig/`、`virtual_ab_ota/`、`virtual_ab_ota*.mk`、`updatable_apex.mk`、`verity.mk`、`vboot.mk`、`userspace_reboot.mk`：面向特定特性的产品片段。

## 构建作用
- 这些文件是供 `lunch` / product 选择和包内容组装使用的 Make 片段。
- 它们定义 `PRODUCT_*` 变量、继承关系、包列表以及镜像行为。
