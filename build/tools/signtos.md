# tools/signtos

位置：`build/tools/signtos`

概述：
- 作用：用于 TOS 相关打包流程的 Java 签名工具。
- 主要文件：`Android.bp`、`SignTos.java`、`SignTos.mf`。

编译方式：
- 由 `SignTos.java` 编译得到的 Java 宿主工具。
- 作为签名或打包流水线的一部分使用。

相关构建文件：
- `Android.bp` 定义宿主模块。
- `SignTos.mf` 提供 manifest 元数据。
