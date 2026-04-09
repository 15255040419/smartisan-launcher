# Smartisan Launcher Dual App / Profile Support Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 让桌面、应用列表、搜索、启动与安装/卸载/更新同步全链路按 `packageName + componentName + userSerial` 正确支持 Android 官方 profile / 分身应用。

**Architecture:** 在现有单用户模型上新增稳定的 `userSerial` 持久化字段，并把“可见应用枚举、启动、同步”统一切到 Android 官方 `LauncherApps` / `UserManager`。数据库采用“扩表 + 删除并重建 `itemType=APPLICATION` 应用项”的迁移策略，非应用项继续保留原数据。

**Tech Stack:** apktool smali, Android `LauncherApps`, Android `UserManager`, SQLiteOpenHelper, adb

---

## File Structure

**Create**

- `smali/com/smartisanos/launcher/data/ProfileUtils.smali`: 封装 `LauncherApps`、`UserManager`、`UserHandle <-> userSerial` 转换、profile-aware 枚举、badged icon 序列化、按 profile 启动。
- `smali/com/smartisanos/launcher/ProfileLauncherAppsCallback.smali`: 承接 `LauncherApps.Callback`，把包变化转成 `LauncherModel` 的 profile-aware 同步调用。

**Modify**

- `smali/com/smartisanos/launcher/data/ItemInfo.smali`: 新增 `userSerial` 字段；更新构造、复制、`id()`、`convertItemInfoToContentValues()`、`toItemInfo()`、`toItemInfoByColumn()`、`toString()`。
- `smali/com/smartisanos/launcher/data/ApplicationInfo.smali`: 让 `getFingerprint()` 和调试输出包含 `userSerial`。
- `smali/com/smartisanos/launcher/data/ShortcutInfo.smali`: 保持从 `ItemInfo` 继承 `userSerial` 后的序列化一致性。
- `smali/com/smartisanos/launcher/data/table/ITEM.smali`: 为 `table_iteminfos` 增加 `userSerial` 列和升级逻辑。
- `smali/com/smartisanos/launcher/data/DBHelper.smali`: 数据库版本升级到 `0x4`，`initAppSearchInfo()` 元数据加入 `userSerial`，升级后触发应用项 rebuild。
- `smali/com/smartisanos/launcher/data/handler/ItemDB.smali`: 投影列、where 条件、去重键、批量写入条件全部带上 `userSerial`。
- `smali/com/smartisanos/launcher/data/DatabaseHandler.smali`: 应用项重建、resolve map、无效数据清理、图标更新、批量 insert/update/remove 改成 `(pkg, cmp, userSerial)` 语义。
- `smali/com/smartisanos/launcher/data/handler/IconDB.smali`: 图标重载改成按 `(pkg, cmp, userSerial)` 命中 badged icon。
- `smali/com/smartisanos/launcher/LauncherModel.smali`: 新增 profile-aware 扫描 / resync helper，桌面应用插入、更新、删除改为按 profile 维度处理。
- `smali/com/smartisanos/launcher/actions/StartActivity.smali`: 应用点击、搜索点击、`launchByName()` 统一改成 `LauncherApps.startMainActivity()`。
- `smali/com/smartisanos/launcher/LauncherApplication.smali`: 注册 / 注销 `LauncherApps.Callback`。
- `smali/com/smartisanos/launcher/receiver/LauncherReceiver.smali`: 包广播改成“跨 profile 重扫”的兜底触发器。
- `smali/com/smartisanos/launcher/data/Utils.smali`: 原有 `findActivitiesForPackage()` 调整为委托 `ProfileUtils`，避免搜索与工具链继续走单用户 `PackageManager`。
- `smali/com/smartisanos/launcher/data/SearchProvider.smali`: 搜索 suggestion URI、结果定位、点击回查都带 `userSerial`。
- `smali/com/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean.smali`: 新增 `userSerial` 字段、构造参数、getter 和调试输出。
- `smali/com/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper.smali`: 搜索索引从 `ItemInfo` 读出 `userSerial`。
- `smali/com/smartisanos/quicksearchbox/repository/BeanRepository.smali`: 搜索结果与 `ItemInfo` 匹配时按 `(pkg, cmp, userSerial)` 定位。
- `smali/com/smartisanos/quicksearchbox/repository/BeanRepository$1.smali`: 搜索结果点击改走带 `userSerial` 的启动路径。

