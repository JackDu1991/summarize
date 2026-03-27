# build.sh 中自动更新 `BUILD_NUMBER` 的修改说明

## 目标

当前 `build.sh` 依赖构建系统中已有的 `BUILD_NUMBER` 值，导致在未执行 `make clean` 的情况下，多次编译可能仍然沿用旧值。

本方案的目标是在每次执行 Android 编译时，由 `build.sh` 主动生成新的 `BUILD_NUMBER`，从而使对应日期或构建标识自动变化。

## 现状说明

`build.sh` 中原有逻辑为：

```bash
BUILD_NUMBER=`get_build_var BUILD_NUMBER`
```

该写法会从当前构建环境中读取已有值。如果该值没有变化，后续生成的 `build.prop` 和 `ro.build.display.id` 也不会变化，因此会出现只有在 `make clean` 后重新编译，`BUILD_NUMBER` 才更新的现象。

## 修改原则

建议在调用 `make` 之前，由 `build.sh` 显式设置 `BUILD_NUMBER`，并导出给后续构建流程使用。这样可以避免依赖中间产物是否被清理，也不需要依赖 `make clean` 触发重新计算。

## 推荐方案

推荐在 `build.sh` 中使用时间戳、日期或 CI 流水号作为 `BUILD_NUMBER` 的来源。

### 方案一：每次构建都更新

适用于开发调试和 CI 构建，保证每次编译都有不同的 `BUILD_NUMBER`。

```bash
export BUILD_NUMBER=$(date +%Y%m%d%H%M%S)
```

该格式包含年月日时分秒，可以确保同一日内多次构建也不相同。

### 方案二：仅按日期变化

适用于只希望每天变化一次的场景。

```bash
export BUILD_NUMBER=$(date +%Y%m%d)
```

该格式只包含年月日，因此同一天内多次编译会保持一致。

### 方案三：日期加流水号

适用于既希望按日期变化，又希望同一天内多次构建可区分的场景。

```bash
export BUILD_NUMBER=$(date +%Y%m%d)-${CI_BUILD_ID:-001}
```

如果存在 CI 流水号，可以优先使用 CI 提供的编号，以增强构建可追踪性。

## 插入位置

建议将 `BUILD_NUMBER` 的重新生成逻辑放在以下位置：

1. `source build/envsetup.sh >/dev/null` 之后
2. 第一次调用 `get_build_var` 之前
3. 任何 `make` 或 `lunch` 之前

这样可以确保后续调用读取到的是新的 `BUILD_NUMBER`，而不是旧值。

## 建议修改方式

将原来的：

```bash
BUILD_NUMBER=`get_build_var BUILD_NUMBER`
```

替换为：

```bash
export BUILD_NUMBER=$(date +%Y%m%d%H%M%S)
```

如果只希望日期变化，则使用：

```bash
export BUILD_NUMBER=$(date +%Y%m%d)
```

## 为什么这样有效

Android 构建系统在生成 `build.prop` 时，会将 `BUILD_NUMBER` 参与到构建描述信息中。只要 `BUILD_NUMBER` 发生变化，后续生成的 `build.prop` 和 `ro.build.display.id` 等字段也会随之变化。

因此，只要在 `build.sh` 中每次构建前主动更新 `BUILD_NUMBER`，就可以避免依赖 `make clean` 才刷新结果的问题。

## 注意事项

1. 如果是发布构建，建议使用 CI 流水号或受控编号，而不是纯时间戳。
2. 修改 `BUILD_NUMBER` 可能影响构建指纹、OTA 包判断和版本比对流程。
3. 如果 `build.sh` 还会被其他脚本调用，建议统一由同一个入口设置 `BUILD_NUMBER`，避免不同构建路径产生不一致结果。

## 总结

要保证每次编译后 `BUILD_NUMBER` 自动变化，关键不是清理中间文件，而是在 `build.sh` 中于构建开始前主动生成新的 `BUILD_NUMBER`，并将其导出给后续构建流程。推荐使用时间戳、日期加流水号或 CI 编号作为来源，以确保构建结果可区分且可追踪。