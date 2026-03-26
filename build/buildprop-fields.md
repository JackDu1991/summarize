# build.prop 按字段拆解

这份文档按字段家族整理 build.prop 的来源，便于快速定位某个 `ro.*` 或 `persist.*` 属性来自哪里。

## 1. `ro.build.*`

| 字段 | 主要来源 | 相关文件 / 参数 |
|---|---|---|
| `ro.build.id` | `buildinfo.prop` | [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh)、`BUILD_ID`、`BOARD_USE_VBMETA_DIGTEST_IN_FINGERPRINT` |
| `ro.build.display.id` | `buildinfo.prop` | [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh)、`BUILD_DISPLAY_ID` |
| `ro.build.version.incremental` | `buildinfo.prop` | `BUILD_NUMBER` / `BUILD_NUMBER_FROM_FILE` |
| `ro.build.version.sdk` | `buildinfo.prop` | `PLATFORM_SDK_VERSION` |
| `ro.build.version.preview_sdk` | `buildinfo.prop` | `PLATFORM_PREVIEW_SDK_VERSION` |
| `ro.build.version.preview_sdk_fingerprint` | `buildinfo.prop` | `PLATFORM_PREVIEW_SDK_FINGERPRINT` |
| `ro.build.version.codename` | `buildinfo.prop` | `PLATFORM_VERSION_CODENAME` |
| `ro.build.version.all_codenames` | `buildinfo.prop` | `PLATFORM_VERSION_ALL_CODENAMES` |
| `ro.build.version.release` | `buildinfo.prop` / common build props | `PLATFORM_VERSION_LAST_STABLE` |
| `ro.build.version.release_or_codename` | `buildinfo.prop` / common build props | `PLATFORM_VERSION` |
| `ro.build.version.security_patch` | `buildinfo.prop` | `PLATFORM_SECURITY_PATCH` |
| `ro.build.version.base_os` | `buildinfo.prop` | `PLATFORM_BASE_OS` |
| `ro.build.version.min_supported_target_sdk` | `buildinfo.prop` | `PLATFORM_MIN_SUPPORTED_TARGET_SDK_VERSION` |
| `ro.build.date` / `ro.build.date.utc` | `buildinfo.prop` 与 common build props | `DATE_FROM_FILE` / `DATE` |
| `ro.build.type` | `buildinfo.prop` | `TARGET_BUILD_TYPE` |
| `ro.build.user` | `buildinfo.prop` | `BUILD_USERNAME` |
| `ro.build.host` | `buildinfo.prop` | `BUILD_HOSTNAME` |
| `ro.build.tags` | `buildinfo.prop` 与 common build props | `BUILD_VERSION_TAGS`、`TARGET_BUILD_VARIANT`、`DEFAULT_SYSTEM_DEV_CERTIFICATE` |
| `ro.build.flavor` | `buildinfo.prop` | `TARGET_BUILD_FLAVOR` |
| `ro.build.system_root_image` | `buildinfo.prop` | `BOARD_BUILD_SYSTEM_ROOT_IMAGE` |
| `ro.build.product` | `buildinfo.prop` | `TARGET_DEVICE` |
| `ro.build.description` | `buildinfo.prop` | `PRIVATE_BUILD_DESC` |
| `ro.build.thumbprint` | `buildinfo.prop` | `BUILD_THUMBPRINT`、`PRODUCT_OEM_PROPERTIES` |

## 2. `ro.product.*`

| 字段 | 主要来源 | 相关文件 / 参数 |
|---|---|---|
| `ro.product.brand` | common build props / 分区属性 | `PRODUCT_BRAND`、`PRODUCT_SYSTEM_BRAND` |
| `ro.product.device` | common build props / 分区属性 | `TARGET_DEVICE`、`PRODUCT_SYSTEM_DEVICE` |
| `ro.product.manufacturer` | common build props / 分区属性 | `PRODUCT_MANUFACTURER`、`PRODUCT_SYSTEM_MANUFACTURER` |
| `ro.product.model` | common build props / 分区属性 | `PRODUCT_MODEL`、`PRODUCT_SYSTEM_MODEL` |
| `ro.product.name` | common build props / 分区属性 | `TARGET_PRODUCT`、`PRODUCT_SYSTEM_NAME` |
| `ro.product.locale` | `buildinfo.prop` | `PRODUCT_DEFAULT_LOCALE`、`PRODUCT_LOCALES` |
| `ro.product.cpu.abi` / `ro.product.cpu.abi2` | `buildinfo.prop` | `TARGET_CPU_ABI`、`TARGET_CPU_ABI2` |
| `ro.*.product.cpu.abilist` | common build props | `TARGET_CPU_ABI_LIST`、`TARGET_CPU_ABI_LIST_32_BIT`、`TARGET_CPU_ABI_LIST_64_BIT` |
| `ro.product.first_api_level` 相关 | post process / 分区属性 | `PRODUCT_SYSTEM_PROPERTY_BLACKLIST`、`PRODUCT_VENDOR_PROPERTY_BLACKLIST`、GRF 属性校验 |

## 3. `ro.vndk.*` / `ro.board.*`

| 字段 | 主要来源 | 相关文件 / 参数 |
|---|---|---|
| `ro.vndk.version` | vendor/build.prop | `BOARD_VNDK_VERSION`、`PLATFORM_VNDK_VERSION` |
| `ro.board.first_api_level` | 设备 prop / post process | 设备属性定义、GRF 校验 |
| `ro.board.api_level` | 设备 prop / post process | 设备属性定义、GRF 校验 |

## 4. `persist.*`

| 字段 | 主要来源 | 相关文件 / 参数 |
|---|---|---|
| `persist.sys.usb.config` | post process 追加 | [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py)、`ro.debuggable` |
| `persist.debug.dalvik.vm.core_platform_api_policy` | main.mk 追加 | [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk)、`TARGET_BUILD_VARIANT` |
| `persist.*` 其他系统属性 | product / system 变量 | `ADDITIONAL_SYSTEM_PROPERTIES`、`PRODUCT_SYSTEM_PROPERTIES` 等 |

## 5. `ro.wifi.*` / `ro.sanitize.*` / 其他常见字段

| 字段 | 主要来源 | 相关文件 / 参数 |
|---|---|---|
| `ro.wifi.channels` | `buildinfo.prop` | `PRODUCT_DEFAULT_WIFI_CHANNELS` |
| `ro.sanitize.*` | main.mk 追加 | [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk)、`SANITIZE_TARGET` |
| `ro.postinstall.fstab.prefix` | main.mk 追加 | [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk) |
| `ro.build.expect.*` | vendor/android_info.prop | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)、`INSTALLED_ANDROID_INFO_TXT_TARGET` |

## 6. 直接影响字段的关键文件

| 文件 | 作用 |
|---|---|
| [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | 负责把字段写入各分区 `build.prop` |
| [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh) | 生成 `buildinfo.prop`，也就是 `ro.build.*` 的主要来源 |
| [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py) | 做最终清理、补默认值和校验 |
| [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk) | 追加系统级常用属性 |
| [build/core/product.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/product.mk) | 提供 `PRODUCT_*_PROPERTIES` 等字段来源 |

## 结论

如果你现在想定位某个字段：

- 先看是不是 `ro.build.*`：大多来自 [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh)
- 再看是不是分区属性：去 [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) 找对应的 `PRODUCT_*_PROPERTIES` / `ADDITIONAL_*_PROPERTIES`
- 最后看后处理：如果是 `persist.*`、`ro.debuggable`、或被删除/修正的属性，通常要看 [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py)