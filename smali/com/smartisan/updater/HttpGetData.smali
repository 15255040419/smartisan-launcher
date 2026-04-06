.class public Lcom/smartisan/updater/HttpGetData;
.super Ljava/lang/Object;
.source "HttpGetData.java"


# static fields
.field private static final RETRY_TIMES:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeHttpGet(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 33
    const/4 v2, 0x0

    .line 35
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 36
    .local v0, "Url":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v3, v2

    .line 41
    .end local v0    # "Url":Ljava/net/URL;
    :goto_0
    return-object v3

    .line 38
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 41
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public executeHttpGetWithRetry(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 13
    const/4 v0, 0x0

    .line 14
    .local v0, "count":I
    const/4 v1, 0x0

    .line 16
    .local v1, "inStream":Ljava/io/InputStream;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 17
    :cond_0
    const/4 v2, 0x3

    if-ge v0, v2, :cond_1

    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    invoke-virtual {p0, p1}, Lcom/smartisan/updater/HttpGetData;->executeHttpGet(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 20
    if-eqz v1, :cond_0

    .line 26
    :cond_1
    return-object v1
.end method
