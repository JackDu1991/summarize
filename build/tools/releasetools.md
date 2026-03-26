# tools/releasetools

位置：`build/tools/releasetools`

概述：
- 作用：用于 target-files、OTA 包、镜像生成和签名的发布工程脚本。
- 主要文件：`Android.bp`、`OWNERS`、大量 Python 脚本、测试文件和 `testdata/`。

编译方式：
- 由 Python 宿主工具和脚本构成，在发布打包和 OTA 生成阶段被调用。
- 常被发布工程师和自动化打包流程使用。

相关构建文件：
- `Android.bp` 定义宿主脚本和模块。
- `testdata/` 为测试套件提供固定输入。
