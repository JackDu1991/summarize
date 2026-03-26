# soong - Soong 构建系统

位置：`build/soong`

概述：
- 作用：Android 的现代构建系统，使用 Go 实现。它负责把 `Android.bp` 模块定义转换成构建动作，并与 `ninja` 集成。
- 语言：Go，配合大量辅助脚本和生成产物。

关键文件和目录：
- `Android.bp` 和 `root.bp`：顶层 Blueprint 输入。
- `soong.bash`、`soong_ui.bash`、`soong.bootstrap.in`：入口脚本。
- `android/`、`cc/`、`java/`、`jar/`、`rust/`、`sdk/`：模块类型实现与构建规则。
- `bp2build/`：将 Blueprint 转换为 Bazel 目标的工具。

编译方式：
- 高层流程是：构建系统读取 `Android.bp` 文件，Soong 的 Go 代码处理模块定义并写出 `ninja` 文件；随后由 `ninja` 执行底层的编译/链接步骤。
- 典型流程：`source build/envsetup.sh && lunch <target> && m`（或 `make`）触发 Soong；开发阶段也可以直接通过提供的脚本运行 Soong。

涉及的构建文件：
- 源码树中的所有 `Android.bp` 文件都定义了由 Soong 编译的模块。
- Soong 的 Go 源码位于这里，并会在构建过程中编译成宿主二进制。

构建步骤（概念上）：
1. 扫描工程树中的 `Android.bp` 文件。
2. Soong 解析 Blueprint 并解析模块依赖图。
3. Soong 生成 `ninja` 构建文件并组织生成阶段。
4. `ninja` 按生成的图执行任务（编译/链接/打包）。

开发命令示例：
- 构建 Android 镜像：`source build/envsetup.sh && lunch <target> && m -jN`。
- 本地构建 Soong 进行测试：`cd build/soong && go build ./...`。
