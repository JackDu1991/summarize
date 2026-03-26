# build.prop 生成对照表

这份表按“文件 -> 参数 -> 影响字段”整理 build.prop 的生成链路。

## 总览

| 文件 | 关键参数 / 变量 | 影响字段 |
|---|---|---|
| [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `property_overrides_split_enabled`、`TARGET_*_PROP`、`ADDITIONAL_*_PROPERTIES`、`PRODUCT_*_PROPERTIES`、`PRODUCT_*_PROPERTY_BLACKLIST`、`PRODUCT_OEM_PROPERTIES`、`BUILD_FINGERPRINT`、`BUILD_THUMBPRINT`、`BUILD_VERSION_TAGS`、`BUILD_DISPLAY_ID` | 控制 `/system/build.prop`、`/vendor/build.prop`、`/product/etc/build.prop`、`/odm/etc/build.prop`、`/system_ext/etc/build.prop`、`/system/etc/ramdisk/build.prop` 的生成内容 |
| [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk) | `ADDITIONAL_SYSTEM_PROPERTIES`、`ADDITIONAL_VENDOR_PROPERTIES`、`BOARD_VNDK_VERSION`、`SANITIZE_TARGET` | 追加系统属性；在 split 打开时影响 vendor 属性去向；间接影响 `ro.vndk.version`、`persist.debug.dalvik.vm.core_platform_api_policy`、`ro.sanitize.*`、`ro.postinstall.fstab.prefix` |
| [build/core/product.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/product.mk) | `PRODUCT_SYSTEM_PROPERTIES`、`PRODUCT_SYSTEM_EXT_PROPERTIES`、`PRODUCT_VENDOR_PROPERTIES`、`PRODUCT_ODM_PROPERTIES`、`PRODUCT_PRODUCT_PROPERTIES`、`PRODUCT_SYSTEM_DEFAULT_PROPERTIES`、`PRODUCT_PROPERTY_OVERRIDES`、`PRODUCT_DEFAULT_PROPERTY_OVERRIDES` | 进入对应分区的 `build.prop`，尤其是 `ro.product.*`、分区私有属性、默认属性覆盖 |
| [build/core/config.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/config.mk) | `PRODUCT_FULL_TREBLE`、`BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED`、`PRODUCT_USE_VNDK`、`BOARD_VNDK_VERSION` | 决定是否默认启用属性分区拆分；间接影响 vendor 属性是否写入 `/vendor/build.prop` |
| [build/target/board/BoardConfigMainlineCommon.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/target/board/BoardConfigMainlineCommon.mk) | `BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true` | 显式打开 split；使 `ADDITIONAL_VENDOR_PROPERTIES` 进入 `/vendor/build.prop` |
| [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh) | `TARGET_BUILD_TYPE`、`TARGET_BUILD_FLAVOR`、`TARGET_DEVICE`、`PRODUCT_DEFAULT_LOCALE`、`PRODUCT_DEFAULT_WIFI_CHANNELS`、`PRIVATE_BUILD_DESC`、`BUILD_ID`、`BUILD_DISPLAY_ID`、`DATE`、`BUILD_USERNAME`、`BUILD_HOSTNAME`、`BUILD_NUMBER`、`PLATFORM_VERSION*`、`PLATFORM_SECURITY_PATCH`、`PLATFORM_BASE_OS`、`TARGET_CPU_ABI*`、`BOARD_BUILD_SYSTEM_ROOT_IMAGE`、`BOARD_USE_VBMETA_DIGTEST_IN_FINGERPRINT` | 直接生成 `buildinfo.prop`，写入大量 `ro.build.*`、`ro.product.cpu.*`、`ro.wifi.channels`、`ro.product.locale`、`ro.build.thumbprint`、`ro.build.description` 等字段 |
| [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py) | `ro.debuggable`、`persist.sys.usb.config`、`--sdk-version`、`disallowed_keys` | 后处理 build.prop：补 `persist.sys.usb.config`、移除不允许的属性、校验 GRF 属性和属性长度 |

## 分区对应关系

| 生成目标 | 主要来源文件 | 关键变量 / 文件 | 备注 |
|---|---|---|---|
| `/system/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `buildinfo.prop`、`system.prop`、`ADDITIONAL_SYSTEM_PROPERTIES`、`PRODUCT_SYSTEM_PROPERTIES`、`PRODUCT_SYSTEM_DEFAULT_PROPERTIES`、`PRODUCT_SYSTEM_PROPERTY_BLACKLIST` | `property_overrides_split_enabled` 关闭时，还可能吞入部分 vendor 属性 |
| `/vendor/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `vendor.prop`、`android_info.prop`、`ADDITIONAL_VENDOR_PROPERTIES`、`PRODUCT_VENDOR_PROPERTIES`、`PRODUCT_DEFAULT_PROPERTY_OVERRIDES`、`PRODUCT_PROPERTY_OVERRIDES`、`PRODUCT_VENDOR_PROPERTY_BLACKLIST` | 仅在 `property_overrides_split_enabled = true` 时接收拆分后的 vendor 属性 |
| `/product/etc/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `product.prop`、`PRODUCT_PRODUCT_PROPERTIES`、`ADDITIONAL_PRODUCT_PROPERTIES`、`PRODUCT_OEM_PROPERTIES` | 受 `PRODUCT_SHIPPING_API_LEVEL` 和 `BOARD_USES_PRODUCTIMAGE` 影响是否跳过 common properties |
| `/odm/etc/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `odm.prop`、`ADDITIONAL_ODM_PROPERTIES`、`PRODUCT_ODM_PROPERTIES` | ODM 分区属性 |
| `/system_ext/etc/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | `system_ext.prop`、`PRODUCT_SYSTEM_EXT_PROPERTIES` | system_ext 分区属性 |
| `/system/etc/ramdisk/build.prop` | [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) | 主要由 common build props 生成 | 作为 ramdisk/boot 侧属性输出 |

## 最容易影响 build.prop 的变量

| 变量 | 影响方向 | 典型影响字段 |
|---|---|---|
| `PRODUCT_SYSTEM_PROPERTIES` | 直接写入 system/build.prop | 系统级自定义属性 |
| `PRODUCT_VENDOR_PROPERTIES` | 直接写入 vendor/build.prop | vendor 分区属性 |
| `PRODUCT_PRODUCT_PROPERTIES` | 直接写入 product/build.prop | product 分区属性 |
| `PRODUCT_ODM_PROPERTIES` | 直接写入 odm/build.prop | odm 分区属性 |
| `PRODUCT_SYSTEM_EXT_PROPERTIES` | 直接写入 system_ext/build.prop | system_ext 分区属性 |
| `ADDITIONAL_SYSTEM_PROPERTIES` | 追加到 system/build.prop | `persist.debug.dalvik.vm.core_platform_api_policy`、`ro.sanitize.*`、`ro.postinstall.fstab.prefix` 等 |
| `ADDITIONAL_VENDOR_PROPERTIES` | 受 split 开关控制写入 system 或 vendor | `ro.vndk.version`、厂商属性 |
| `BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED` | 改变 vendor 属性归属 | 决定 vendor 属性是否从 system/build.prop 拆出 |
| `TARGET_SYSTEM_PROP` / `TARGET_VENDOR_PROP` / `TARGET_PRODUCT_PROP` / `TARGET_ODM_PROP` / `TARGET_SYSTEM_EXT_PROP` | 指定额外输入文件 | 对应分区的自定义 `*.prop` 内容 |
| `BUILD_ID`、`BUILD_NUMBER`、`PLATFORM_VERSION*`、`TARGET_BUILD_VARIANT`、`BUILD_VERSION_TAGS` | 生成 `ro.build.*` 系列字段 | `ro.build.id`、`ro.build.version.*`、`ro.build.tags`、`ro.build.flavor` |
| `TARGET_CPU_ABI*` | 生成 ABI 列表 | `ro.product.cpu.abi`、`ro.product.cpu.abi2`、`ro.*.product.cpu.abilist*` |

## 结论

如果只看“当前路径下哪个文件最影响 build.prop 生成”，优先级是：

1. [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk) —— 主生成规则。
2. [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh) —— 生成 `buildinfo.prop` 的内容。
3. [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py) —— 后处理和清理属性。
4. [build/core/product.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/product.mk) 与 [build/core/main.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/main.mk) —— 提供变量来源与默认值。
5. [build/core/config.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/config.mk) 和板级配置文件 —— 决定 split、VNDK 等开关。

## 按分区拆解

如果你想按输出分区继续看完整生成链路，可以直接读这份文档：

- [buildprop-partitions.md](buildprop-partitions.md)

## 按字段拆解

如果你想按具体字段名继续追踪来源，可以直接读这份文档：

- [buildprop-fields.md](buildprop-fields.md)