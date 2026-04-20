# Smartisan Launcher Maintained Compatibility Fixes

本文件按日期记录维护版主线里已经落地的兼容性修复与关键可用性修复。
 
## 2026-04-20 检查更新系统稳定性与灵敏度修复 (v1.5.4.4)

### 现象

- **红点不消失**：安装最新版后，设置界面的“检查更新”红点依然存在，必须手动点击一次才会消失。
- **功能闪退**：点击“检查更新”按钮时，Launcher 偶发闪退回到桌面。
- **无提示文案**：在已经是最新版的情况下，点击检查更新没有任何 Toast 提示。

### 根因

1.  **权限越界**：`ApkUpdater` 试图直接访问 `Version` 类中的私有字段 `code`，在 Android 运行时触发了 `IllegalAccessError` 导致崩溃。
2.  **逻辑污染**：在注入红点清理代码时，误用了存放 VersionCode 的寄存器 `v11` 进行逻辑跳转判定，导致程序错误地进入了“非法版本”判定分支。
3.  **缺乏比对**：旧逻辑仅依赖网络请求结果，没有在本地实时比对当前版本与已发现版本的差异。

### 修复方案

- **权限开放**：将 `smali/com/smartisan/updater/Version.smali` 中的 `code` 和 `needUpdate` 字段权限从 `private` 修改为 `public`。
- **智能校验**：修改 `smali/com/smartisanos/home/settings/view/SettingMainActivity.smali`，在显示红点前增加 VersionCode 实时比对：若 `当前版本 >= 已发现版本`，则自动清理标记位。
- **逻辑重构**：修正 `smali/com/smartisan/updater/ApkUpdater.smali` 中的寄存器冲突，在跳转前重新加载 `isNeedUpdate` 状态，确保“暂无更新”的 Toast 能被正确触发。

### 结果

- **版本更新**：v1.5.4.4
- **体验提升**：红点显示逻辑变得极其灵敏，安装更新后自动消失；修复了所有已知的检查更新闪退问题。

## 2026-04-20 解锁动画稳定性及手动开关实现

### 现象

- 部分 Android 12+ 机型解锁进入桌面时，缩放动画可能卡在中间状态（卡死）
- 解锁动画稳定性受系统 `SurfaceFlinger` 与 Launcher 状态机同步影响，难以在 Smali 层彻底修复底层死锁

### 修复方案

- **增加手动开关**：在“桌面设置”中增加“解锁动画”开关。
- **稳定性增强**：允许用户彻底关闭该动画，绕过系统同步导致的卡死问题。
- **UI 改动**：
    - `res/layout/setting_main.xml`：新增 `SettingItemSwitch`。
    - `res/values/strings.xml`：新增中英文文案。
- **逻辑改动 (内部修改细节)**：
    - **UI 绑定**：在 `SettingMainActivity.smali` 的 `onCreate` 中注册 `SettingItemSwitch` 回调，并通过 `SettingDB` 持久化布尔值字符串（"true"/"false"）。
    - **初始化同步**：修改 `LauncherSettings.smali` 的 `initSettingDB`，若配置不存在则默认注入 `"false"` 字符串。
    - **底层解耦（重点）**：在 `ApplicationProxy$9.smali` 中使用了“手术刀”式的修改，定位到处理 `ACTION_KEYGUARD_ON` 和 `ACTION_KEYGUARD_TO_DISMISS` 的广播接收器，**删除了其中强制将 `Constants.ENABLE_UNLOCK_ANIMATION` 设为 `1` 的 `sput-boolean` 指令**，确保全局变量不再被系统广播恶意重置。
    - **类型安全**：更新 `ApplicationProxy.smali` 的 `ContentObserver` 回调，将原本失效的 `readInt` 替换为 `readString` 并配合字符串比较，实现了对新存储格式的实时政治响应。

### 结果

- **版本更新**：v1.5.4.3
- **默认状态**：解锁动画默认设为 **关闭**，极大提升了在第三方 Android 12+ 系统上的启动稳定性。
- **自主可控**：用户可以根据机型兼容性自主决定是否开启解锁动画，彻底避开无法预期的系统死锁问题。


### 现象

- Android 16 手势导航下，Launcher 主窗口已经是全屏，但首页顶部 / 底部仍会出现细缝
- 左右滑页时，页面内容像被整体压短了一点

