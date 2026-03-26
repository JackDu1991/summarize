# target/board

位置：`build/target/board`

概述：
- 作用：board 配置模板和设备默认值集合。
- 主要文件与目录：`Android.mk`、`BoardConfigEmuCommon.mk`、`BoardConfigGkiCommon.mk`、`BoardConfigGsiCommon.mk`、`BoardConfigMainlineCommon.mk`、`BoardConfigModuleCommon.mk`、`BoardConfigPixelCommon.mk`、`emulator_*/`、`generic_*/`、`gsi_*/`、`mainline_*/`、`module_*/`。

编译方式：
- 这些是 Make 片段，不会单独编译成二进制。
- 由产品或 board 构建在顶层 Make 流程中包含，用来设置 board 级变量、属性和默认值。

相关构建文件：
- `Android.mk` 是入口文件。
- `go_defaults*.prop` 与其他 `.prop` 文件定义默认运行时 / 系统属性。
