<div align="center">
  <img src="./launcher_icon.png" alt="Smartisan Launcher Maintained App Icon" width="124" height="124" />

  <h1>Smartisan Launcher Maintained</h1>

  <p><strong>锤子桌面复活</strong></p>
  <p>基于 <code>apktool</code> 直接维护 <code>com.smartisanos.home</code> 的反编译结果，修复新版 Android 上的安装、布局与主题兼容问题，并补齐旧桌面的可用主题资产。</p>

  <p>
    <a href="https://github.com/15255040419/smartisan-launcher/releases/latest">
      <img alt="Release" src="https://img.shields.io/github/v/release/15255040419/smartisan-launcher?display_name=tag&style=for-the-badge" />
    </a>
    <img alt="Android 16" src="https://img.shields.io/badge/Android-16%20Compatible-4CAF50?style=for-the-badge" />
    <img alt="Themes" src="https://img.shields.io/badge/Themes-35%20Assets-1E88E5?style=for-the-badge" />
    <img alt="apktool" src="https://img.shields.io/badge/apktool-smali%20Maintained-546E7A?style=for-the-badge" />
  </p>
</div>

> [!IMPORTANT]
> 本仓库是锤子桌面的非官方维护项目，与原厂无官方关联。仓库内容主要用于个人学习、兼容性分析和非商业研究。详细说明见 [NOTICE.md](NOTICE.md)。

## 项目亮点

- **动画精准分流**：精准区分“解锁屏幕”与“按主页键”，解决回桌面时误触发解锁动画的问题（通过 `isHomeKeyScrollToLeft` 标志位实现逻辑判定）。
- **Android 16 全面铺满**：彻底解决 Android 16 手势模式下底部 12px 的留缝问题，实现屏幕内容的真·全屏显示。
- **UI 布局深度纠偏**：修复主题详情页预览图垂直偏移问题，解除提示文字的挤压，1:1 还原经典居中比例。
- **自定义图标系统**：完整支持自定义图标上传与替换，补齐图标包管理的最后一块拼图。
- **锤子原味更新弹窗**：重绘并找回了经典的锤子风格在线更新界面，体验与原厂高度一致。
- **翻页动画性能优化**：修复翻页时可能出现的“闪一下回退”问题，确保动画立即生效且轨迹平滑。
- **独立生态**：更新服务器、主题下载完全迁移至私有 GitHub 仓库，不再依赖第三方，确保长期可用。

## 当前状态

- **[2026-04-19] v1.5.4.2.2 架构适配版**：实现 Android 16 底部留隙修复；完成“动画分流”判定逻辑；补齐自定义图标管理；全量中英文本地化支持。
- **主要兼容性修复记录**：集中在 [docs/compatibility-fixes.md](docs/compatibility-fixes.md)。
- **在线主题下载**：固定指向 `gh-proxy` + GitHub Release 的 `themes-v1`。
- **分身应用**：搜索页已可在主应用结果之外补充显示分身 / 双开应用结果，并支持直接打开，初步兼容多开环境。
- **壁纸自定义**：当设备安装毛玻璃或白雾主题时，设置页开放“桌面壁纸”入口，支持单独设置壁纸。

## 当前限制

- 桌面当前仍不支持直接在宫格中显示多开 / 分身应用图标。
- 当前不支持显示快捷方式图标。
- 当前不支持文件夹。
- 当前不支持在桌面空白区域下拉直接展开系统通知栏。
- “桌面壁纸”设置当前仅对毛玻璃 / 白雾主题生效；其他主题仍使用包内置壁纸。

## 已实测环境

- Redmi Note 12 Turbo / Evolution X / Android 16
- Xiaomi Pad 5 Pro / HyperOS 1.0.2.0 / Android 13
- Android 12 ~ 15 Emulator / 各种导航模式

## 开发者说明

### 环境要求
- `apktool` / JDK / `adb` / Android SDK `build-tools`

### 常用命令
- 调试构建：`./tools/build_and_install.sh`
- 构建 Release：`sh ./tools/build_release.sh`
- 同步版本：修改 `tools/release.conf` 后运行构建脚本即可。

## 版权与免责声明

- 原始应用及相关商标、名称、资源和版权归原权利人所有。本仓库仅供个人学习与非商业研究之用。