### Task 1: 建立 Profile 基础建模

**Files:**
- Create: `smali/com/smartisanos/launcher/data/ProfileUtils.smali`
- Modify: `smali/com/smartisanos/launcher/data/ItemInfo.smali`
- Modify: `smali/com/smartisanos/launcher/data/ApplicationInfo.smali`
- Modify: `smali/com/smartisanos/launcher/data/ShortcutInfo.smali`

- [ ] **Step 1: 在 `ItemInfo` 新增 `userSerial` 字段并接到构造 / 复制 / `id()`**

```smali
.field public userSerial:J

const-wide/16 v0, 0x0
iput-wide v0, p0, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J

iget-wide v0, p1, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
iput-wide v0, p0, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J

iget-object v1, p0, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
const-string v1, ";"
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
iget-object v1, p0, Lcom/smartisanos/launcher/data/ItemInfo;->componentName:Ljava/lang/String;
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
const-string v1, ";"
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
iget-wide v1, p0, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
```

- [ ] **Step 2: 在 `ItemInfo` 的 DB 序列化 / 反序列化里加入 `userSerial`**

```smali
const-string v3, "userSerial"
iget-wide v4, p0, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
move-result-object v4
invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

const-string v30, "userSerial"
invoke-interface {p0, v30}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
move-result v29
invoke-interface {p0, v29}, Landroid/database/Cursor;->getLong(I)J
move-result-wide v0
iput-wide v0, v1, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
```

- [ ] **Step 3: 让 `ApplicationInfo.getFingerprint()` 与调试输出包含 `userSerial`**

```smali
iget-object v1, p0, Lcom/smartisanos/launcher/data/ApplicationInfo;->packageName:Ljava/lang/String;
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
iget-object v1, p0, Lcom/smartisanos/launcher/data/ApplicationInfo;->componentName:Ljava/lang/String;
invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
iget-wide v1, p0, Lcom/smartisanos/launcher/data/ApplicationInfo;->userSerial:J
invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
```

- [ ] **Step 4: 创建 `ProfileUtils`，统一封装 `LauncherApps` / `UserManager` / badged icon / 按 profile 启动**

```smali
.method public static getUserSerial(Landroid/content/Context;Landroid/os/UserHandle;)J
    const-string v0, "user"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/UserManager;
    invoke-virtual {v0, p1}, Landroid/os/UserManager;->getSerialNumberForUser(Landroid/os/UserHandle;)J
    move-result-wide v0
    return-wide v0
.end method

.method public static queryActivities(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    const-string v0, "launcherapps"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/content/pm/LauncherApps;
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps;->getProfiles()Ljava/util/List;
    move-result-object v2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v3
:goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Landroid/os/UserHandle;
    invoke-virtual {v0, p1, v4}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;
    move-result-object v5
    invoke-interface {v1, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    goto :goto_0
:cond_0
    return-object v1
.end method

.method public static startMainActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLandroid/graphics/Rect;Landroid/os/Bundle;)Z
    const-string v0, "launcherapps"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/content/pm/LauncherApps;
    invoke-static {p0, p3, p4}, Lcom/smartisanos/launcher/data/ProfileUtils;->getUserHandle(Landroid/content/Context;J)Landroid/os/UserHandle;
    move-result-object v1
    new-instance v2, Landroid/content/ComponentName;
    invoke-direct {v2, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v2, v1, p5, p6}, Landroid/content/pm/LauncherApps;->startMainActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/graphics/Rect;Landroid/os/Bundle;)V
    const/4 v0, 0x1
    return v0
.end method
```

- [ ] **Step 5: 做一次静态自检，确认核心符号已出现**