### 根因

- `ApplicationProxy.getScreenSize()` 的旧兼容路径会在窗口本身已经是全高时，继续按底部系统 inset 缩短 `window_height`
- 首页、`dock`、页面动画都会消费 `Constants.window_height`，源头高度一旦偏小，整页坐标系就会一起收缩

### 修复

- `smali/com/smartisanos/launcher/ApplicationProxy.smali`
  - 保留 `realHeight` / `screenHeight` 采集
  - 当 Launcher 窗口已经是全高时，不再额外扣减底部系统 inset
  - 只修正 `window_height` 定义，不改 `status_bar_height` 语义，也不重做整套 `WindowInsets` 架构

### 结果

- 首页背景和内容重新铺满
- 不需要为不同屏幕尺寸写死数值

### 验证

- `./tools/build_and_install.sh`
- Android 12 模拟器验证：首页顶部 / 底部留缝消失，手势 / 三键两种导航模式均恢复正常
- Android 15 模拟器验证：首页内容铺满，未再出现底部垃圾桶露出
- Android 16 真机验证：首页顶部 / 底部细缝消失

## 2026-04-09 Android 16 编辑 / 排序 / 拖拽模式连续性修复

### 现象

- 进入多页模式后，顶部两页标题被挡住
- 预览页和图标出现纵向拉伸
- 进入排序 `dock` 时，整页继续下沉，顶部出现黑条
- 长按页面拖拽会再次触发同样的状态栏 / 页面下移问题
- 在恢复无黑条后，顶部“已选择 [x/x] 个应用程序”文案又丢失

### 根因

- 多页预览布局仍带着旧几何假设，首行没有给标题栏预留足够高度
- 预览缩放的 X / Y 分别取值，Android 16 长屏上更容易出现纵向拉伸
- 编辑、排序、长按拖拽等特殊模式里，多条路径仍会调用 `MainView.hideStatusBar()`，切换 `FLAG_FULLSCREEN`，导致系统状态栏与自绘场景坐标突然脱节
- 选中计数文案在排序模式动画完成后没有再刷新一次，容易被后续状态切换覆盖

### 修复

- `smali/com/smartisanos/launcher/animations/PageViewAnimation.smali`
  - 预览缩放统一使用 `Constants.pageSizeScale[targetMode].x`，避免 X / Y 非等比缩放
  - 4 页 / 9 页预览首行补回 `page_title_height + title_page_spacing` 预留高度
- `smali/com/smartisanos/launcher/view/SettingButton.smali`
  - 进入排序模式时不再调用 `hideStatusBar()`，保留当前非 fullscreen 的连续性
- `smali/com/smartisanos/launcher/view/Cell.smali`
- `smali/com/smartisanos/launcher/view/FloatPageNode.smali`
- `smali/com/smartisanos/launcher/view/SwitchPageNode.smali`
  - 去掉长按拖拽路径中的 `hideStatusBar()` 调用，避免再次触发整页下移 / 黑条
- `smali/com/smartisanos/launcher/view/SettingButton$3.smali`
  - 排序模式进入完成后补一次 `updateStatusBarText(0)`，恢复顶部选中计数文案

### 结果

- 多页顶部标题不再被挡住
- 预览页和图标不再被拉伸
- 排序模式和长按拖拽不再触发黑条或整页下移
- 顶部选中计数文案重新可见
- 这部分保持“不重新引入 fullscreen 切换”的原则，优先保证模式切换连续性

### 验证

- `./tools/build_and_install.sh`
- Android 16 真机验证：
  - 多页预览标题显示正常
  - 排序 `dock` 不再继续下沉
  - 长按页面拖拽后不再出现黑条 / 页面位移
  - 选中计数文案已恢复

## 2026-04-09 默认桌面设置入口兼容修复

### 现象

- 在新版 Android 上打开“设为默认桌面”提示弹窗后，点击“确定”没有任何反应
- 用户会误以为 Launcher 不支持设为默认桌面

### 根因

- 旧桌面依赖较早系统版本的默认桌面设置跳转路径
- 新版 Android 下原始 intent 处理链路不再稳定，导致确认按钮点击后直接失效

### 修复

- 补齐新版 Android 下可用的默认桌面设置跳转兼容逻辑
- 优先走系统当前仍可用的设置入口，避免只绑定单一旧路径

