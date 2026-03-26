# make & core - 旧式 Make 构建基础设施

位置：`build/make` 和 `build/core`

概述：
- 作用：使用 GNU Make 和大量 `.mk` include 文件实现的旧式 Android 构建逻辑，为旧模块和顶层产品构建流程提供兼容支持。

关键文件和目录：
- `build/make/`：辅助脚本、`Android.bp` 兼容文件和文档。
- `build/core/`：`Makefile` 片段和大量 `*.mk` 规则（例如 `android_manifest.mk`、`java.mk`、`cc_prebuilt_internal.mk`、`main.mk`、`root.mk`）。

编译方式：
- 基于 Make 的流程读取 `Android.mk` / `Application.mk` 或生成的 makefile，并使用 GNU Make 工具链驱动编译。在现代代码树中，Make 主要作为与 Soong 输出协作的兼容层。
- 典型流程：顶层 `make` 或封装脚本 `m` 调用包含 `build/core` 定义的 makefile。

重要文件及作用：
- `build/core/main.mk` 和 `root.mk`：建立产品构建的顶层 include。
- `build/core/` 下的 `*.mk` 片段：定义 Java、C/C++、打包、签名和产品组装等规则。

构建步骤（概念上）：
1. 顶层 Make 调用包含 `build/core/root.mk`。
2. Make 计算变量并包含各模块的规则。
3. 通过 `$(BUILD_FOR_HOST)` 或交叉编译工具链执行编译动作。

开发命令示例：
- 使用 Make 构建：`source build/envsetup.sh && lunch <target> && make -jN`（或使用 `m` 封装脚本）。
