# tools/atree

位置：`build/tools/atree`

概述：
- 作用：在 Android 打包和安装镜像准备过程中使用的文件树组装工具。
- 主要文件：`Android.bp`、`atree.cpp`、`files.cpp`、`files.h`、`fs.cpp`、`fs.h`、`options.h`。

编译方式：
- 由上述源码编译得到的原生宿主 C++ 二进制。
- 通常作为构建辅助工具，用于复制或暂存文件树。

相关构建文件：
- `Android.bp` 定义宿主模块。
