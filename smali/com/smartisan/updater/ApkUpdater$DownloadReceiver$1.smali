.class Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;
.super Ljava/lang/Object;
.source "ApkUpdater.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;

.field final synthetic val$downloadManager:Landroid/app/DownloadManager;

.field final synthetic val$newContext:Landroid/content/Context;

.field final synthetic val$query:Landroid/app/DownloadManager$Query;


# direct methods
.method constructor <init>(Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;Landroid/app/DownloadManager;Landroid/app/DownloadManager$Query;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;

    .prologue
    .line 670
    iput-object p1, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->this$1:Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;

    iput-object p2, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$downloadManager:Landroid/app/DownloadManager;

    iput-object p3, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$query:Landroid/app/DownloadManager$Query;

    iput-object p4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$newContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 673
    new-instance v4, Landroid/os/StrictMode$VmPolicy$Builder;

    invoke-direct {v4}, Landroid/os/StrictMode$VmPolicy$Builder;-><init>()V

    invoke-virtual {v4}, Landroid/os/StrictMode$VmPolicy$Builder;->build()Landroid/os/StrictMode$VmPolicy;

    move-result-object v4

    invoke-static {v4}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    iget-object v4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$downloadManager:Landroid/app/DownloadManager;

    iget-object v5, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$query:Landroid/app/DownloadManager$Query;

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 674
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1

    .line 676
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 682
    const-string v4, "_id"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 683
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 685
    .local v2, "id":J
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 686
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 687
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 688
    iget-object v4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v4, v2, v3}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;

    move-result-object v4

    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 690
    iget-object v4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->val$newContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 691
    iget-object v4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->this$1:Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;

    invoke-static {v4}, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;->access$700(Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 690
    iget-object v4, p0, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver$1;->this$1:Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;

    iget-object v4, v4, Lcom/smartisan/updater/ApkUpdater$DownloadReceiver;->this$0:Lcom/smartisan/updater/ApkUpdater;

    invoke-static {v4}, Lcom/smartisan/updater/ApkUpdater;->access$100(Lcom/smartisan/updater/ApkUpdater;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 693
    .end local v1    # "file":Ljava/lang/String;
    .end local v2    # "fileIndex":I
    .end local v3    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 696
    :cond_1
    return-void

    .line 693
    :catchall_0
    move-exception v4

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v4
.end method
