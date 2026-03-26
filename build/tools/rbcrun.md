# tools/rbcrun

位置：`build/tools/rbcrun`

概述：
- 作用：用于运行 RBC 相关流程和实验的宿主工具。
- 主要文件：`Android.bp`、`README.md`、`go.mod`、`go.sum`、`host.go`、`host_test.go`、`cmd/`、`testdata/`。

编译方式：
- 由本目录中的 Go 模块编译得到的宿主二进制。
- 包含测试和示例输入数据。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `README.md` 说明工具和调用方式。
