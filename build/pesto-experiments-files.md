# build/pesto/experiments 文件级目录

本页说明 `build/pesto/experiments/prepare_bazel_test_env` 下的文件。

## 实验目录
- `prepare_bazel_test_env/README.md`：说明这个 proof-of-concept Bazel 环境模拟的目标。
- `prepare_bazel_test_env/BUILD.bazel`：该实验对应的 Bazel 目标定义。
- `prepare_bazel_test_env/` 目录中的其他脚本或数据文件：支持模拟 Bazel 环境的搭建。

## 构建作用
- 这是实验性基础设施，不是生产构建目标。
- 这些文件用于在 Android 源码树内原型验证或复现 Bazel 相关工作流。
