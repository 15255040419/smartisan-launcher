.class public Lcom/smartisanos/home/net/NetworkHandler;
.super Ljava/lang/Object;
.source "NetworkHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/smartisanos/home/net/NetworkHandler$NetUtils;,
        Lcom/smartisanos/home/net/NetworkHandler$Task;,
        Lcom/smartisanos/home/net/NetworkHandler$Action;
    }
.end annotation


# static fields
.field private static BE_INTERRUPTED:Z = false

.field public static final DOWNLOAD_URL_SUFFIX:Ljava/lang/String; = ".apk"

.field private static final DRAWABLE_NAME_FOR_GET_THIRD_PART_SYS_ICON:Ljava/lang/String; = "icon_provided_by_smartisan"

.field private static final MANUFACTURERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final THIRD_PART_SYS_APPS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final URL_GET_ALL_CATEGORY:Ljava/lang/String; = "http://icon.smartisan.com/cate_logo.json"

.field private static final URL_GET_CATEGORY_BY_PKG:Ljava/lang/String; = "http://api-app.smartisan.com/api/v1_4/getcidbypkg/"

.field private static final URL_PREFIX:Ljava/lang/String; = "http://icon.smartisan.com/"

.field private static final URL_TYPE_DRAWABLE:Ljava/lang/String; = "drawable"

.field private static final URL_TYPE_INFO:Ljava/lang/String; = "info"

.field static final log:Lcom/smartisanos/launcher/LOG;

.field private static final mWorker:Landroid/os/Handler;

