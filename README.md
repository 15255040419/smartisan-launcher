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

- **解锁动画分流**：精准区分“解锁屏幕”与“按主页键”，解锁时优雅展开，回桌面时秒速触达，完美解决动画误触发带来的卡顿感。
- **Android 16 深度适配**：修复因状态栏、手势导航导致的顶部/底部留缝（12px）问题，壁纸与图标重归全屏铺满状态。
- **拟物化弹窗回归**：找回并重构了经典的锤子风格在线更新弹窗，告别冷冰冰的系统原生弹窗。
- **主题几何对齐**：修复主题详情页预览图受提示文字挤压而导致的重心偏移问题，还原 1:1 视觉比例。
- **天气入口适配**：优先拉起系统或已安装的天气应用，解决旧接口失效导致的“数据获取失败”弹出。
- **自定义图标逻辑补全**：补齐图标修改核心逻辑，支持第三方图标包自定义修改图标，且杜绝由于类缺失导致的 VerifyError 闪退。
- **独立生态**：更新服务器、主题下载完全迁移至私有 GitHub 仓库，不再依赖第三方，确保长期可用。

## 当前状态

- **[2026-04-19] v1.5.4.2.2.1.1.1.1.3 逻辑补完版**：通过 `isHomeKeyScrollToLeft` 标志位判定逻辑，成功实现解锁动画与普通导航的分离；彻底抹平 Android 16 底部留缝；补全并稳定了自定义图标修改逻辑。
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
