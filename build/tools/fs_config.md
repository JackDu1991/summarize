# tools/fs_config

位置：`build/tools/fs_config`

概述：
- 作用：为 Android 镜像和分区生成文件系统配置数据。
- 主要文件：`Android.bp`、`Android.mk`、`README.md`、`fs_config.c`、`fs_config.go`、`fs_config_generator.py`、`test_fs_config_generator.py`。

编译方式：
- 混合实现：原生 C/C++/Go 支持代码加上 Python 生成脚本。
- 用于生成 `fs_config` 产物，供镜像创建和分区打包使用。

相关构建文件：
- `Android.bp` 和 `Android.mk` 定义宿主/原生模块。
- `end_to_end_test/` 下的测试用于验证生成器行为。
