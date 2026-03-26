# 构建系统总览

本文总结了 RK3588 Android SDK 仓库中 `build/` 目录下的主要构建子系统，并指向各子系统的详细说明。

- `blueprint`：Android Blueprint 解析工具与相关脚本，供 Soong 使用。
- `soong`：Soong 构建系统实现（Go 代码 + 模块定义），是近代 Android 的主构建系统。
- `make` / `core`：基于 Make 的旧式构建基础设施及兼容层（`Android.mk` / `Makefile` 和供 `m` / `make` 使用的封装）。
- `bazel`：与 Bazel 相关的构建辅助和规则（可选 Bazel 支持）。

各子系统的详细内容请查看本目录下的配套文件。
