# Smartisan Launcher Bootstrap Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 把根目录 APK 初始化为可维护的 apktool 仓库，并完成首次可验证的回编译与签名。

**Architecture:** 直接在仓库根目录保存 apktool 解包结果，使用两个最小 shell 脚本分别处理调试构建和发布构建。脚本优先复用本机已有工具，不引入额外工程层，并尽量与本地 `handshaker-android-maintained` 的目录和签名约定保持一致。

**Tech Stack:** apktool, shell, jarsigner, Android build-tools

---

### Task 1: 解包 APK 到仓库根目录

**Files:**
- Create: `AndroidManifest.xml`
- Create: `apktool.yml`
- Create: `smali/`
- Create: `res/`
- Create: `assets/`
- Create: `original/`

- [ ] **Step 1: 运行解包命令**

```sh
apktool d -f com.smartisanos.home_27.apk -o .
```

- [ ] **Step 2: 检查关键输出目录**

Run: `find . -maxdepth 1 \( -name 'AndroidManifest.xml' -o -name 'apktool.yml' -o -name 'smali*' -o -name 'res' -o -name 'assets' -o -name 'original' \) | sort`
Expected: 输出 apktool 解包后的关键文件和目录

### Task 2: 添加最小构建与发布脚本

**Files:**
- Create: `tools/build_and_install.sh`
- Create: `tools/build_release.sh`
- Create: `tools/release.conf`

- [ ] **Step 1: 编写调试构建脚本**

```sh
#!/bin/sh
set -eu

# 通过 apktool 回编译，并用本地 debug keystore 签名。
```

- [ ] **Step 2: 编写发布构建脚本**

```sh
#!/bin/sh
set -eu

# 读取 release 配置，优先使用 zipalign 与 apksigner 生成发布包。
```

- [ ] **Step 3: 添加默认 release 配置模板**

```sh
RELEASE_BASE_VERSION=0.1.0
RELEASE_SUFFIX=
RELEASE_VERSION_CODE=1
```

### Task 3: 添加最小文档

**Files:**
- Create: `README.md`
- Create: `NOTICE.md`
- Create: `.gitignore`

- [ ] **Step 1: 说明仓库结构和使用方式**

```md
# smartisan-launcher-maintained

基于 apktool 的锤子桌面维护仓库。
```

- [ ] **Step 2: 写入免责声明**

```md
# 版权与免责声明
```

- [ ] **Step 3: 忽略构建和本地签名产物**

```gitignore
build/
.local/
```

### Task 4: 验证首次构建链路

**Files:**
- Modify: `tools/build_and_install.sh`
- Modify: `tools/build_release.sh`

- [ ] **Step 1: 运行调试构建**

Run: `./tools/build_and_install.sh`
Expected: 生成已签名调试 APK；若无 adb 或无设备则跳过安装

- [ ] **Step 2: 运行发布构建**

Run: `./tools/build_release.sh`
Expected: 生成 release APK，且脚本能找到 zipalign 与 apksigner

- [ ] **Step 3: 记录实际验证结果**

Run: `git status --short`
Expected: 显示解包产物、脚本与文档变更