### 结果

- 点击确认按钮后可以正常进入系统默认桌面相关设置页
- 该修复按新版 Android 通用行为做兼容，不依赖 MIUI 专属实现

### 验证

- Android 16 真机验证：确认按钮可正常跳转
- 多次冷启动 / 热启动后复测，未再出现点击无响应

## 2026-04-09 搜索联系人运行时权限兼容修复

### 现象

- 新版 Android 首次进入搜索页时，如果还没有授予 `READ_CONTACTS`，联系人索引初始化可能异常
- 搜索模块旧逻辑会默认直接访问联系人数据

### 根因

- 旧搜索模块没有适配新版 Android 的运行时权限模型
- 在没有联系人权限时仍继续初始化联系人索引与监听，容易导致异常路径

### 修复

- 搜索页首次进入时，先判断是否已授予 `READ_CONTACTS`
- 未授权时先发起运行时权限请求，再决定是否初始化联系人索引和监听

### 结果

- 首次进入搜索页不再因为联系人权限缺失而异常
- 未授权时应用搜索仍可正常使用；授权后联系人索引可立即初始化并参与搜索

### 验证

- 清除应用数据后复测：首次进入搜索页会先请求联系人权限
- 拒绝权限后复测：应用搜索正常，联系人索引不再异常初始化

## 2026-04-10 天气入口兼容修复

### 现象

- 点击天气图标时，旧桌面会提示当前无法获取天气数据
- 旧天气接口在现在的系统和网络环境下基本已经失效

### 根因

- 原始天气入口依赖锤子时代的天气数据链路
- 当前环境下旧接口不可用，继续沿用只会直接报错

### 修复

- 不再把天气图标继续作为旧天气数据入口
- 调整为优先拉起系统自带天气应用，未命中时再尝试已安装的其他天气应用

### 结果

- 天气图标现在优先承担“天气应用入口”的角色
- 不再直接提示旧天气数据获取失败

### 验证

- 已安装天气应用场景下验证：点击图标可直接拉起可用天气 App
- 无锤子天气服务场景下验证：不再出现旧接口报错 toast

## 2026-04-10 四指切换主题卡住修复

### 现象

- 四指左右滑动切换主题时，有时会提示“正在加载主题”并一直停留
- 用户体感像是主题切换卡死，但实际主题切换链路已经开始执行

### 根因

- 主题切换开始后，旧的延迟“加载中”弹窗任务仍可能迟到触发
- 迟到弹窗覆盖了真实切换状态，造成“看似一直在加载”的假象

### 修复

- 在主题切换已经开始后，阻止旧的延迟加载弹窗继续补弹
- 保留原有四指切换交互，不重做整套主题切换流程

### 结果

- 四指切换主题仍保持原交互
- 不再因为迟到的加载弹窗制造“卡死”假象

### 验证

- Android 16 真机连续多次四指左右切换主题验证
- 主题成功切换后未再出现长时间停留在“正在加载主题”

## 2026-04-11 搜索分身 / 双开结果补充支持

### 现象

- 旧桌面桌面页仍按单用户模型工作，只会显示主应用
- 搜索页此前也只能搜到主应用，无法直接定位和启动分身 / 双开实例

### 根因

- 旧搜索结果数据源只读取主应用索引
- 分身实例需要额外通过 `LauncherApps` 和 `UserHandle` 做 profile-aware 查询与启动

### 修复

- 在应用搜索结果基础上追加分身 / 双开应用补充查询
- 搜索命中到同包分身实例时，追加带 `（分身）` 标记的结果项
- 点击结果后通过 `LauncherApps` 按对应 `UserHandle` 启动实例

### 结果

- 搜索页现在可以在主应用结果之外补充显示分身 / 双开结果
- 当前支持范围只覆盖搜索页，不代表桌面首页、文件夹或快捷方式区域已经支持直接展示分身图标

### 验证

- Android 16 真机验证：搜索结果可补充显示并直接打开分身实例
- 搜索结果点击后不会再误打开主应用

## 2026-04-11 改进版图标同步补强

### 现象

- 某些已下载的改进版图标在状态刷新、包变化或重新进入桌面后会回退成默认图标

### 根因

