# tools/zipalign

位置：`build/tools/zipalign`

概述：
- 作用：按 Android 打包要求对 ZIP/APK 条目进行对齐。
- 主要文件：`Android.bp`、`README.txt`、`ZipAlign.cpp`、`ZipAlignMain.cpp`、`ZipEntry.cpp`、`ZipEntry.h`、`ZipFile.cpp`、`ZipFile.h`、`include/`、`tests/`。

编译方式：
- 由上述源码编译得到的原生 C++ 宿主工具。
- 在打包或签名前用于对 APK/JAR/ZIP 归档进行后处理。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `README.txt` 说明使用细节。
