# tools/libhost

位置：`build/tools/libhost`

概述：
- 作用：供构建工具共享的宿主侧 C 库代码。
- 主要文件：`Android.bp`、`CopyFile.c`、`include/`。

编译方式：
- 由 C 源码编译得到的宿主支持库。
- 供其他宿主工具在文件拷贝和打包操作中复用。

相关构建文件：
- `Android.bp` 定义库模块。
- `include/` 保存对外头文件。