Run: `rg -n "userSerial|startMainActivity|getProfiles|getSerialNumberForUser" smali/com/smartisanos/launcher/data/ItemInfo.smali smali/com/smartisanos/launcher/data/ApplicationInfo.smali smali/com/smartisanos/launcher/data/ProfileUtils.smali`
Expected: `ItemInfo` / `ApplicationInfo` / `ProfileUtils` 都出现 `userSerial` 与官方 profile API 调用

### Task 2: 升级数据库 schema 与持久化层

**Files:**
- Modify: `smali/com/smartisanos/launcher/data/table/ITEM.smali`
- Modify: `smali/com/smartisanos/launcher/data/DBHelper.smali`
- Modify: `smali/com/smartisanos/launcher/data/handler/ItemDB.smali`

- [ ] **Step 1: 为 `table_iteminfos` 增加 `userSerial` 列定义**

```smali
.field public static final USER_SERIAL:Ljava/lang/String; = "userSerial"

const-string v1, "userSerial"
const-string v2, "INTEGER NOT NULL DEFAULT 0"
invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

const-string v2, "userSerial"
aput-object v2, v0, v1
```

- [ ] **Step 2: 把 `DBHelper` 数据库版本从 `0x3` 升到 `0x4`，并让 `initAppSearchInfo()` 认识 `userSerial`**

```smali
.field public static final VERSION:I = 0x4

const/4 v2, 0x4
invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

const/16 v3, 0x8
new-array v1, v3, [Ljava/lang/String;
const-string v3, "userSerial"
aput-object v3, v1, 0x4
```

- [ ] **Step 3: 扩展 `ItemDB.ITEM_INFO_COLUMNS` 和所有 `packageName` / `componentName` 查询条件**

```smali
const/16 v0, 0xa
new-array v0, v0, [Ljava/lang/String;
const-string v2, "userSerial"
aput-object v2, v0, 0x7

const-string v10, "packageName=? AND componentName=? AND userSerial=?"
new-array v11, 0x3, [Ljava/lang/String;
aput-object v4, v11, 0x0
aput-object v5, v11, 0x1
invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
move-result-object v12
aput-object v12, v11, 0x2
```

- [ ] **Step 4: 让升级后的 DB 只重建应用项，不清空页面 / 文件夹 / 快捷方式**

```smali
const-string v0, "DELETE FROM table_iteminfos WHERE itemType=0"
invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

invoke-static {p1}, Lcom/smartisanos/launcher/data/DBHelper;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V
```

- [ ] **Step 5: 静态检查版本号与新列已经进 schema**

Run: `rg -n "VERSION:I = 0x4|userSerial|DELETE FROM table_iteminfos WHERE itemType=0" smali/com/smartisanos/launcher/data/DBHelper.smali smali/com/smartisanos/launcher/data/table/ITEM.smali smali/com/smartisanos/launcher/data/handler/ItemDB.smali`
Expected: 数据库版本升级到 `0x4`，`ITEM` 和 `ItemDB` 都出现 `userSerial`

### Task 3: 把应用扫描、去重、图标更新改成 profile-aware

**Files:**
- Modify: `smali/com/smartisanos/launcher/LauncherModel.smali`
- Modify: `smali/com/smartisanos/launcher/data/DatabaseHandler.smali`
- Modify: `smali/com/smartisanos/launcher/data/handler/IconDB.smali`
- Modify: `smali/com/smartisanos/launcher/data/ProfileUtils.smali`
- Modify: `smali/com/smartisanos/launcher/data/Utils.smali`

- [ ] **Step 1: 在 `LauncherModel` 新增统一 key helper，唯一键升级为 `(pkg, cmp, userSerial)`**

```smali
.method public static makeAppKey(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, ";"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, ";"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method
```

- [ ] **Step 2: 用 `ProfileUtils` 提供的官方枚举替换 `PackageManager.queryIntentActivities()`**

