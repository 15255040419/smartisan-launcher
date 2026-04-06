.class public Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
.super Lcom/smartisanos/home/settings/BaseActivity;
.source "AppIconsSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/smartisanos/home/settings/icons/IconLoader$Callback;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;
    }
.end annotation


# static fields
.field private static final log:Lcom/smartisanos/launcher/LOG;


# instance fields
.field private listView:Landroid/widget/ListView;

.field private mAppIconSettingView:Landroid/widget/LinearLayout;

.field private mCacheOfficial:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private mCacheUnOfficial:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private mChangeIconDemoView:Landroid/widget/LinearLayout;

.field private mChangedPackages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mIconInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

.field private mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

.field private mImageLoader:Lcom/smartisanos/home/settings/icons/IconLoader;

.field private mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

.field private refreshIconListReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-class v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v0}, Lcom/smartisanos/launcher/LOG;->getInstance(Ljava/lang/Class;)Lcom/smartisanos/launcher/LOG;

    move-result-object v0

    sput-object v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->log:Lcom/smartisanos/launcher/LOG;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/smartisanos/home/settings/BaseActivity;-><init>()V

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheOfficial:Ljava/util/HashMap;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheUnOfficial:Ljava/util/HashMap;

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    .line 75
    new-instance v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$1;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mHandler:Landroid/os/Handler;

    .line 208
    new-instance v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;

    invoke-direct {v0, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->refreshIconListReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->removePackageInDataList(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$400(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->updateEmptyView()V

    return-void
.end method

.method static synthetic access$500()Lcom/smartisanos/launcher/LOG;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->log:Lcom/smartisanos/launcher/LOG;

    return-object v0
.end method

.method static synthetic access$600(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/icons/IconManager;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    return-object v0
.end method

.method static synthetic access$700(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheOfficial:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$800(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheUnOfficial:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$900(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method private appendIcons(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)V
    .locals 2
    .param p1, "info"    # Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .prologue
    .line 172
    new-instance v0, Lcom/smartisanos/home/settings/icons/IconLoader;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1, p0}, Lcom/smartisanos/home/settings/icons/IconLoader;-><init>(Landroid/content/Context;ILcom/smartisanos/home/settings/icons/IconLoader$Callback;)V

    .line 173
    .local v0, "appender":Lcom/smartisanos/home/settings/icons/IconLoader;
    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconLoader;->setHandler(Landroid/os/Handler;)V

    .line 175
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconLoader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 176
    return-void
.end method

.method public static inflateListTransparentHeader(Landroid/content/Context;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "root"    # Landroid/view/ViewGroup;
    .param p2, "attachToRoot"    # Z

    .prologue
    .line 525
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f04006a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private initApplicationList()V
    .locals 18

    .prologue
    .line 291
    invoke-virtual/range {p0 .. p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    .line 292
    .local v10, "packageManager":Landroid/content/pm/PackageManager;
    const/4 v15, 0x0

    invoke-virtual {v10, v15}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v9

    .line 293
    .local v9, "packageInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 294
    .local v8, "installTimeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/PackageInfo;

    .line 295
    .local v7, "info":Landroid/content/pm/PackageInfo;
    iget-object v11, v7, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 296
    .local v11, "pkg":Ljava/lang/String;
    iget-wide v4, v7, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 297
    .local v4, "firstInstallTime":J
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v8, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 300
    .end local v4    # "firstInstallTime":J
    .end local v7    # "info":Landroid/content/pm/PackageInfo;
    .end local v11    # "pkg":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 301
    .local v2, "blackList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v16, Lcom/smartisanos/home/HomeConfig;->DISABLE_LIST_IN_SWITCH_ICON_VIEW:[Ljava/lang/String;

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v15, 0x0

    :goto_1
    move/from16 v0, v17

    if-ge v15, v0, :cond_1

    aget-object v13, v16, v15

    .line 302
    .local v13, "str":Ljava/lang/String;
    invoke-interface {v2, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 304
    .end local v13    # "str":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    invoke-virtual {v15}, Lcom/smartisanos/home/settings/icons/IconManager;->getIconRedirectedApplications()Ljava/util/List;

    move-result-object v6

    .line 305
    .local v6, "iconInfos":Ljava/util/List;, "Ljava/util/List<Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 306
    .local v7, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-object v11, v7, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    .line 307
    .restart local v11    # "pkg":Ljava/lang/String;
    iget-object v3, v7, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;

    .line 308
    .local v3, "cmp":Ljava/lang/String;
    invoke-interface {v2, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_3

    .line 324
    .end local v3    # "cmp":Ljava/lang/String;
    .end local v7    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v11    # "pkg":Ljava/lang/String;
    :goto_3
    return-void

    .line 311
    .restart local v3    # "cmp":Ljava/lang/String;
    .restart local v7    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .restart local v11    # "pkg":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v11, v3}, Lcom/smartisanos/home/settings/icons/IconManager;->getResolveInfo(Ljava/lang/String;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v12

    .line 312
    .local v12, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-eqz v12, :cond_2

    .line 315
    if-eqz v11, :cond_4

    .line 316
    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Long;

    .line 317
    .local v14, "time":Ljava/lang/Long;
    if-eqz v14, :cond_4

    .line 318
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    move-wide/from16 v0, v16

    iput-wide v0, v7, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->installTime:J

    .line 321
    .end local v14    # "time":Ljava/lang/Long;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 323
    .end local v3    # "cmp":Ljava/lang/String;
    .end local v7    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v11    # "pkg":Ljava/lang/String;
    .end local v12    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-static {v15}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_3
.end method

.method private initImageLoaderAndStartLoad()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 165
    new-instance v0, Lcom/smartisanos/home/settings/icons/IconLoader;

    invoke-direct {v0, p0, v3, p0}, Lcom/smartisanos/home/settings/icons/IconLoader;-><init>(Landroid/content/Context;ILcom/smartisanos/home/settings/icons/IconLoader$Callback;)V

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mImageLoader:Lcom/smartisanos/home/settings/icons/IconLoader;

    .line 166
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mImageLoader:Lcom/smartisanos/home/settings/icons/IconLoader;

    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconLoader;->setIconList(Ljava/util/List;)V

    .line 167
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mImageLoader:Lcom/smartisanos/home/settings/icons/IconLoader;

    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconLoader;->setHandler(Landroid/os/Handler;)V

    .line 168
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mImageLoader:Lcom/smartisanos/home/settings/icons/IconLoader;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/util/HashMap;

    iget-object v2, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheOfficial:Ljava/util/HashMap;

    aput-object v2, v1, v3

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mCacheUnOfficial:Ljava/util/HashMap;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconLoader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 169
    return-void
.end method

.method private registerReceiver()V
    .locals 2

    .prologue
    .line 199
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 200
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.smartisanos.home.ACTION_REQUEST_REFRESH_ICON_LIST"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 201
    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->refreshIconListReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 202
    return-void
.end method

.method private removePackageInDataList(Ljava/lang/String;)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 327
    if-nez p1, :cond_1

    .line 342
    :cond_0
    return-void

    .line 330
    :cond_1
    iget-object v2, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    .line 333
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 334
    .local v0, "illegalList":Ljava/util/List;, "Ljava/util/List<Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;>;"
    iget-object v2, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 335
    .local v1, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-object v3, v1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 336
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 339
    .end local v1    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 340
    .restart local v1    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-object v3, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private setBoolean(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 384
    invoke-static {p1, p2, p0}, Lcom/smartisanos/launcher/data/LauncherSettings;->updateAndNotice(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 385
    return-void
.end method

.method private unregisterReceiver()V
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->refreshIconListReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 206
    return-void
.end method

.method private updateEmptyView()V
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    const v1, 0x7f020250

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setBackgroundResource(I)V

    .line 191
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 196
    :goto_0
    return-void

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    const v1, 0x7f020253

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setBackgroundResource(I)V

    .line 194
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public finish()V
    .locals 2

    .prologue
    .line 530
    invoke-super {p0}, Lcom/smartisanos/home/settings/BaseActivity;->finish()V

    .line 531
    const v0, 0x7f050021

    .line 532
    .local v0, "slide_in_from_left":I
    const v1, 0x7f050024

    .line 533
    .local v1, "slide_out_to_right":I
    invoke-virtual {p0, v0, v1}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->overridePendingTransition(II)V

    .line 534
    return-void
.end method

.method public loadOfficialIcon(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "info"    # Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .prologue
    .line 504
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    invoke-virtual {v0, p1}, Lcom/smartisanos/home/settings/icons/IconManager;->getOfficialIcon(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public loadUnOfficialIcon(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Landroid/graphics/drawable/Drawable;
    .locals 3
    .param p1, "info"    # Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .prologue
    .line 499
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    iget-object v1, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    iget-object v2, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/smartisanos/home/settings/icons/IconManager;->getRedirectedIcon(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 376
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    invoke-virtual {v0}, Lcom/smartisanos/home/settings/SettingItemSwitch;->getSwitch()Lsmartisanos/widget/SwitchEx;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 377
    const-string v0, "DEBUG"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCheckedChanged mItemUseImprovedAppIcon changed to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/smartisanos/launcher/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    sget-object v0, Lcom/smartisanos/launcher/data/InterfaceDefine;->ENABLE_SYNC_APP_ICON:Ljava/lang/String;

    invoke-direct {p0, v0, p2}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->setBoolean(Ljava/lang/String;Z)V

    .line 381
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 346
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 372
    :cond_0
    :goto_0
    return-void

    .line 349
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 350
    .local v4, "position":I
    add-int/lit8 v1, v4, -0x1

    .line 351
    .local v1, "index":I
    if-gez v1, :cond_1

    .line 352
    sget-object v6, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->log:Lcom/smartisanos/launcher/LOG;

    const-string v7, "DEBUG"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onClick error by index < 0, position = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 355
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    const v9, 0x7f0f006e

    if-ne v6, v9, :cond_2

    move v0, v7

    .line 356
    .local v0, "clickOfficialIcon":Z
    :goto_1
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 358
    .local v2, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    if-nez v0, :cond_3

    move v5, v7

    .line 359
    .local v5, "useImproved":Z
    :goto_2
    iget-boolean v6, v2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    if-eq v5, v6, :cond_0

    .line 360
    invoke-virtual {v2}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->getPrimaryId()Ljava/lang/String;

    move-result-object v3

    .line 361
    .local v3, "key":Ljava/lang/String;
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 362
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    :goto_3
    iput-boolean v5, v2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    .line 367
    sget-object v6, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->log:Lcom/smartisanos/launcher/LOG;

    const-string v7, "DEBUG"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onClick useImprovedAppIcon ==> key["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "], use = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, v2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    invoke-virtual {v6}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .end local v0    # "clickOfficialIcon":Z
    .end local v2    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "useImproved":Z
    :cond_2
    move v0, v8

    .line 355
    goto :goto_1

    .restart local v0    # "clickOfficialIcon":Z
    .restart local v2    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :cond_3
    move v5, v8

    .line 358
    goto :goto_2

    .line 364
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "useImproved":Z
    :cond_4
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-interface {v6, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 346
    :sswitch_data_0
    .sparse-switch
        0x7f0f006e -> :sswitch_0
        0x7f0f0072 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v12, 0x7f0f0057

    const/4 v11, -0x1

    const/4 v10, -0x2

    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 89
    invoke-super {p0, p1}, Lcom/smartisanos/home/settings/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 90
    invoke-virtual {p0, v7}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->requestWindowFeature(I)Z

    .line 91
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/smartisanos/launcher/data/Utils;->applyTransparentStatusBar(Landroid/content/Context;Landroid/view/Window;)V

    .line 92
    invoke-static {p0, v7}, Lcom/smartisanos/launcher/data/Utils;->setMiuiStatusBarDarkMode(Landroid/app/Activity;Z)Z

    .line 93
    const v6, 0x7f04001f

    invoke-virtual {p0, v6}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->setContentView(I)V

    .line 94
    invoke-virtual {p0, v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->setupBackBtnOnTitle(I)V

    .line 96
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    .line 97
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 98
    new-instance v6, Lcom/smartisanos/home/settings/SettingItemSwitch;

    invoke-direct {v6, p0}, Lcom/smartisanos/home/settings/SettingItemSwitch;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    .line 99
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 101
    .local v2, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget v1, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 102
    .local v1, "left":I
    iget v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 103
    .local v3, "right":I
    iget v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 104
    .local v5, "top":I
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f09014f

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 105
    .local v0, "bottom":I
    invoke-virtual {v2, v1, v5, v3, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 106
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    invoke-virtual {v6, v2}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    const v7, 0x7f080101

    invoke-virtual {v6, v7}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setTitle(I)V

    .line 108
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    sget-boolean v7, Lcom/smartisanos/launcher/data/Constants;->ENABLE_SYNC_APP_ICON:Z

    invoke-virtual {v6, v7}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setChecked(Z)V

    .line 110
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x7f040020

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    .line 111
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 115
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangeIconDemoView:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mAppIconSettingView:Landroid/widget/LinearLayout;

    const v7, 0x7f0900c5

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setTop(I)V

    .line 120
    new-instance v6, Lcom/smartisanos/home/settings/icons/IconManager;

    invoke-direct {v6, p0}, Lcom/smartisanos/home/settings/icons/IconManager;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    .line 121
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->initApplicationList()V

    .line 124
    const v6, 0x7f0f0078

    invoke-virtual {p0, v6}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ListView;

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    .line 125
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    iget-object v7, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    invoke-static {p0, v7, v9}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->inflateListTransparentHeader(Landroid/content/Context;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 126
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    iget-object v7, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    invoke-static {p0, v7, v9}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->inflateListTransparentHeader(Landroid/content/Context;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 127
    new-instance v6, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    invoke-direct {v6, p0, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;Landroid/content/Context;)V

    iput-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    .line 128
    iget-object v6, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->listView:Landroid/widget/ListView;

    iget-object v7, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 130
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->updateEmptyView()V

    .line 131
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->initImageLoaderAndStartLoad()V

    .line 132
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->registerReceiver()V

    .line 134
    invoke-virtual {p0, v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/smartisanos/home/widget/sys/Title;

    .line 135
    .local v4, "title":Lcom/smartisanos/home/widget/sys/Title;
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08006f

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/smartisanos/home/widget/sys/Title;->setTitle(Ljava/lang/CharSequence;)V

    .line 136
    const v6, 0x7f0800f3

    invoke-virtual {v4, v6}, Lcom/smartisanos/home/widget/sys/Title;->setBackButtonText(I)V

    .line 137
    new-instance v6, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$2;

    invoke-direct {v6, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$2;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V

    invoke-virtual {v4, v6}, Lcom/smartisanos/home/widget/sys/Title;->setBackButtonListener(Landroid/view/View$OnClickListener;)V

    .line 143
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 147
    invoke-super {p0}, Lcom/smartisanos/home/settings/BaseActivity;->onDestroy()V

    .line 148
    invoke-direct {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->unregisterReceiver()V

    .line 149
    return-void
.end method

.method public onLoadFailed()V
    .locals 0

    .prologue
    .line 515
    return-void
.end method

.method public onLoadFinished()V
    .locals 1

    .prologue
    .line 509
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconSettingsAdapter:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    invoke-virtual {v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->notifyDataSetChanged()V

    .line 510
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 180
    invoke-super {p0}, Lcom/smartisanos/home/settings/BaseActivity;->onPause()V

    .line 181
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;

    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/icons/IconManager;->notifyIconUpdate(Ljava/util/Map;)V

    .line 184
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mChangedPackages:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 186
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 153
    invoke-super {p0}, Lcom/smartisanos/home/settings/BaseActivity;->onResume()V

    .line 154
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    sget-boolean v1, Lcom/smartisanos/launcher/data/Constants;->ENABLE_SYNC_APP_ICON:Z

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setChecked(Z)V

    .line 155
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    invoke-virtual {v0, p0}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 156
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 160
    invoke-super {p0}, Lcom/smartisanos/home/settings/BaseActivity;->onStop()V

    .line 161
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mItemUseImprovedAppIcon:Lcom/smartisanos/home/settings/SettingItemSwitch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/SettingItemSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 162
    return-void
.end method