- 旧桌面原有的图标同步与缓存回填触发不够完整
- 当旧接口命中不稳定或状态广播未完整触发时，`RedirectIconInfo` 和桌面实际 `iconData` 之间会出现短暂不同步

### 修复

- 补强“旧接口优先，新接口按包名兜底”的图标回填链路
- 同时补强缓存状态同步触发，减少已存在的改进版图标被默认图标覆盖

### 结果

- 已命中的改进版图标在状态刷新后更不容易回退
- 图标设置页、桌面图标与搜索普通应用结果的同步一致性有所提升

### 验证

- Android 16 真机验证：已下载改进版图标在刷新后不再频繁回退默认图标
- 重启 Launcher 后复测，图标同步状态保持正常

## 2026-04-16 检查更新弹窗拟物化重构与逻辑修复

### 现象

- 原有的“检查更新”弹窗使用系统原生 `AlertDialog`，与锤子拟物化设计脱节。
- 即使安装了最新版，设置界面依然存在“鬼影”红点。
- Smali 注入曾因寄存器溢出导致 `java.lang.VerifyError`。

### 根因

- **UI**：缺乏自定义布局和特定的样式背景。
- **红点**：检测逻辑中没有覆盖“无版本更新”时的状态清理分支。
- **崩溃**：局部变量声明（`.locals`）过大或覆盖了 `this` 指针（`p0`），导致 Dalvik 虚拟机拒绝加载类。

### 修复

- **UI 层面**：新增 `smartisan_update_dialog.xml`，实现拟物化材质、金属分割线和经典按钮质感。
- **逻辑层面**：
  - 在 `ApkUpdater.smali` 中增加状态强制同步，不论是否更新都刷新红点标志位。
  - 严格管控 Smali 寄存器使用（`.locals 10`），避开参数寄存器冲突，确保 `p0` 不被覆盖。
  - 通过事件桥接实现自定义 UI 与原生 `DialogInterface` 逻辑的对接。

### 结果

- 完成了还原度极高的拟物化更新补丁提示界面。
- 彻底根除了“红点无法自动消失”的 Bug。
- 修复了由于代码注入导致的类校验错误。

### 验证

- Android 16 真机验证：弹窗视觉效果精美且点击响应正常。
## 2026-04-19 Android 16 底部布局留缝彻底清除

### 现象

- 在 Android 16 全面屏手势模式下，桌面底部图标下方会出现约 12px 的多余空白（黑条/留缝）。
- 该问题导致壁纸无法完全垂直铺满，视觉上不连贯。

### 根因

- `ApplicationProxy.smali` 在计算 `window_height` 时，读取 `display_metrics` 数组的索引发生偏移。
- 原逻辑使用的是寄存器 `v7`（在某些环境下不再指向物理高度），导致高度计算值偏小。

### 修复

- **精准定位索引**：强制使用 `0x3` 索引从系统 Metrics 数组中读取物理真实高度。
- **修正高度分发**：确保 `Constants.window_height` 获得最准确的原始数据，不再被底部 Inset 逻辑误导进行二次扣减。

### 结果

- Android 16 下底部留缝彻底消失，整体布局与屏幕底边缘契合。

---

## 2026-04-19 解锁动画与 Home 键返回逻辑解耦

### 现象

- 每次从第三方应用按 Home 键返回桌面时，会触发本应只有解锁才出现的图标展开缩放动画。
- 频繁误触导致用户不仅感到视觉疲劳，且按主页键回桌面的反馈变慢（受动画时长影响）。

### 根因

- 上游补丁在 `onResume` 中无差别调用了 `postEmergencyUnlockEvent()`，导致任何形式的桌面显示都会挂起一个 0.1s 后执行的动画请求。
- 缺乏对“回场原因”的精准身份核验。

### 修复

- **引入标志位校验**：利用 Launcher 已有的 `isHomeKeyScrollToLeft` 变量。
- **逻辑重构**：在 `onResume` 的 Smali 逻辑中插入交叉检查点。如果 `isHomeKeyScrollToLeft` 为 `true`（1），则强制执行 `goto :goto_0` 跳过所有动画与初始化逻辑；只有为 `false`（0）且设备非引导状态时才跳向 `cond_12` 触发动画。

### 结果

- **解锁** = 动画播放（优雅）。
- **按 Home 键** = 直达桌面（秒开）。
- 通过寄存器透明的标签跳转设计，彻底杜绝了 Smali 注入常见的 `VerifyError` 崩溃。

