# tools/docker

位置：`build/tools/docker`

概述：
- 作用：Android 构建流程使用的容器化构建环境资源。
- 主要文件：`Dockerfile`、`README.md`、`.gitignore`。

编译方式：
- 不是可编译二进制；该目录提供容器构建说明和环境设置辅助内容。
- 用于可复现的构建或测试环境。

相关构建文件：
- `README.md` 说明镜像或工作流。
- `Dockerfile` 定义容器构建方式。
