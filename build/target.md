# build/target 总览

该目录包含产品和设备配置模板，为 Android 构建提供产品选择和目标定义所需的数据。

常见特点：
- 通过 Makefile 片段定义产品预设、通用设备配置和板级默认值。
- 这些文件会被顶层 Make 构建配置以及 `lunch` / product 选择流程读取。

已文档化的子目录：
- `board`
- `product`
