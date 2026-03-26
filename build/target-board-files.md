# build/target/board 文件级目录

本页逐项说明 `build/target/board` 下的重要文件。

## 顶层文件
- `Android.mk`：board 配置片段的入口文件。
- `BoardConfigEmuCommon.mk`：模拟器目标的通用配置。
- `BoardConfigGkiCommon.mk`：基于 GKI 的构建通用配置。
- `BoardConfigGsiCommon.mk`：GSI 构建通用配置。
- `BoardConfigMainlineCommon.mk`：面向 mainline 的通用配置。
- `BoardConfigModuleCommon.mk`：面向 module 的通用配置。
- `BoardConfigPixelCommon.mk`：Pixel 风格设备的通用配置。
- `go_defaults.prop` / `go_defaults_512.prop` / `go_defaults_common.prop`：Go / 低内存配置的默认属性集。

## 设备配置目录
- `emulator_arm/`、`emulator_arm64/`、`emulator_x86/`、`emulator_x86_64/`、`emulator_x86_64_arm64/`、`emulator_x86_arm/`：模拟器专用 board 配置片段。
- `generic/`、`generic_64bitonly_x86_64/`、`generic_arm64/`、`generic_x86/`、`generic_x86_64/`、`generic_x86_64_arm64/`、`generic_x86_arm/`：通用 board 配置片段。
- `gsi_arm64/`、`gsi_system_ext.prop`、`gsi_system_ext_user.prop`：GSI board 和属性配置。
- `mainline_arm64/`、`mainline_sdk/`、`mainline_x86/`、`mainline_x86_64/`、`mainline_x86_arm/`：mainline board 配置片段。
- `module_arm/`、`module_arm64/`、`module_x86/`、`module_x86_64/`：面向 module 的 board 配置片段。

## 构建作用
- 这些都是 Make 片段，不是可编译二进制。
- 它们定义 board 级默认值、产品属性以及变体继承关系，供更高层的产品选择逻辑消费。
