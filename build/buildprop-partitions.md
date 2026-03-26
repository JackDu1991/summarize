# build.prop 按分区拆解

这份文档按分区说明各自的 build.prop 是怎么生成的、用了哪些输入、主要受哪些变量影响。

## 1. `/system/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- `buildinfo.prop`：由 [build/make/tools/buildinfo.sh](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/make/tools/buildinfo.sh) 生成。
- `system.prop`：优先使用 `TARGET_SYSTEM_PROP`，否则使用设备目录下的 `system.prop`。
- `ADDITIONAL_SYSTEM_PROPERTIES`
- `PRODUCT_SYSTEM_PROPERTIES`
- `PRODUCT_SYSTEM_DEFAULT_PROPERTIES`（兼容旧变量）
- `PRODUCT_SYSTEM_PROPERTY_BLACKLIST`

### 关键影响参数
- `TARGET_BUILD_VARIANT`：决定 `ro.build.type`、`ro.build.flavor`、`BUILD_KEYS` 等字段。
- `BUILD_ID`、`BUILD_NUMBER_FROM_FILE`、`PLATFORM_VERSION*`、`PLATFORM_SDK_VERSION`：决定大部分 `ro.build.*` 字段。
- `TARGET_CPU_ABI*`：决定 `ro.product.cpu.*` 和 `ro.product.system.cpu.*` 类字段。
- `PRODUCT_DEFAULT_LOCALE`、`PRODUCT_DEFAULT_WIFI_CHANNELS`：决定 `ro.product.locale`、`ro.wifi.channels`。
- `BOARD_BUILD_SYSTEM_ROOT_IMAGE`、`BOARD_USE_VBMETA_DIGTEST_IN_FINGERPRINT`：影响 `ro.build.system_root_image` 和 build id 相关字段。

### 典型影响字段
- `ro.build.id`
- `ro.build.display.id`
- `ro.build.version.*`
- `ro.build.date*`
- `ro.build.tags`
- `ro.build.flavor`
- `ro.product.cpu.abi*`
- `ro.product.locale`
- `ro.wifi.channels`
- `ro.build.description`
- `ro.build.thumbprint`

## 2. `/vendor/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- `vendor.prop`：优先使用 `TARGET_VENDOR_PROP`，否则使用设备目录下的 `vendor.prop`。
- `android_info.prop`：由 `INSTALLED_ANDROID_INFO_TXT_TARGET` 转换得到。
- `ADDITIONAL_VENDOR_PROPERTIES`
- `PRODUCT_VENDOR_PROPERTIES`
- `PRODUCT_DEFAULT_PROPERTY_OVERRIDES`（split 开启时参与 vendor 输出）
- `PRODUCT_PROPERTY_OVERRIDES`（split 开启时参与 vendor 输出）
- `PRODUCT_VENDOR_PROPERTY_BLACKLIST`

### 关键影响参数
- `BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED`
  - 为 `true` 时，vendor 相关属性会写入 `/vendor/build.prop`。
  - 为 `false` 时，部分 vendor 属性仍可能留在 `/system/build.prop`。
- `BOARD_VNDK_VERSION`
  - 影响 `ro.vndk.version`。
- `PRODUCT_OEM_PROPERTIES`
  - 会通过 `oem.prop` import 影响 product/vendor 相关属性链。

### 典型影响字段
- `ro.vndk.version`
- `ro.build.expect.*`
- vendor 分区内的厂商属性

## 3. `/product/etc/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- `product.prop`：优先使用 `TARGET_PRODUCT_PROP`，否则使用设备目录下的 `product.prop`。
- `PRODUCT_PRODUCT_PROPERTIES`
- `ADDITIONAL_PRODUCT_PROPERTIES`
- `PRODUCT_OEM_PROPERTIES`

### 关键影响参数
- `PRODUCT_SHIPPING_API_LEVEL`
  - 与 30 的比较会影响是否跳过 common properties。
- `BOARD_USES_PRODUCTIMAGE`
  - 只要产品镜像存在，就会强制生成 common properties。

### 典型影响字段
- product 分区属性
- `import /oem/oem.prop ...` 相关条目

## 4. `/odm/etc/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- `odm.prop`：优先使用 `TARGET_ODM_PROP`，否则使用设备目录下的 `odm.prop`。
- `ADDITIONAL_ODM_PROPERTIES`
- `PRODUCT_ODM_PROPERTIES`

### 典型影响字段
- odm 分区属性

## 5. `/system_ext/etc/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- `system_ext.prop`：优先使用 `TARGET_SYSTEM_EXT_PROP`，否则使用设备目录下的 `system_ext.prop`。
- `PRODUCT_SYSTEM_EXT_PROPERTIES`

### 典型影响字段
- system_ext 分区属性

## 6. `/system/etc/ramdisk/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- 主要由 common build props 生成，没有独立的 `*.prop` 输入。

### 典型影响字段
- bootimage / ramdisk 相关的 common 属性

## 7. `/vendor_dlkm/etc/build.prop` 与 `/odm_dlkm/etc/build.prop`

### 生成文件
- [build/core/sysprop.mk](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/core/sysprop.mk)

### 主要输入
- 当前规则下是空属性集，属于显式输出目标。

### 典型影响字段
- 作为输出目标占位，便于分区目录结构保持一致。

## 8. 后处理阶段

无论哪个分区的 build.prop，最终都会经过 [build/tools/post_process_props.py](/home/dugq/Work/rk3588/source/RK3588_Android12.0_SDK_Release/build/tools/post_process_props.py) 的处理。

### 会被影响的内容
- `ro.debuggable=1` 时自动补 `persist.sys.usb.config=adb`
- 未设置 `persist.sys.usb.config` 时默认写入 `none`
- 违禁 key 会被删除
- 可选属性 `?=` 会被合并或替换
- GRF 属性会做合法性校验

## 继续追踪字段来源

如果你要按字段名继续看来源，可以读：

- [buildprop-fields.md](buildprop-fields.md)

## 结论

如果只看分区链路：
- `system` 的核心输入是 `buildinfo.prop + system.prop + system/product 相关变量`
- `vendor` 的核心分叉点是 `BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED`
- `product`、`odm`、`system_ext` 都是各自的 `*.prop + PRODUCT_*_PROPERTIES`
- 最后统一经过 `post_process_props.py` 处理