# target/product

位置：`build/target/product`

概述：
- 作用：产品 Makefile 模板和产品/设备预设，覆盖 AOSP、generic、emulator、mainline、SDK、telephony 和 module 等构建类型。
- 主要文件与目录：`AndroidProducts.mk`、大量 `aosp_*.mk` / `generic_*.mk` / `sdk_*.mk` / `mainline_*.mk` / `full*.mk` / `base*.mk` 文件，以及 `gsi/`、`security/`、`sysconfig/`、`virtual_ab_ota/`。

编译方式：
- 这些都是用于产品选择和配置的 Make 片段，本身不编译成二进制。
- 它们定义 `PRODUCT_*` 变量、包列表和产品继承树。

相关构建文件：
- `AndroidProducts.mk` 枚举可选的产品 makefile。
- 各个 `*.mk` 文件定义每个产品变体的继承链和功能集合。