```smali
invoke-static {p0, p1}, Lcom/smartisanos/launcher/data/ProfileUtils;->queryActivities(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
move-result-object v2

invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
move-result-object v3
:goto_0
invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
move-result v4
if-eqz v4, :cond_0
invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
move-result-object v5
check-cast v5, Landroid/content/pm/LauncherActivityInfo;
invoke-static {p0, v5}, Lcom/smartisanos/launcher/data/ProfileUtils;->toApplicationInfo(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;)Lcom/smartisanos/launcher/data/ApplicationInfo;
move-result-object v6
invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
goto :goto_0
```

- [ ] **Step 3: 更新 `DatabaseHandler` 的 map / diff / clean 逻辑，所有 key 与 where 条件都带 `userSerial`**

```smali
iget-object v20, v14, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;
iget-object v7, v14, Lcom/smartisanos/launcher/data/ItemInfo;->componentName:Ljava/lang/String;
iget-wide v30, v14, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
invoke-static/range {v20 .. v30}, Lcom/smartisanos/launcher/LauncherModel;->makeAppKey(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
move-result-object v16

const-string v29, "itemType=0 AND packageName=? AND componentName=? AND userSerial=?"
```

- [ ] **Step 4: 让 `IconDB` 与图标重载链路命中 badged icon，不再把不同 profile 当同一应用**

```smali
invoke-static/range {v44 .. v48}, Lcom/smartisanos/launcher/LauncherModel;->makeAppKey(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
move-result-object v46
invoke-virtual/range {v47 .. v47}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
move-result-object v48
check-cast v48, Lcom/smartisanos/launcher/data/ApplicationInfo;
iget-object v0, v48, Lcom/smartisanos/launcher/data/ItemInfo;->iconData:[B
```

- [ ] **Step 5: 保留 `Utils.findActivitiesForPackage()` 外壳，但内部委托新 profile-aware helper**

```smali
invoke-static {p0, p1}, Lcom/smartisanos/launcher/data/ProfileUtils;->queryActivities(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
move-result-object v0
return-object v0
```

- [ ] **Step 6: 静态检查所有关键 key 已带 `userSerial`**

Run: `rg -n "makeAppKey|userSerial|queryActivities|itemType=0 AND packageName=\\? AND componentName=\\? AND userSerial=\\?" smali/com/smartisanos/launcher/LauncherModel.smali smali/com/smartisanos/launcher/data/DatabaseHandler.smali smali/com/smartisanos/launcher/data/handler/IconDB.smali smali/com/smartisanos/launcher/data/Utils.smali`
Expected: 扫描、图标更新、DB 清理都已经切到 `(pkg, cmp, userSerial)` 唯一键

### Task 4: 改造启动链路与同步链路

**Files:**
- Create: `smali/com/smartisanos/launcher/ProfileLauncherAppsCallback.smali`
- Modify: `smali/com/smartisanos/launcher/actions/StartActivity.smali`
- Modify: `smali/com/smartisanos/launcher/LauncherApplication.smali`
- Modify: `smali/com/smartisanos/launcher/receiver/LauncherReceiver.smali`
- Modify: `smali/com/smartisanos/launcher/LauncherModel.smali`

- [ ] **Step 1: 把 `StartActivity` 的应用点击改成 `LauncherApps.startMainActivity()`**

```smali
iget-object v7, v10, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;
iget-object v0, v10, Lcom/smartisanos/launcher/data/ItemInfo;->componentName:Ljava/lang/String;
iget-wide v11, v10, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J

invoke-static {v8, v7, v0, v11, v12, v5, v6}, Lcom/smartisanos/launcher/data/ProfileUtils;->startMainActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLandroid/graphics/Rect;Landroid/os/Bundle;)Z
move-result v13
if-nez v13, :cond_launch_ok
invoke-static {v1}, Lcom/smartisanos/launcher/actions/StartActivity;->startActivitySafely(Landroid/content/Intent;)V
```

- [ ] **Step 2: 扩展 `launchByName()`，让搜索 / provider 能把 `userSerial` 带进来**

