# build/tools 文件级目录

本页逐项说明 `build/tools` 下的主要文件。

## 顶层文件
- `Android.bp`：声明本目录下的大部分宿主工具、测试和辅助二进制。
- `OWNERS`：代码归属信息。
- `acp.c`：`acp` 宿主拷贝工具的源代码。
- `auto_gen_test_config.py` / `auto_gen_test_config_test.py`：生成测试配置的脚本与测试。
- `brillo-clang-format`：格式化辅助封装脚本。
- `build-license-metadata.sh`：生成构建产物的 license 元数据。
- `buildinfo.sh`：生成构建信息字符串或文件。
- `check_elf_file.py`：在构建检查中校验 ELF 文件。
- `check_identical_lib.sh`：比较库文件是否完全一致。
- `check_radio_versions.py`：校验基带/无线版本值。
- `checkowners.py`：检查 OWNERS 元数据是否符合规范。
- `compare_builds.py` / `compare_fileslist.py`：构建结果比较工具。
- `exercise_compare_builds`：构建比较流程的脚本/入口包装器。
- `extract_kernel.py` / `test_extract_kernel.py`：内核提取辅助脚本及其测试。
- `fat16copy.py`：FAT16 镜像拷贝辅助脚本。
- `fileslist_util.py`：文件列表操作的通用工具。
- `filter-product-graph.py`：过滤产品图数据。
- `findleaves.py`：查找目录树中的叶子目录。
- `fixlinebreaks.sh`：规范化换行符。
- `generate-enforce-rro-android-manifest.py`：为强制 RRO 检查生成清单。
- `generate-notice-files.py`：为打包产物生成 notice 文件。
- `generate-self-extracting-archive.py`：创建自解压归档。
- `java-event-log-tags.py` / `merge-event-log-tags.py`：事件日志标签生成与合并辅助脚本。
- `java-layers.py`：用于构建期分析的 Java layer 辅助脚本。
- `mk2bp_catalog.py`：将 Android.mk 转换为 Blueprint 的目录辅助工具。
- `normalize_path.py`：路径规范化辅助脚本。
- `parsedeps.py`：解析依赖数据。
- `post_process_props.py` / `test_post_process_props.py` / `post_process_props_unittest.xml`：属性后处理与测试。
- `print_module_licenses.sh`：打印模块 license 汇总。
- `rbesetup.sh`：远程构建执行环境设置辅助脚本。
- `soong_to_convert.py`：Soong 迁移相关的转换辅助脚本。
- `warn.py` 以及 `warn/` 下的支持文件：告警分析与报告工具。

## 子目录
- `acp/`：`acp` 宿主文件拷贝工具的源码与 Blueprint 定义。
- `apicheck/`：API 检查支持数据。
- `atree/`：树结构组装宿主工具源码。
- `docker/`：容器构建环境文件。
- `droiddoc/`：文档生成支持。
- `fs_config/`：文件系统配置生成器及测试。
- `fs_get_stats/`：文件系统统计辅助工具。
- `libhost/`：构建工具共用的宿主 C 库。
- `product_config/`：产品配置宿主工具。
- `rbcrun/`：基于 Go 的 RBC 运行器。
- `releasetools/`：OTA / target-files / 镜像打包工具。
- `signapk/`：APK/JAR 签名工具。
- `signtos/`：TOS 签名工具。
- `warn/`：警告模式与报告框架。
- `zipalign/`：ZIP/APK 对齐工具。
- `ziptime/`：ZIP 时间戳规范化工具。
