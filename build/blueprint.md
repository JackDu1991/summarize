# blueprint - Blueprint 解析器与工具

位置：`build/blueprint`

概述：
- 作用：提供 Android Blueprint 文件的解析与处理工具，并为 Soong 提供 `Blueprints` 格式解析能力。
- 语言：Go（核心库和命令行工具）以及少量 shell 脚本。

关键文件和目录：
- `Blueprints`：用于测试/示例的 Blueprint 文件。
- `blueprint.bash`、`blueprint_impl.bash`：辅助脚本。
- `parser/`：Go 解析实现。
- `bpfmt/`、`bpmodify/`：Blueprint 格式化和修改工具。
- `bootstrap/`、`tests/`：测试和引导相关辅助内容。

编译方式：
- 该目录主要是 Go 代码，在构建 Android 平台时会作为宿主工具链的一部分编译。
- 典型流程：通过 `go build`（由 Soong / 构建脚本触发）生成在 Soong 阶段使用的工具。

涉及的构建文件：
- 这里没有运行时模块级别的 `Android.bp`，但目录中的 Go 源码和 shell 脚本会被上层构建步骤调用。

在整体构建中的作用：
- Soong 使用 Blueprint 解析 `Android.bp` 模块定义。Blueprint 工具会在早期配置阶段以宿主二进制的形式运行，用于转换或校验 blueprint 文件。

示例命令：
- 在顶层构建系统中，Soong 会编译并调用这些 Go 工具；开发者也可以在 `build/blueprint` 内执行 `go build` 生成本地二进制进行测试。
