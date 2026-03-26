# core - Make 片段与平台规则

位置：`build/core`

概述：
- 作用：集中存放定义模块编译方式的 Make 片段，覆盖 Java、Native、打包、签名等各类规则。它是旧式 Make 构建逻辑和顶层兼容层的核心。

示例关键文件：
- `main.mk`、`root.mk`：顶层 make include。
- `java.mk`、`java_library.mk`、`cc_prebuilt_internal.mk`、`shared_library.mk`：按语言划分的构建规则。
- `envsetup.mk`、`product.mk`、`build_id.mk`：产品配置和环境设置。

构建过程：
- 这些文件由顶层 Make include，定义变量、工具链和规则，并展开为编译器与链接器调用。它们与 Soong 协同工作（Soong 会生成部分 make 片段用于兼容）。

开发命令：
- 典型构建方式：`source build/envsetup.sh && lunch <target> && m`。
