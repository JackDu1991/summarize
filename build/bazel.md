# bazel - Bazel 集成与规则

位置：`build/bazel`

概述：
- 作用：支持使用 Bazel 构建代码树中的部分内容，并提供将 Blueprint 转换为 Bazel 目标的工具链。

关键文件和目录：
- `bazel.BUILD`、`bazel.WORKSPACE`、`bazel.sh`：Bazel 入口和 workspace 文件。
- Soong 中的 `bp2build/`：将 Blueprint 翻译成 Bazel 规则的转换器。
- `rules/`、`rules_cc/`、`bazel_skylib/`：Bazel 规则实现和依赖。

编译方式：
- Bazel 构建使用 Bazel 二进制，并以 `bazel.WORKSPACE` 定义 workspace。Android 树中的部分内容会通过 `bp2build` 生成 BUILD 文件。

开发命令示例：
- 在 Bazel workspace 中运行：`bazel build //path:target`（环境设置可参考 `bazel.sh` 封装脚本）。
