# Smartisan Launcher Maintained Design

**日期：** 2026-04-07

## 目标

把根目录中的 `com.smartisanos.home_27.apk` 解包成一个可长期维护的 `apktool` 工程，形态尽量接近 `handshaker-android-maintained`：

- 解包结果直接放在仓库根目录
- 后续主要通过修改 `smali` 和资源文件维护
- 提供最小可用的构建、签名、安装脚本
- 提供最小说明文档和免责声明

## 范围

本阶段只做工程化初始化，不做具体功能修复：

- 使用 `apktool` 反编译 APK
- 保留原始 APK 在仓库根目录
- 新增 `tools/build_and_install.sh`
- 新增 `tools/build_release.sh`
- 新增 `README.md`
- 新增 `NOTICE.md`
- 新增 `.gitignore`

不在本阶段处理：

- 具体兼容性修复
- 包名修改
- 多套构建体系
- CI、自动发布

## 工程结构

解包后根目录保留 apktool 的标准输出：

- `AndroidManifest.xml`
- `apktool.yml`
- `smali/`、`smali_classes2/`（如果 APK 存在多 dex）
- `res/`
- `assets/`
- `lib/`
- `unknown/`
- `original/`

补充维护文件：

- `tools/`
- `build/`
- `.local/`
- `README.md`
- `NOTICE.md`
- `.gitignore`

## 构建与签名

### 调试构建

`tools/build_and_install.sh` 负责：

1. `apktool b` 回编译
2. 在 `build/signing/` 下生成本地 debug keystore
3. 用 `jarsigner` 签名
4. 如果存在 `adb`，尝试安装到设备

### 发布构建

`tools/build_release.sh` 负责：

1. 读取 `tools/release.conf`
2. 读取 `.local/signing/release.env`
3. `apktool b` 回编译
4. 优先使用 `zipalign + apksigner`
5. 输出 release APK 到 `build/release/`

脚本保持简单，不做复杂环境抽象；只额外兼容本机已有的 Android SDK `build-tools` 路径。

签名目录约定与本地 `handshaker-android-maintained` 保持一致，统一使用 `.local/signing/`。

## 安装策略

维护版保持原包名 `com.smartisanos.home`。

由于维护版与原始 APK 的签名不同，首次安装前必须先卸载原版。之后只要一直使用同一把维护版签名，即可在维护版之间覆盖升级。

## 文档与分发

- `README.md` 说明仓库结构、环境要求、常用命令和首次安装限制
- `NOTICE.md` 说明版权归属、仓库用途和分发风险
- 当前仓库不附加通用开源许可证

## 验证

本阶段完成标准：

1. `apktool d` 成功解包
2. `apktool b` 成功回编译
3. 调试脚本可生成已签名 APK
4. 发布脚本可在本机找到 `zipalign/apksigner`
