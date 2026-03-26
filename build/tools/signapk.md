# tools/signapk

位置：`build/tools/signapk`

概述：
- 作用：用于 APK/JAR 签名的 Java 宿主工具。
- 主要文件：`Android.bp`、`SignApk.mf`、`src/`、`test/`。

编译方式：
- 由 `src/` 下源码编译得到的 Java 宿主工具。
- 在打包和发布准备过程中用于为产物签名。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `SignApk.mf` 提供 manifest 元数据。