```smali
.method public static launchByName(Ljava/lang/String;Ljava/lang/String;J)V
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;
    move-result-object v0
    const/4 v1, 0x0
    const/4 v2, 0x0
    invoke-static {v0, p0, p1, p2, p3, v1, v2}, Lcom/smartisanos/launcher/data/ProfileUtils;->startMainActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLandroid/graphics/Rect;Landroid/os/Bundle;)Z
    return-void
.end method
```

- [ ] **Step 3: 创建 `ProfileLauncherAppsCallback`，把系统 profile 包变化变成定向重扫**

```smali
.method public onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V
    iget-object v0, p0, Lcom/smartisanos/launcher/ProfileLauncherAppsCallback;->mContext:Landroid/content/Context;
    invoke-static {v0, p2}, Lcom/smartisanos/launcher/data/ProfileUtils;->getUserSerial(Landroid/content/Context;Landroid/os/UserHandle;)J
    move-result-wide v1
    invoke-static {v0, p1, v1, v2}, Lcom/smartisanos/launcher/LauncherModel;->resyncPackageForUser(Landroid/content/Context;Ljava/lang/String;J)V
    return-void
.end method
```

- [ ] **Step 4: 在 `LauncherApplication` 里注册 / 注销 callback**

```smali
new-instance v0, Lcom/smartisanos/launcher/ProfileLauncherAppsCallback;
invoke-direct {v0, p0}, Lcom/smartisanos/launcher/ProfileLauncherAppsCallback;-><init>(Landroid/content/Context;)V
iput-object v0, p0, Lcom/smartisanos/launcher/LauncherApplication;->mProfileCallback:Lcom/smartisanos/launcher/ProfileLauncherAppsCallback;
invoke-static {p0, v0}, Lcom/smartisanos/launcher/data/ProfileUtils;->registerCallback(Landroid/content/Context;Landroid/content/pm/LauncherApps$Callback;)V
```

- [ ] **Step 5: 把 `LauncherReceiver` 的包广播改成跨 profile 兜底刷新，而不是单用户删改**

```smali
const-string v6, "android.intent.action.PACKAGE_ADDED"
invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
move-result v6
if-eqz v6, :cond_next
invoke-static {p1, v2}, Lcom/smartisanos/launcher/LauncherModel;->resyncPackageAcrossProfiles(Landroid/content/Context;Ljava/lang/String;)V
goto :goto_0
```

- [ ] **Step 6: 静态检查启动与 callback 已切到官方 API**

Run: `rg -n "launchByName\\(|startMainActivity|ProfileLauncherAppsCallback|resyncPackageAcrossProfiles|resyncPackageForUser" smali/com/smartisanos/launcher/actions/StartActivity.smali smali/com/smartisanos/launcher/LauncherApplication.smali smali/com/smartisanos/launcher/ProfileLauncherAppsCallback.smali smali/com/smartisanos/launcher/receiver/LauncherReceiver.smali smali/com/smartisanos/launcher/LauncherModel.smali`
Expected: 启动和同步都已经经过 `ProfileUtils` / `LauncherApps.Callback`

### Task 5: 让搜索链路按 profile 区分并可正确启动

**Files:**
- Modify: `smali/com/smartisanos/launcher/data/SearchProvider.smali`
- Modify: `smali/com/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean.smali`
- Modify: `smali/com/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper.smali`
- Modify: `smali/com/smartisanos/quicksearchbox/repository/BeanRepository.smali`
- Modify: `smali/com/smartisanos/quicksearchbox/repository/BeanRepository$1.smali`

- [ ] **Step 1: 为 `AppSearchBean` 增加 `userSerial` 字段与 getter**

```smali
.field private userSerial:J

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/smartisanos/quicksearchbox/pinyinsearch/model/PinyinSearchUnit;)V
    iput-object p1, p0, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->title:Ljava/lang/String;
    iput-object p2, p0, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->packageName:Ljava/lang/String;
    iput-object p3, p0, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->componentName:Ljava/lang/String;
    iput-wide p4, p0, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->userSerial:J
.end method

.method public getUserSerial()J
    iget-wide v0, p0, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->userSerial:J
    return-wide v0
.end method
```

