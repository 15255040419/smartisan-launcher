.class public Lcom/smartisan/updater/Version;
.super Ljava/lang/Object;
.source "Version.java"


# static fields
.field private static final HAND_IN_HAND_DEFAULT_APK_SIZE:I = 0x3

.field private static final JSON_ITEM_FORCE:Ljava/lang/String; = "force"

.field private static final JSON_ITEM_OTA_UPDATE:Ljava/lang/String; = "ota_update"

.field private static final JSON_ITEM_SIZE:Ljava/lang/String; = "size"

.field private static final UPDATE_FLAG_ON:Ljava/lang/String; = "on"


# instance fields
.field private code:I

.field private mForceUpdate:Z

.field private mOtaUpdate:Z

.field private md5Str:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private needUpdate:Z

.field private size:J

.field private updateUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/smartisan/updater/Version;->mOtaUpdate:Z

    .line 17
    iput-boolean v0, p0, Lcom/smartisan/updater/Version;->mForceUpdate:Z

    .line 37
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "needUpdate"    # Z
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "code"    # I
    .param p4, "updateUrl"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/smartisan/updater/Version;->mOtaUpdate:Z

    .line 17
    iput-boolean v0, p0, Lcom/smartisan/updater/Version;->mForceUpdate:Z

    .line 29
    iput-boolean p1, p0, Lcom/smartisan/updater/Version;->needUpdate:Z

    .line 30
    iput-object p2, p0, Lcom/smartisan/updater/Version;->name:Ljava/lang/String;

    .line 31
    iput p3, p0, Lcom/smartisan/updater/Version;->code:I

    .line 32
    iput-object p4, p0, Lcom/smartisan/updater/Version;->updateUrl:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public static parse(Landroid/content/Context;Lorg/json/JSONObject;)Lcom/smartisan/updater/Version;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "object"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 92
    const/4 v0, 0x0

    .line 93
    .local v0, "version":Lcom/smartisan/updater/Version;
    if-eqz p1, :cond_0

    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p1, v1, :cond_0

    .line 94
    new-instance v0, Lcom/smartisan/updater/Version;

    .end local v0    # "version":Lcom/smartisan/updater/Version;
    invoke-direct {v0}, Lcom/smartisan/updater/Version;-><init>()V

    .line 95
    .restart local v0    # "version":Lcom/smartisan/updater/Version;
    const-string v1, "version_name"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/smartisan/updater/Version;->name:Ljava/lang/String;

    .line 96
    const-string v1, "version_code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/smartisan/updater/Version;->code:I

    .line 97
    const-string v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/smartisan/updater/Version;->updateUrl:Ljava/lang/String;

    .line 98
    iget v1, v0, Lcom/smartisan/updater/Version;->code:I

    invoke-static {p0, v1}, Lcom/smartisan/updater/UpdateUtils;->isNeedUpdate(Landroid/content/Context;I)Z

    move-result v1

    iput-boolean v1, v0, Lcom/smartisan/updater/Version;->needUpdate:Z

    .line 100
    const-string v1, "size"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v0, Lcom/smartisan/updater/Version;->size:J

    .line 101
    const-string v1, "on"

    const-string v4, "ota_update"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, v0, Lcom/smartisan/updater/Version;->mOtaUpdate:Z

    .line 103
    const-string v1, "on"

    const-string v4, "force"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_1
    iput-boolean v2, v0, Lcom/smartisan/updater/Version;->mForceUpdate:Z

    .line 105
    const-string v1, "md5"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/smartisan/updater/Version;->md5Str:Ljava/lang/String;

    .line 107
    :cond_0
    return-object v0

    :cond_1
    move v1, v3

    .line 101
    goto :goto_0

    :cond_2
    move v2, v3

    .line 103
    goto :goto_1
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/smartisan/updater/Version;->code:I

    return v0
.end method

.method public getMd5Str()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/smartisan/updater/Version;->md5Str:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/smartisan/updater/Version;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/smartisan/updater/Version;->size:J

    return-wide v0
.end method

.method public getUpdateUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/smartisan/updater/Version;->updateUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isForceUpdateOn()Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/smartisan/updater/Version;->mForceUpdate:Z

    return v0
.end method

.method public isNeedUpdate()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/smartisan/updater/Version;->needUpdate:Z

    return v0
.end method

.method public isOtaUpdateOn()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/smartisan/updater/Version;->mOtaUpdate:Z

    return v0
.end method

.method public setCode(I)V
    .locals 0
    .param p1, "code"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/smartisan/updater/Version;->code:I

    .line 53
    return-void
.end method

.method public setMd5Str(Ljava/lang/String;)V
    .locals 0
    .param p1, "md5Str"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/smartisan/updater/Version;->md5Str:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/smartisan/updater/Version;->name:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setNeedUpdate(Z)V
    .locals 0
    .param p1, "needUpdate"    # Z

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/smartisan/updater/Version;->needUpdate:Z

    .line 85
    return-void
.end method

.method public setUpdateUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "updateUrl"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/smartisan/updater/Version;->updateUrl:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NoteVersion [needUpdate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/smartisan/updater/Version;->needUpdate:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/smartisan/updater/Version;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/smartisan/updater/Version;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", updateUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/smartisan/updater/Version;->updateUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