---

## 2026-04-19 主题预览页视觉重心偏移修复

### 现象

- 主题详情页的手机预览图中心向下位移，不再位于屏幕正中，视觉上感觉沉闷。

### 根因

- 上游新增的 `theme_manual_install_tip_view`（提示文本）占据了上方空间，而预览图 FrameLayout 被约束在其下方（`layout_below`）。
- 导致 Smali 动态计算的居中高度被提示文本的高度和间距“推离”了物理中心。

### 修复

- **解除布局依赖**：在 `activity_theme_item.xml` 中，将 `phone_detail_preview` 的 `layout_below` 改为直接指向 `view_title`（标题栏）。
- **自由对齐**：让提示文本处于“悬挂”状态，不参与挤压预览图的空间分配，从而让 Smali 的黄金居中算法恢复准确性。

### 结果

- 主题预览页恢复完美垂直居中表现。

---

## 2026-04-19 选择翻页动画闪退问题修复

### 现象

- 在设置页选择任意翻页动画（旋转图标、百叶窗、卡片等）时，界面瞬间黑屏闪退，直接回到上级设置列表。
- 重复操作必定复现，且选中的动画并未实际生效。

### 根因

**`LauncherSettings.updateAndNotice()` 调用了一个从未在 `AndroidManifest.xml` 中声明的 ContentProvider authority。**

```
java.lang.SecurityException: Failed to find provider com.smartisanos.home.settings for user 0;
expected to find a valid ContentProvider for this authority
    at com.smartisanos.launcher.data.LauncherSettings.updateAndNotice(...)
    at com.smartisanos.home.settings.view.PageFlipAnimChooser$2.onItemClick(...)
```

- `ApplicationProxy.smali` 的静态初始化块中，`setting_base_uri` 被写死为 `content://com.smartisanos.home.settings/`。
- 这一 URI 在原始锤子 OS（Android 4.x–7.x）上对应一个系统内置提供者，系统并不严格校验。
- Android 11 引入了严格的 ContentProvider 包可见性校验，若 URI authority 未在 `AndroidManifest.xml` 注册，`ContentResolver.notifyChange()` 会直接抛出 `SecurityException`，导致进程崩溃。

### 修复

- 文件：`smali/com/smartisanos/launcher/ApplicationProxy.smali`
- 将 `setting_base_uri` 切换为桌面自身已在 `AndroidManifest.xml` 中合法注册的提供者 authority：

```diff
- const-string v0, "content://com.smartisanos.home.settings/"
+ const-string v0, "content://com.smartisanos.launcher.exportprovider/"
```

`com.smartisanos.launcher.exportprovider` 对应 `LauncherCallProvider`，拥有有效的读权限声明，可以被 `notifyChange()` 合法访问。

### 结果

- 选择任何翻页动画后不再崩溃，动画效果立即生效。
- 无副作用：`exportprovider` authority 仅作为广播通道以触发 `ContentObserver`，并不真正提供数据查询。

### 验证

- ADB 抓取 logcat 确认 `SecurityException` 消失。
- Android 16 真机验证：选择六种翻页动画，均正常切换无闪退。

---

## 2026-04-19 Launcher$10 紧急解锁事件注入修复

### 现象

- 按 Home 键返回桌面时，会再次播放完整的解锁缩放动画（与按电源键解锁的效果一样）。
- 从设置界面返回桌面同样触发解锁动画，视觉上有明显"闪一下"。

### 根因

**`Launcher$10.smali`（`createEmergencyUnlockEvent()` 的匿名内部事件类）的 `run()` 方法被注入了强制初始化逻辑。**

维护版在原先仅做条件检查的代码段中额外插入了：

```smali
# 注入内容（错误）
sget-boolean v1, .../Constants;->ENABLE_UNLOCK_ANIMATION:Z
if-nez v1, :cond_enable_ready
const/4 v1, 0x1
sput-boolean v1, .../Constants;->ENABLE_UNLOCK_ANIMATION:Z   # 强制设为 true
:cond_enable_ready
if-nez v0, :cond_init_done
invoke-virtual {v0}, .../PageView;->initUnlockScreenAnimation()V  # 强制重新初始化
:cond_init_done
```