- [ ] **Step 2: 让 `AppSearchIndexHelper` 从 `ItemInfo` 把 `userSerial` 带进索引对象**

```smali
iget-wide v11, v1, Lcom/smartisanos/launcher/data/ItemInfo;->userSerial:J
invoke-direct {v7, v8, v9, v10, v11, v12, v13}, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/smartisanos/quicksearchbox/pinyinsearch/model/PinyinSearchUnit;)V
```

- [ ] **Step 3: 把 `BeanRepository` 的搜索结果匹配从“只看包名”改成完整 key**

```smali
invoke-virtual {v2}, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->getPackageName()Ljava/lang/String;
move-result-object v15
invoke-virtual {v2}, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->getComponentName()Ljava/lang/String;
move-result-object v16
invoke-virtual {v2}, Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;->getUserSerial()J
move-result-wide v17
invoke-static/range {v15 .. v17}, Lcom/smartisanos/launcher/LauncherModel;->makeAppKey(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
move-result-object v18
```

- [ ] **Step 4: 把搜索点击与 `SearchProvider` URI 一并带上 `userSerial`**

```smali
invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;
invoke-virtual {v0, p2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;
invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
move-result-object v1
invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

invoke-static {v5, v6, v7, v8, v9}, Lcom/smartisanos/launcher/actions/StartActivity;->launchByName(Ljava/lang/String;Ljava/lang/String;J)V
```

- [ ] **Step 5: 静态检查搜索链路已出现 `userSerial`**

Run: `rg -n "userSerial|launchByName\\(|appendEncodedPath|makeAppKey" smali/com/smartisanos/launcher/data/SearchProvider.smali smali/com/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean.smali smali/com/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper.smali smali/com/smartisanos/quicksearchbox/repository/BeanRepository.smali smali/com/smartisanos/quicksearchbox/repository/BeanRepository\\$1.smali`
Expected: 搜索索引、搜索结果点击、provider URI 都已经携带 `userSerial`

### Task 6: 设备构建与 smoke 验证

**Files:**
- Modify: `docs/superpowers/plans/2026-04-09-dual-app-profile-support.md`

- [ ] **Step 1: 回编译并安装调试包**

Run: `./tools/build_and_install.sh`
Expected: 成功生成并安装调试 APK；若设备已连接则自动安装到测试机

- [ ] **Step 2: 确认测试机上存在多个用户 / profile**

Run: `adb shell pm list users`
Expected: 至少看到主用户外的一个 profile；若只有 `UserInfo{0:` 则先在系统里创建 work / clone / private profile 再继续

- [ ] **Step 3: 冷启动桌面，观察桌面与应用列表是否同时出现主应用和分身应用**

Run: `adb shell am start -W -n com.smartisanos.home/com.smartisanos.home.Launcher`
Expected: Launcher 正常启动；目标测试应用在桌面或应用列表中显示两份实例，且图标带系统 badge

- [ ] **Step 4: 手工验证搜索与启动链路**

Run: `adb logcat -c && adb shell am start -W -n com.smartisanos.home/com.smartisanos.home.Launcher`
Expected: 然后在设备上手工执行以下检查

```text
1. 搜索同名应用时，结果列表同时出现主应用和分身应用
2. 点击主应用结果，只启动主用户实例
3. 点击分身结果，只启动 profile 实例
4. 卸载分身后，主应用图标仍保留
5. 更新主应用后，分身图标不被覆盖
```

- [ ] **Step 5: 抓取日志，确认关键路径走的是 profile-aware 代码**

Run: `adb logcat -d | rg "ProfileUtils|LauncherApps|userSerial|resyncPackageForUser|resyncPackageAcrossProfiles"`
Expected: 日志里能看到 `userSerial`、`LauncherApps` 或新的 resync helper 调用；没有再出现只按 `packageName` 删除主应用和分身的行为
