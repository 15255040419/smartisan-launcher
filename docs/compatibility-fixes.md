# Smartisan Launcher Maintained Compatibility Fixes

## 2026-04-07 Android 16 顶部 / 底部布局适配

### 现象

- Android 16 类原生系统上，首页滑动时顶部木纹和真实状态栏高度不匹配
- 双指缩小进入编辑页后，底部按钮区域被手势导航区挤压，出现难以点击的问题
- `dock` 和桌面图标区域比例异常，看起来像和首屏内容发生重叠

### 根因

- 旧逻辑把物理整屏高度直接写入 `Constants.window_height`
- 在手势导航设备上，这会把底部系统区也算进 Launcher 的可布局高度
- 页面动画、`dock` 高度、桌面格子高度都依赖 `window_height`，因此顶部和底部会一起错位
- 背景和后处理节点又依赖整屏尺寸，所以不能简单把 `screen_height` 也一起改成可用高度

### 修复

- `smali/com/smartisanos/launcher/ApplicationProxy.smali`
  - `getScreenSize()` 同时返回可用窗口高度和整屏高度
  - 新增底部系统区高度计算，优先根据 `navigation_mode` 选择 `navigation_bar_gesture_height` 或 `navigation_bar_height`
  - `Constants.init()` 先使用可用高度初始化布局，再把 `screen_height` 恢复为整屏高度
- `smali/com/smartisanos/launcher/data/Utils.smali`
  - `applyTransparentStatusBar()` 在 Android 5.0+ 改为现代透明状态栏处理，避免旧反射路径导致顶部表现异常
- `smali/com/smartisanos/launcher/animations/PageViewAnimation.smali`
  - 移除多页首页首行位置里重复叠加的 `page_title_height` 和 `title_page_spacing`

### 结果

- 顶部固定木纹和真实状态栏高度重新对齐
- 编辑页底部按钮不再被底部手势区挡住
- 这次没有单独硬调 `dock` 数值，而是先修统一高度基准，让 `dock` 和桌面格子比例一起恢复

### 验证

- `./tools/build_and_install.sh`
  - 2026-04-07 本地回编译和签名成功
  - 用户真机确认 Android 16 上显示已恢复正常
