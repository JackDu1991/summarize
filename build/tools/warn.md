# tools/warn

位置：`build/tools/warn`

概述：
- 作用：Android 构建诊断中的告警模式匹配与报告生成框架。
- 主要文件：`warn.py`、`warn_common.py`、`severity.py`、`html_writer.py`、`*_warn_patterns.py`、`android_project_list.py`、`chrome_project_list.py`。

编译方式：
- 基于 Python 的工具，负责分析日志并输出告警报告。
- 用于构建校验、lint 类检查或诊断报告生成。

相关构建文件：
- `.pylintrc` 配置 Python lint。
- 各个模式模块定义不同告警领域的分类规则。
