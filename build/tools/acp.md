# tools/acp

位置：`build/tools/acp`

概述：
- 作用：Android 构建中使用的宿主侧文件拷贝工具。
- 主要文件：`Android.bp`、`README`、`acp.c`。

编译方式：
- 由 `acp.c` 编译得到的原生宿主二进制。
- 作为构建辅助工具使用，而不是打进目标系统镜像。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `README` 说明用法和行为。
