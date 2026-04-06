.class final Lcom/smartisanos/home/net/NetworkHandler$NetUtils;
.super Ljava/lang/Object;
.source "NetworkHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/home/net/NetworkHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NetUtils"
.end annotation


# static fields
.field private static final TAG_LAST_UPDATE_TIME:Ljava/lang/String; = "last_update_time"

.field private static final TAG_MD5:Ljava/lang/String; = "md5"

.field private static final TAG_PACKAGE:Ljava/lang/String; = "package"

.field private static final sHexDigits:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 476
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->sHexDigits:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$500(Lcom/smartisanos/launcher/data/ItemInfo;)[B
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/launcher/data/ItemInfo;

    .prologue
    .line 475
    invoke-static {p0}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getIconDataFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)[B

    move-result-object v0

    return-object v0
.end method

.method public static bytesToString([B)Ljava/lang/String;
    .locals 6
    .param p0, "data"    # [B

    .prologue
    .line 636
    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    new-array v2, v3, [C

    .line 637
    .local v2, "str":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 638
    aget-byte v0, p0, v1

    .line 639
    .local v0, "b":B
    mul-int/lit8 v3, v1, 0x2

    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->sHexDigits:[C

    ushr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v2, v3

    .line 640
    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    sget-object v4, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->sHexDigits:[C

    and-int/lit8 v5, v0, 0xf

    aget-char v4, v4, v5

    aput-char v4, v2, v3

    .line 637
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 642
    .end local v0    # "b":B
    :cond_0
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([C)V

    return-object v3
.end method

.method private static getIconDataFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)[B
    .locals 10
    .param p0, "item"    # Lcom/smartisanos/launcher/data/ItemInfo;

    .prologue
    .line 514
    const/4 v3, 0x0

    .line 515
    .local v3, "data":[B
    if-nez p0, :cond_0

    move-object v4, v3

    .line 536
    .end local v3    # "data":[B
    .local v4, "data":[B
    :goto_0
    return-object v4

    .line 518
    .end local v4    # "data":[B
    .restart local v3    # "data":[B
    :cond_0
    iget-object v8, p0, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;

    .line 519
    .local v8, "packageName":Ljava/lang/String;
    iget-object v5, p0, Lcom/smartisanos/launcher/data/ItemInfo;->iconDrawableName:Ljava/lang/String;

    .line 520
    .local v5, "drawableName":Ljava/lang/String;
    invoke-static {v8, v5}, Lcom/smartisanos/home/net/NetworkHandler;->access$600(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v9

    invoke-static {v9}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getInputStreamByUrl(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v7

    .line 521
    .local v7, "is":Ljava/io/InputStream;
    if-nez v7, :cond_1

    move-object v4, v3

    .line 522
    .end local v3    # "data":[B
    .restart local v4    # "data":[B
    goto :goto_0

    .line 524
    .end local v4    # "data":[B
    .restart local v3    # "data":[B
    :cond_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 526
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v9, 0x1000

    :try_start_0
    new-array v1, v9, [B

    .line 527
    .local v1, "buf":[B
    const/4 v2, -0x1

    .line 528
    .local v2, "count":I
    :goto_1
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_2

    .line 529
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 533
    .end local v1    # "buf":[B
    .end local v2    # "count":I
    :catch_0
    move-exception v6

    .line 534
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .end local v6    # "e":Ljava/lang/Exception;
    :goto_2
    move-object v4, v3

    .line 536
    .end local v3    # "data":[B
    .restart local v4    # "data":[B
    goto :goto_0

    .line 531
    .end local v4    # "data":[B
    .restart local v1    # "buf":[B
    .restart local v2    # "count":I
    .restart local v3    # "data":[B
    :cond_2
    :try_start_1
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 532
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_2
.end method

.method private static getIconInfoFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)[B
    .locals 13
    .param p0, "item"    # Lcom/smartisanos/launcher/data/ItemInfo;

    .prologue
    .line 540
    iget-object v8, p0, Lcom/smartisanos/launcher/data/ItemInfo;->packageName:Ljava/lang/String;

    .line 541
    .local v8, "packageName":Ljava/lang/String;
    iget-object v5, p0, Lcom/smartisanos/launcher/data/ItemInfo;->iconDrawableName:Ljava/lang/String;

    .line 542
    .local v5, "drawableName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 543
    .local v3, "data":[B
    invoke-static {v8, v5}, Lcom/smartisanos/home/net/NetworkHandler;->getInfoUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v9

    invoke-static {v9}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getInputStreamByUrl(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v7

    .line 544
    .local v7, "is":Ljava/io/InputStream;
    if-nez v7, :cond_0

    move-object v4, v3

    .line 561
    .end local v3    # "data":[B
    .local v4, "data":[B
    :goto_0
    return-object v4

    .line 548
    .end local v4    # "data":[B
    .restart local v3    # "data":[B
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 549
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v9, 0x400

    new-array v1, v9, [B

    .line 550
    .local v1, "buf":[B
    const/4 v2, -0x1

    .line 551
    .local v2, "count":I
    :goto_1
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_1

    .line 552
    sget-object v9, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v10, "A140"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getIconInfoFromServer read byte count --> "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 558
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "buf":[B
    .end local v2    # "count":I
    :catch_0
    move-exception v6

    .line 559
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .end local v6    # "e":Ljava/lang/Exception;
    :goto_2
    move-object v4, v3

    .line 561
    .end local v3    # "data":[B
    .restart local v4    # "data":[B
    goto :goto_0

    .line 555
    .end local v4    # "data":[B
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "buf":[B
    .restart local v2    # "count":I
    .restart local v3    # "data":[B
    :cond_1
    :try_start_1
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 556
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 557
    sget-object v9, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v10, "A140"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "return data ==> "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public static getInfoFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .locals 4
    .param p0, "item"    # Lcom/smartisanos/launcher/data/ItemInfo;

    .prologue
    .line 501
    invoke-static {p0}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->getIconInfoFromServer(Lcom/smartisanos/launcher/data/ItemInfo;)[B

    move-result-object v0

    .line 502
    .local v0, "data":[B
    if-nez v0, :cond_0

    .line 503
    sget-object v1, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v2, "DEBUG"

    const-string v3, "getIconInfoFromServer return null, by can\'t get data from server"

    invoke-virtual {v1, v2, v3}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    const/4 v1, 0x0

    .line 506
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->parseData([B)Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    move-result-object v1

    goto :goto_0
.end method

.method public static getInputStreamByUrl(Ljava/net/URL;)Ljava/io/InputStream;
    .locals 6
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 482
    if-nez p0, :cond_1

    .line 483
    sget-object v3, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v4, "DEBUG"

    const-string v5, "getInputStreamByUrl url is null !"

    invoke-virtual {v3, v4, v5}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    const/4 v2, 0x0

    .line 497
    :cond_0
    :goto_0
    return-object v2

    .line 486
    :cond_1
    const/4 v2, 0x0

    .line 488
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 489
    .local v0, "conn":Ljava/net/HttpURLConnection;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 490
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 491
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 492
    .end local v0    # "conn":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v1

    .line 493
    .local v1, "e":Ljava/lang/Exception;
    instance-of v3, v1, Ljava/io/FileNotFoundException;

    if-nez v3, :cond_0

    .line 494
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getMd5([B)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # [B

    .prologue
    .line 620
    if-nez p0, :cond_0

    .line 621
    const/4 v2, 0x0

    .line 632
    :goto_0
    return-object v2

    .line 624
    :cond_0
    const/4 v2, 0x0

    .line 626
    .local v2, "value":Ljava/lang/String;
    :try_start_0
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 627
    .local v1, "md5":Ljava/security/MessageDigest;
    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 628
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/smartisanos/home/net/NetworkHandler$NetUtils;->bytesToString([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 629
    .end local v1    # "md5":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 630
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static parseData([B)Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .locals 14
    .param p0, "data"    # [B

    .prologue
    .line 565
    const/4 v3, 0x0

    .line 566
    .local v3, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    if-eqz p0, :cond_0

    array-length v10, p0

    if-nez v10, :cond_1

    .line 567
    :cond_0
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "A140"

    const-string v12, "parseData by data is empty"

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v3

    .line 616
    .end local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .local v4, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :goto_0
    return-object v4

    .line 570
    .end local v4    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .restart local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 571
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 572
    .local v8, "reader":Ljava/io/InputStreamReader;
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 573
    .local v7, "parser":Lorg/xmlpull/v1/XmlPullParser;
    new-instance v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .end local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    invoke-direct {v3}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;-><init>()V

    .line 574
    .restart local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    const/4 v6, 0x0

    .line 576
    .local v6, "parseException":Ljava/lang/Exception;
    :try_start_0
    invoke-interface {v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 577
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v9

    .line 578
    .local v9, "type":I
    const/4 v2, 0x0

    .line 579
    .local v2, "handleTag":Ljava/lang/String;
    :goto_1
    const/4 v10, 0x1

    if-eq v9, v10, :cond_a

    .line 580
    if-nez v9, :cond_3

    .line 601
    :cond_2
    :goto_2
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v9

    goto :goto_1

    .line 581
    :cond_3
    const/4 v10, 0x2

    if-ne v9, v10, :cond_5

    .line 582
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 583
    .local v5, "name":Ljava/lang/String;
    const-string v10, "package"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    const-string v10, "md5"

    .line 584
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    const-string v10, "last_update_time"

    .line 585
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 586
    :cond_4
    move-object v2, v5

    goto :goto_2

    .line 588
    .end local v5    # "name":Ljava/lang/String;
    :cond_5
    const/4 v10, 0x3

    if-ne v9, v10, :cond_6

    .line 589
    const/4 v2, 0x0

    goto :goto_2

    .line 590
    :cond_6
    const/4 v10, 0x4

    if-ne v9, v10, :cond_2

    .line 591
    if-eqz v2, :cond_2

    .line 592
    const-string v10, "package"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 593
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_2

    .line 605
    .end local v2    # "handleTag":Ljava/lang/String;
    .end local v9    # "type":I
    :catch_0
    move-exception v1

    .line 606
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    move-object v6, v1

    .line 612
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_3
    if-eqz v6, :cond_7

    .line 613
    const/4 v3, 0x0

    .line 614
    sget-object v10, Lcom/smartisanos/home/net/NetworkHandler;->log:Lcom/smartisanos/launcher/LOG;

    const-string v11, "DEBUG"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "RedirectIconInfo parseData error, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    move-object v4, v3

    .line 616
    .end local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .restart local v4    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    goto/16 :goto_0

    .line 594
    .end local v4    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .restart local v2    # "handleTag":Ljava/lang/String;
    .restart local v3    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .restart local v9    # "type":I
    :cond_8
    :try_start_1
    const-string v10, "md5"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 595
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->md5:Ljava/lang/String;

    goto :goto_2

    .line 607
    .end local v2    # "handleTag":Ljava/lang/String;
    .end local v9    # "type":I
    :catch_1
    move-exception v1

    .line 608
    .local v1, "e":Ljava/io/IOException;
    move-object v6, v1

    .line 611
    goto :goto_3

    .line 596
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "handleTag":Ljava/lang/String;
    .restart local v9    # "type":I
    :cond_9
    const-string v10, "last_update_time"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 597
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->lastUpdateTime:Ljava/lang/String;

    goto/16 :goto_2

    .line 609
    .end local v2    # "handleTag":Ljava/lang/String;
    .end local v9    # "type":I
    :catch_2
    move-exception v1

    .line 610
    .local v1, "e":Ljava/lang/Exception;
    move-object v6, v1

    goto :goto_3

    .line 603
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "handleTag":Ljava/lang/String;
    .restart local v9    # "type":I
    :cond_a
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V

    .line 604
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_3
.end method