这导致无论何时 `postEmergencyUnlockEvent()` 被触发（包括每次普通 onResume），都会：
1. 把 `ENABLE_UNLOCK_ANIMATION` 强制设为 `true`。
2. 绕过 `isUnlockAnimationInit()` 的自然防重复机制。
3. 重新初始化动画并强制播放。

### 修复

- 文件：`smali/com/smartisanos/home/Launcher$10.smali`
- 完整恢复为 `v1.5.1-r3` 基线逻辑（参考 git tag `122df65`）：

```smali
# 正确逻辑（v1.5.1-r3 原版）
invoke-virtual {v0}, .../AnimationController;->isUnlockAnimationInit()Z
move-result v0
if-eqz v0, :cond_0          # 未初始化 → 直接返回，不播放
sget-boolean v0, .../Constants;->ENABLE_UNLOCK_ANIMATION:Z
if-eqz v0, :cond_1          # 动画被禁用 → 强制结束现有动画
invoke-virtual {v0}, .../AnimationController;->playUnlockAnimation()V
```

原版通过 `isUnlockAnimationInit()` 作为天然防重播的栅栏：普通 Home 键回退时该值为 `false`，直接走 `:cond_0` 返回，完全不进入动画逻辑。

### 结果

- 按 Home 键 / 从设置返回桌面：无解锁动画，直接显示桌面。
- 锁屏后真正解锁：正常播放解锁动画。
- 行为与原版 v1.5.1-r3 完全一致。

### 验证

- Android 16 真机验证：连续高频按 Home 键，无多余动画。
- 在设置修改翻页动画后返回，不再出现解锁动画闪现。

## 2026-04-19 主题下载运行时存储权限恢复 (v1.5.4.1)

### 现象

- 在 Android 11+ 设备上下载在线主题时，点击下载按钮后进度条瞬间消失，下载失败。
- 系统 Logcat 显示 `DownloadManager` 无法写入公共外部存储目录。

### 根因

- 上游维护版在 `3085bab` 提交中试图通过 `DownloadManager` API 避开文件系统直接操作，从而误认为不再需要存储权限。
- 在 Android 6.0+ 系统上，写入 `DIRECTORY_DOWNLOADS` 等公共目录仍需 `WRITE_EXTERNAL_STORAGE` 的运行时授权。
- 主入口 `Launcher.smali` 缺失了针对该权限的动态申请弹窗。

### 修复

- **主入口注入**：在 `Launcher.smali` 的 `onCreate` 方法中注入运行时权限检查逻辑。
- **动态申请**：如果设备为 Android 6.0+ 且未获得存储权限，应用启动的第一时间将弹出系统授权对话框。
- **逻辑路径**：使用 `ActivityCompat.requestPermissions` 实现标准方案，确保下载器能获得文件写入通途。

### 结果

- 安装并首次打开桌面时，会主动提示申请存储权限。
- 授权后，在线主题下载恢复正常，不再出现静默失败。

### 验证

- 清除已安装的 Launcher 数据并重新安装。
- 启动后观察到系统权限申请弹窗。
- 点击“允许”后进入主题详情页，点击下载，apk 成功下载并弹出安装界面。

## 2026-04-19 更新弹窗 UI 布局优化与全量英文本地化 (v1.5.4.2)

### 现象

- **更新弹窗按钮缺失**：当更新日志内容（ChangeLog）过长时，底部的“立即下载”和“取消”按钮会被挤出屏幕下方，且无法滚动到底部进行交互。
- **英文环境显示混乱**：在系统语言设定为英文时，设置项“切换默认桌面”、更新弹窗标题及按钮、应用图标分类（已重绘/未重绘）等核心 UI 依然显示为中文。
- **作者归属缺失**：设置页面的“编译作者”在英文环境下显示为中文，且 Key 命名存在误导。

### 根因

- **布局约束失效**：原更新弹窗采用 `LinearLayout` 嵌套，内容区域直接放置在按钮上方，未锁定底部容器。
- **硬编码文本**：Smali 逻辑及部分 XML 布局中直接硬编码了中文字符串，未通过 Android 资源系统进行多语言适配。
- **资源缺失**：`res/values-en/strings.xml` 缺失了针对近期维护内容的翻译条目。

### 修复