.field private static final sWorkerThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    const-class v0, Lcom/smartisanos/home/net/NetworkHandler;

    invoke-static {v0}, Lcom/smartisanos/launcher/LOG;->getInstance(Ljava/lang/Class;)Lcom/smartisanos/launcher/LOG;

    move-result-object v0

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    .line 44
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "NetworkHandler"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler;->sWorkerThread:Landroid/os/HandlerThread;

    .line 47
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 73
    const/4 v0, 0x0

    sput-boolean v0, Lcom/smartisanos/home/net/NetworkHandler;->BE_INTERRUPTED:Z

    .line 75
    new-instance v0, Lcom/smartisanos/home/net/NetworkHandler$1;

    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/smartisanos/home/net/NetworkHandler$1;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler;->mWorker:Landroid/os/Handler;

    .line 325
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    .line 327
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.alarmclock"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.deskclock"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.mms"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.providers.downloads.ui"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.email"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.settings"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.calendar"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.soundrecorder"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.browser"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.contacts"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.dialer"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.calculator2"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.soundrecorder"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.camera"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    const-string v1, "com.android.thememanager"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    .line 346
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "sony"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "htc"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "meizu"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "xiaomi"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 350
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "samsung"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "motorola"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "lge"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "letv"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "oppo"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "huawei"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    sget-object v0, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    const-string v1, "bbk"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->handleDL_ICON(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->handleFETCH_ICON(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$200(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->handleFETCH_ICON_END(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$300(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->handleGET_APP_DL_INFO(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$400(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->handleGET_THEME_DL_INFO(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$600(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/smartisanos/home/net/NetworkHandler;->getIconUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method private static fetchIcon(Lcom/smartisanos/launcher/data/ItemInfo;Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Z
    .locals 14
    .param p0, "item"    # Lcom/smartisanos/launcher/data/ItemInfo;
    .param p1, "icon"    # Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .prologue
    .line 407
    if-nez p0, :cond_0

    .line 408
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    const-string v12, "fetchIcon return by item is null"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    const/4 v10, 0x0

    .line 472
    :goto_0
    return v10

    .line 412
    :cond_0
    iget-object v9, p0, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;

    .line 413
    .local v9, "pkg":Ljava/lang/String;
    iget-object v0, p0, Lcom/smartisanos/launcher/data/ItemInfo;->componentName:Ljava/lang/String;

    .line 414
    .local v0, "cmp":Ljava/lang/String;
    iget-object v2, p0, Lcom/smartisanos/launcher/data/ItemInfo;->iconDrawableName:Ljava/lang/String;

    .line 415
    .local v2, "drawable":Ljava/lang/String;
    const/4 v5, 0x0

    .line 416
    .local v5, "md5":Ljava/lang/String;
    const/4 v4, 0x0

    .line 417
    .local v4, "lastUpdateTime":Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 418
    iget-object v5, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->md5:Ljava/lang/String;

    .line 419
    iget-object v4, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->lastUpdateTime:Ljava/lang/String;

    .line 422
    :cond_1
    if-nez v2, :cond_2

    .line 423
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " lose icon drawable name, so return !"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    const/4 v10, 0x0

    goto :goto_0

    .line 426
    :cond_2
    invoke-static {p0}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getInfoFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    move-result-object v3

    .line 427
    .local v3, "iconInfo":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    if-nez v3, :cond_3

    .line 428
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    const-string v12, "return false, by getInfoFromServer return null"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    const/4 v10, 0x0

    goto :goto_0

    .line 431
    :cond_3
    iget-object v6, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->md5:Ljava/lang/String;

    .line 432
    .local v6, "md5FromServer":Ljava/lang/String;
    if-nez v6, :cond_4

    .line 433
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    const-string v12, "return false, by can\'t get icon info from server"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    const/4 v10, 0x0

    goto :goto_0

    .line 436
    :cond_4
    iget-wide v10, p0, Lcom/smartisanos/launcher/data/ItemInfo;->id:J

    iput-wide v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->ownerId:J

    .line 437
    const/4 v10, 0x0

    iput-boolean v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    .line 438
    if-eqz v5, :cond_5

    .line 439
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 440
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "icon already exist ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {p0}, Lcom/smartisanos/launcher/data/ItemInfo;->id()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "]"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 444
    :cond_5
    const/4 v10, 0x1

    iput-boolean v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    .line 447
    :cond_6
    invoke-static {p0}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->access$500(Lcom/smartisanos/launcher/data/ItemInfo;)[B

    move-result-object v1

    .line 448
    .local v1, "data":[B
    if-eqz v1, :cond_7

    array-length v10, v1

    if-nez v10, :cond_8

    .line 449
    :cond_7
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    const-string v12, "getIconDataFromServer return null"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 452
    :cond_8
    invoke-static {v1}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getMd5([B)Ljava/lang/String;

    move-result-object v7

    .line 453
    .local v7, "newMd5":Ljava/lang/String;
    if-nez v7, :cond_9

    .line 454
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "A140"

    const-string v12, "can\'t get md5"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 457
    :cond_9
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 458
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "A140"

    const-string v12, "md5 is not match, need try it again"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 459
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 462
    :cond_a
    iput-object v1, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->iconData:[B

    .line 463
    iput-object v0, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;

    .line 464
    iput-object v9, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    .line 465
    iput-object v2, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->drawableName:Ljava/lang/String;

    .line 466
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fetchIcon "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 470
    .local v8, "params":Ljava/util/ArrayList;
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    sget-object v10, Lcom/smartisanos/launcher/data/DatabaseUpdater$Action;->EVENT_SAVE_ICON:Lcom/smartisanos/launcher/data/DatabaseUpdater$Action;

    const/4 v11, 0x0

    invoke-static {v10, v11, v8}, Lcom/smartisanos/launcher/data/DatabaseUpdater;->updateDatabase(Lcom/smartisanos/launcher/data/DatabaseUpdater$Action;Ljava/util/List;Ljava/util/ArrayList;)V

    .line 472
    const/4 v10, 0x1

    goto/16 :goto_0
.end method

.method private static getIconUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;
    .locals 6
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "drawName"    # Ljava/lang/String;

    .prologue
    .line 369
    move-object v2, p0

    .line 370
    .local v2, "pkgName":Ljava/lang/String;
    move-object v1, p1

    .line 371
    .local v1, "imgName":Ljava/lang/String;
    if-eqz p0, :cond_0

    sget-object v4, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 372
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    invoke-interface {v4, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    sget-object v5, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 373
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 377
    :cond_0
    const-string v1, "icon_provided_by_smartisan"

    .line 379
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://icon.smartisan.com/drawable/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 380
    .local v3, "str":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    .end local v3    # "str":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 381
    :catch_0
    move-exception v0

    .line 382
    .local v0, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 384
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static getInfoUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;
    .locals 6
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "drawName"    # Ljava/lang/String;

    .prologue
    .line 388
    move-object v2, p0

    .line 389
    .local v2, "pkgName":Ljava/lang/String;
    move-object v1, p1

    .line 390
    .local v1, "imgName":Ljava/lang/String;
    if-eqz p0, :cond_0

    sget-object v4, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 391
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->THIRD_PART_SYS_APPS:Ljava/util/List;

    invoke-interface {v4, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->MANUFACTURERS:Ljava/util/List;

    sget-object v5, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 392
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/smartisanos/launcher/data/Constants;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 396
    :cond_0
    const-string v1, "icon_provided_by_smartisan"

    .line 398
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://icon.smartisan.com/info/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 399
    .local v3, "str":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 403
    .end local v3    # "str":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 403
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static handleDL_ICON(Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .param p1, "params"    # Ljava/util/List;
    .annotation runtime Lcom/smartisanos/home/net/ActionType;
        name = "DL_ICON"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/util/List;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v7, 0x1

    .line 183
    sget-boolean v4, Lcom/smartisanos/launcher/data/Constants;->ENABLE_DOWNLOAD_ICON:Z

    if-nez v4, :cond_1

    .line 184
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v5, "DEBUG"

    const-string v6, "handleDL_ICON return by ENABLE_DOWNLOAD_ICON is false"

    invoke-virtual {v4, v5, v6}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    sput-boolean v7, Lcom/smartisanos/home/net/NetworkHandler;->BE_INTERRUPTED:Z

    .line 218
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_3

    .line 189
    :cond_2
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v5, "DEBUG"

    const-string v6, "DL_ICON params is empty !"

    invoke-virtual {v4, v5, v6}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 192
    :cond_3
    const/4 v4, 0x0

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/smartisanos/launcher/data/ItemInfo;

    .line 193
    .local v1, "item":Lcom/smartisanos/launcher/data/ItemInfo;
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 194
    .local v0, "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v5, "A140"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DL_ICON begin for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/smartisanos/launcher/data/ItemInfo;->id()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    iget-object v2, v1, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;

    .line 197
    .local v2, "pkg":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 198
    invoke-static {v2}, Lcom/smartisanos/launcher/data/Utils;->isHalfAlphaIcon(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 213
    :cond_4
    invoke-static {v1, v0}, Lcom/smartisanos/home/net/NetworkHandler;->fetchIcon(Lcom/smartisanos/launcher/data/ItemInfo;Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Z

    move-result v3

    .line 214
    .local v3, "result":Z
    if-nez v3, :cond_5

    .line 215
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v5, "A140"

    iget-object v6, v1, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;

    iget-object v7, v1, Lcom/smartisanos/launcher/data/ItemInfo;->iconDrawableName:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/smartisanos/home/net/NetworkHandler;->getInfoUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    :cond_5
    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v5, "A140"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DL_ICON end ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/smartisanos/launcher/data/ItemInfo;->id()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static handleFETCH_ICON(Ljava/util/List;Ljava/util/List;)V
    .locals 17
    .param p1, "params"    # Ljava/util/List;
    .annotation runtime Lcom/smartisanos/home/net/ActionType;
        name = "FETCH_ICON"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/util/List;",
            ")V"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    if-nez p1, :cond_0

    .line 153
    sget-object v12, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v13, "DEBUG"

    const-string v14, "FETCH_ICON return by params is null"

    invoke-virtual {v12, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :goto_0
    return-void

    .line 156
    :cond_0
    const/4 v12, 0x0

    sput-boolean v12, Lcom/smartisanos/home/net/NetworkHandler;->BE_INTERRUPTED:Z

    .line 157
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 158
    .local v8, "itemInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/smartisanos/launcher/data/ItemInfo;>;"
    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 159
    .local v3, "iconInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-direct {v5, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 160
    .local v5, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    .line 161
    .local v11, "total":I
    const/4 v6, 0x0

    .line 162
    .local v6, "index":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 163
    .local v4, "id":Ljava/lang/String;
    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/smartisanos/launcher/data/ItemInfo;

    .line 164
    .local v7, "item":Lcom/smartisanos/launcher/data/ItemInfo;
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 165
    .local v2, "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    add-int/lit8 v6, v6, 0x1

    .line 166
    sget-object v13, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v14, "A140"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "DL_ICON begin for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Lcom/smartisanos/launcher/data/ItemInfo;->id()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    sget-object v13, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v14, "A140"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "DL_ICON task current ["

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "], total ["

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "]"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    new-instance v10, Lcom/smartisanos/home/net/NetworkHandler$Task;

    invoke-direct {v10}, Lcom/smartisanos/home/net/NetworkHandler$Task;-><init>()V

    .line 169
    .local v10, "nTask":Lcom/smartisanos/home/net/NetworkHandler$Task;
    sget-object v13, Lcom/smartisanos/home/net/NetworkHandler$Action;->DL_ICON:Lcom/smartisanos/home/net/NetworkHandler$Action;

    iput-object v13, v10, Lcom/smartisanos/home/net/NetworkHandler$Task;->act:Lcom/smartisanos/home/net/NetworkHandler$Action;

    .line 170
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .local v9, "list":Ljava/util/List;
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    iput-object v9, v10, Lcom/smartisanos/home/net/NetworkHandler$Task;->params:Ljava/util/List;

    .line 174
    invoke-static {v10}, Lcom/smartisanos/home/net/NetworkHandler;->postTask(Lcom/smartisanos/home/net/NetworkHandler$Task;)V

    goto :goto_1

    .line 176
    .end local v2    # "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v4    # "id":Ljava/lang/String;
    .end local v7    # "item":Lcom/smartisanos/launcher/data/ItemInfo;
    .end local v9    # "list":Ljava/util/List;
    .end local v10    # "nTask":Lcom/smartisanos/home/net/NetworkHandler$Task;
    :cond_1
    new-instance v1, Lcom/smartisanos/home/net/NetworkHandler$Task;

    invoke-direct {v1}, Lcom/smartisanos/home/net/NetworkHandler$Task;-><init>()V

    .line 177
    .local v1, "fetchEndTask":Lcom/smartisanos/home/net/NetworkHandler$Task;
    sget-object v12, Lcom/smartisanos/home/net/NetworkHandler$Action;->FETCH_ICON_END:Lcom/smartisanos/home/net/NetworkHandler$Action;

    iput-object v12, v1, Lcom/smartisanos/home/net/NetworkHandler$Task;->act:Lcom/smartisanos/home/net/NetworkHandler$Action;

    .line 178
    invoke-static {v1}, Lcom/smartisanos/home/net/NetworkHandler;->postTask(Lcom/smartisanos/home/net/NetworkHandler$Task;)V

    goto/16 :goto_0
.end method

.method private static handleFETCH_ICON_END(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p1, "params"    # Ljava/util/List;
    .annotation runtime Lcom/smartisanos/home/net/ActionType;
        name = "FETCH_ICON_END"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/util/List;",
            ")V"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v2, 0x0

    sput-boolean v2, Lcom/smartisanos/launcher/data/DatabaseHandler;->FETCH_ICON_RUNNING:Z

    .line 224
    sget-boolean v2, Lcom/smartisanos/home/net/NetworkHandler;->BE_INTERRUPTED:Z

    if-nez v2, :cond_0

    .line 226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 227
    .local v0, "time":J
    const-string v2, "last_icon_sync_time"

    invoke-static {v2, v0, v1}, Lcom/smartisanos/launcher/data/LauncherSettings;->updateSetting(Ljava/lang/String;J)V

    .line 229
    .end local v0    # "time":J
    :cond_0
    return-void
.end method

.method private static handleGET_APP_DL_INFO(Ljava/util/List;Ljava/util/List;)V
    .locals 19
    .param p1, "params"    # Ljava/util/List;
    .annotation runtime Lcom/smartisanos/home/net/ActionType;
        name = "GET_APP_DL_INFO"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/util/List;",
            ")V"
        }
    .end annotation

    .prologue
    .line 234
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v8, 0x0

    .line 236
    .local v8, "app":Lcom/smartisanos/home/apps/EmbeddedApp;
    const/4 v2, 0x0

    :try_start_0
    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/smartisanos/home/apps/EmbeddedApp;

    move-object v8, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :goto_0
    if-nez v8, :cond_0

    .line 281
    :goto_1
    return-void

    .line 237
    :catch_0
    move-exception v14

    .line 238
    .local v14, "e":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 243
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-static {}, Lcom/smartisanos/launcher/LauncherApplication;->getInstance()Lcom/smartisanos/launcher/LauncherApplication;

    move-result-object v10

    .line 244
    .local v10, "application":Lcom/smartisanos/launcher/LauncherApplication;
    const/4 v6, 0x2

    .line 245
    .local v6, "downloadType":I
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isNetworkConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 246
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isWifiConnected()Z

    move-result v2

    if-nez v2, :cond_1

    .line 247
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isEnableCellularDownload()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 248
    or-int/lit8 v6, v6, 0x1

    .line 252
    :cond_1
    invoke-virtual {v8}, Lcom/smartisanos/home/apps/EmbeddedApp;->pkg()Ljava/lang/String;

    move-result-object v16

    .line 254
    .local v16, "pkg":Ljava/lang/String;
    sget-object v2, Lcom/smartisanos/launcher/view/DownloadView$DownloadState;->DOWNLOADING:Lcom/smartisanos/launcher/view/DownloadView$DownloadState;

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/smartisanos/launcher/data/Utils;->updateDownloadCellsState(Ljava/lang/String;Lcom/smartisanos/launcher/view/DownloadView$DownloadState;)V

    .line 255
    invoke-virtual {v8, v10}, Lcom/smartisanos/home/apps/EmbeddedApp;->name(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 256
    .local v9, "appName":Ljava/lang/String;
    iget-object v2, v8, Lcom/smartisanos/home/apps/EmbeddedApp;->appPrivateName:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/smartisanos/launcher/data/Utils;->appDownloadInfos(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v11

    .line 257
    .local v11, "downloadInfos":[Ljava/lang/String;
    if-eqz v11, :cond_2

    array-length v2, v11

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    .line 258
    :cond_2
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;

    move-result-object v2

    const v3, 0x7f080049

    invoke-virtual {v2, v3}, Lcom/smartisanos/home/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 259
    .local v15, "msg":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    invoke-static {v15, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 260
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v15, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    .line 261
    .local v17, "toast":Landroid/widget/Toast;
    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 262
    sget-object v2, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v3, "DEBUG"

    const-string v18, "appDownloadInfos return data is err"

    move-object/from16 v0, v18

    invoke-virtual {v2, v3, v0}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    sget-object v2, Lcom/smartisanos/launcher/view/DownloadView$DownloadState;->NEED_DOWNLOAD:Lcom/smartisanos/launcher/view/DownloadView$DownloadState;

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/smartisanos/launcher/data/Utils;->updateDownloadCellsState(Ljava/lang/String;Lcom/smartisanos/launcher/view/DownloadView$DownloadState;)V

    goto :goto_1

    .line 266
    .end local v15    # "msg":Ljava/lang/String;
    .end local v17    # "toast":Landroid/widget/Toast;
    :cond_3
    const/4 v2, 0x0

    aget-object v7, v11, v2

    .line 267
    .local v7, "fileMd5":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v5, v11, v2

    .line 268
    .local v5, "downloadUrl":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 270
    .local v4, "fileName":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-virtual {v8}, Lcom/smartisanos/home/apps/EmbeddedApp;->taskName()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v2 .. v7}, Lcom/smartisanos/home/net/DownloadSupervisor;->requestDownload(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)J

    move-result-wide v12

    .line 271
    .local v12, "downloadId":J
    const-wide/16 v2, 0x0

    cmp-long v2, v12, v2

    if-gtz v2, :cond_4

    .line 273
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;

    move-result-object v2

    const v3, 0x7f080049

    invoke-virtual {v2, v3}, Lcom/smartisanos/home/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 274
    .restart local v15    # "msg":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    invoke-static {v15, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 275
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v15, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    .line 276
    .restart local v17    # "toast":Landroid/widget/Toast;
    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 277
    sget-object v2, Lcom/smartisanos/launcher/view/DownloadView$DownloadState;->NEED_DOWNLOAD:Lcom/smartisanos/launcher/view/DownloadView$DownloadState;

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/smartisanos/launcher/data/Utils;->updateDownloadCellsState(Ljava/lang/String;Lcom/smartisanos/launcher/view/DownloadView$DownloadState;)V

    goto/16 :goto_1

    .line 279
    .end local v15    # "msg":Ljava/lang/String;
    .end local v17    # "toast":Landroid/widget/Toast;
    :cond_4
    sget-object v2, Lcom/smartisanos/launcher/view/DownloadView$DownloadState;->DOWNLOADING:Lcom/smartisanos/launcher/view/DownloadView$DownloadState;

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/smartisanos/launcher/data/Utils;->updateDownloadCellsState(Ljava/lang/String;Lcom/smartisanos/launcher/view/DownloadView$DownloadState;)V

    goto/16 :goto_1
.end method

.method private static handleGET_THEME_DL_INFO(Ljava/util/List;Ljava/util/List;)V
    .locals 16
    .param p1, "params"    # Ljava/util/List;
    .annotation runtime Lcom/smartisanos/home/net/ActionType;
        name = "GET_THEME_DL_INFO"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;",
            "Ljava/util/List;",
            ")V"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v3, 0x0

    .line 289
    .local v3, "themeId":Ljava/lang/String;
    const/4 v12, 0x0

    .line 291
    .local v12, "pkg":Ljava/lang/String;
    const/4 v2, 0x0

    :try_start_0
    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 292
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v12, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    :goto_0
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 295
    :cond_0
    sget-object v2, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v13, "DEBUG"

    const-string v14, "handleGET_THEME_DL_INFO return by themeId is null"

    invoke-virtual {v2, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    :cond_1
    :goto_1
    return-void

    .line 298
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v13, ".apk"

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 299
    .local v4, "themeApkName":Ljava/lang/String;
    const/4 v2, 0x2

    invoke-static {v12, v2}, Lcom/smartisanos/launcher/data/Utils;->appDownloadInfos(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v10

    .line 300
    .local v10, "downloadInfos":[Ljava/lang/String;
    if-eqz v10, :cond_3

    array-length v2, v10

    const/4 v13, 0x2

    if-eq v2, v13, :cond_4

    .line 301
    :cond_3
    sget-object v2, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v13, "DEBUG"

    const-string v14, "handleGET_THEME_DL_INFO return by downloadInfos is error"

    invoke-virtual {v2, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    const-string v2, "com.smartisanos.home.THEME_DOWNLOAD_FAILED"

    invoke-static {v2, v3}, Lcom/smartisanos/launcher/actions/DownloadReceiver;->noticeTheme(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 305
    :cond_4
    const/4 v6, 0x2

    .line 306
    .local v6, "downloadType":I
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isWifiConnected()Z

    move-result v11

    .line 307
    .local v11, "isWifiOk":Z
    if-nez v11, :cond_5

    .line 308
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isNetworkConnected()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 309
    invoke-static {}, Lcom/smartisanos/home/net/NetStatusUtil;->isEnableCellularDownload()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 310
    const/4 v6, 0x1

    .line 314
    :cond_5
    const/4 v2, 0x0

    aget-object v7, v10, v2

    .line 315
    .local v7, "fileMd5":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v5, v10, v2

    .line 316
    .local v5, "downloadUrl":Ljava/lang/String;
    const/4 v2, 0x2

    invoke-static/range {v2 .. v7}, Lcom/smartisanos/home/net/DownloadSupervisor;->requestDownload(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)J

    move-result-wide v8

    .line 317
    .local v8, "downloadId":J
    sget-object v2, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v13, "DEBUG"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "MSG_REQUEST_DOWNLOAD_THEME id "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    const-wide/16 v14, 0x0

    cmp-long v2, v8, v14

    if-gtz v2, :cond_1

    .line 319
    sget-object v2, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v13, "DEBUG"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleGET_THEME_DL_INFO download theme ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "] failed, by url ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    const-string v2, "com.smartisanos.home.THEME_DOWNLOAD_FAILED"

    invoke-static {v2, v3}, Lcom/smartisanos/launcher/actions/DownloadReceiver;->noticeTheme(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 293
    .end local v4    # "themeApkName":Ljava/lang/String;
    .end local v5    # "downloadUrl":Ljava/lang/String;
    .end local v6    # "downloadType":I
    .end local v7    # "fileMd5":Ljava/lang/String;
    .end local v8    # "downloadId":J
    .end local v10    # "downloadInfos":[Ljava/lang/String;
    .end local v11    # "isWifiOk":Z
    :catch_0
    move-exception v2

    goto/16 :goto_0
.end method

.method public static postTask(Lcom/smartisanos/home/net/NetworkHandler$Task;)V
    .locals 5
    .param p0, "task"    # Lcom/smartisanos/home/net/NetworkHandler$Task;

    .prologue
    .line 64
    if-nez p0, :cond_0

    .line 65
    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v2, "DEBUG"

    const-string v3, "postTask return by task is null"

    invoke-virtual {v1, v2, v3}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :goto_0
    return-void

    .line 68
    :cond_0
    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->mWorker:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 69
    .local v0, "msg":Landroid/os/Message;
    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->mWorker:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 70
    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v2, "A140"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "postTask ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/smartisanos/home/net/NetworkHandler$Task;->act:Lcom/smartisanos/home/net/NetworkHandler$Action;

    invoke-virtual {v4}, Lcom/smartisanos/home/net/NetworkHandler$Action;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
