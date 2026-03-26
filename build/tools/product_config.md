# tools/product_config

位置：`build/tools/product_config`

概述：
- 作用：处理和校验产品配置的宿主工具。
- 主要文件：`Android.bp`、`README.md`、`host.go`、`host_test.go`、`cmd/`、`testdata/`。

编译方式：
- 基于 Go 的宿主工具，作为构建宿主工具链的一部分编译。
- 提供读取或校验产品配置数据的 CLI 功能。

相关构建文件：
- `Android.bp` 定义 Go 宿主模块。
- `README.md` 说明用法和工作流。
- `cmd/` 存放命令入口。