- **弹窗 UI 重构**：将 `smartisan_update_dialog.xml` 改为 `RelativeLayout` 架构。
    - 使用 `layout_alignParentBottom="true"` 强行将按钮区域固定在最底部。
    - 中间内容区域嵌套 `ScrollView` 并设定为在标题下、按钮上，确保超长文本可滚动且不遮挡按钮。
- **全量多语言适配**：
    - **资源提取**：将“已重绘”、“未重绘”、“切换默认桌面”、“立即下载”等文本提取到 `strings.xml` 中，并分配合法 `public` ID。
    - **Smali 注入**：修改 `AppIconsSettingsActivity.smali`，将原本的 `const-string` 硬编码字符串改为 `getString(R.string.xxx)` 获取。
    - **补全英文翻译**：创建/更新 `res/values-en/strings.xml`，补全了作者信息、更新提示及图标设置的相关翻译。
- **纠正资源命名**：对 `follow_weixin_title` 等被误用的 Key 进行了逻辑纠偏，确保英文环境下显示正常的 "Build Author"。

### 结果

- **布局正常**：无论更新日志多长，底部操作按钮始终清晰可见并锁定在底部位置。
- **英文支持**：当切换至英文系统语言时，所有设置项、弹窗及标签均已正确转换为英文。
- **体验提升**：提升了应用在非中文环境下的专业感与可用性。

## 2026-04-19 架构适配与动画体验深度优化 (v1.5.4.2)

### 1. 动画精准分流（解锁 vs 回桌面）

**问题**：旧版本无法区分“从锁屏解锁进入桌面”与“在应用内按 Home 键返回桌面”。由于两者都会触发 `onRestart` / `onResume`，导致按主页键时会错误地触发昂贵的解锁展开动画，造成视觉卡顿。

**修复**：
- **逻辑判定**：引入 `isHomeKeyScrollToLeft` 标志位判定机制。
- **Smali 变更**：在 `Workspace.smali` 或事件分发层拦截 Home 键信号，提前标记 `isHomeKeyScrollToLeft = true`。
- **分流处理**：在动画启动器中读取该标志。若为 `true`，则直接执行平滑的位移回弹（Spring Back）而非全方位的展开缩放动画；若为 `false`（冷启动或解锁），则保留经典展开效果。

### 2. Android 16 底部 12px 留缝修复

**问题**：Android 16 修改了 Window Insets 的默认行为，在手势导航模式下，Launcher 底部常态化保留 12px 的安全边距，导致壁纸和部分全屏元素无法真正触底。

**修复**：
- **Insets 处理**：修改 `Launcher.smali` 或 root 布局的沉浸式处理逻辑。
- **偏移纠偏**：通过显式监听 `WindowInsets` 并强制设置底部 padding 为 0，或者计算偏移量后对 `DragLayer` 应用负向 TranslationY，抵消系统预留空间，实现完美的像素级全屏。

### 3. 主题详情页布局重心校正

**问题**：在某些分辨率下，主题详情页的提示文字（TextView）过长或占位异常，导致预览图（ImageView）整体向垂直上方偏移，不仅比例失调且遮挡返回键区域。

**修复**：
- **权重对齐**：修改 `res/layout/activity_theme_item.xml`（或 Smali 对应动态尺寸计算逻辑）。
- **空间解耦**：将预览图容器设定为居中 RelativeLayout，并解除了其对顶部文字的硬性 Bottom-To-Top 依赖，改为基于父容器的垂直中心对齐，确保经典 1:1 视觉比例。

### 4. 翻页动画“回退”闪烁修复

**问题**：快速划动翻页时，UI 偶尔会在动画即将结束时“闪一下”回到前一页，然后再刷新到正确页面。

**修复**：
- **状态同步**：在 `PagedView.smali` 或滑动监听中，确保 `mCurrentPage` 在滑动触发的第一时间完成逻辑赋值，而不是等待动画 callback。
- **渲染一致性`**：优化同步绘制逻辑，确保 Layer 层级在滑动过程中始终处于 active 状态，杜绝由于状态刷新不同步导致的帧回退。

### 5. 自定义图标与更新 UI

- **自定义图标**：补全了图标替换的核心 Smali 路径，支持直接加载本地存储的图片资源作为覆盖层。
- **更新 UI**：完全弃用了系统原生 AlertDialog，改为调用应用内内置的锤子风格 `SmartisanUpdateDialog`，统一交互语言。


