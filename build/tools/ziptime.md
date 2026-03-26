# tools/ziptime

位置：`build/tools/ziptime`

概述：
- 作用：规范化或调整 ZIP 时间戳，以支持可复现的 Android 打包。
- 主要文件：`Android.bp`、`README.txt`、`ZipEntry.cpp`、`ZipEntry.h`、`ZipFile.cpp`、`ZipFile.h`、`ZipTime.cpp`。

编译方式：
- 由上述源码编译得到的原生 C++ 宿主工具。
- 用于让归档时间戳保持确定性或符合打包规则。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `README.txt` 说明行为和调用方式。
