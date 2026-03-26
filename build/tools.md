# build/tools 总览

该目录包含 Android 构建过程中使用的宿主工具、生成器、签名器、打包器以及警告/报告工具。

常见特点：
- 很多工具是由 `Android.bp` 声明的 Python 宿主二进制。
- 一部分工具是用 C/C++ 或 Go 编写的原生宿主二进制。
- 还有一些工具是测试辅助脚本或由构建系统调用的发布工程脚本。

本目录下已经文档化的主要子目录：
- `acp`
- `apicheck`
- `atree`
- `docker`
- `droiddoc`
- `fs_config`
- `fs_get_stats`
- `libhost`
- `product_config`
- `rbcrun`
- `releasetools`
- `signapk`
- `signtos`
- `warn`
- `zipalign`
- `ziptime`
