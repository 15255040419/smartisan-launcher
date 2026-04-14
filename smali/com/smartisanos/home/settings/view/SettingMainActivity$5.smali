.class Lcom/smartisanos/home/settings/view/SettingMainActivity$5;
.super Ljava/lang/Object;
.source "SettingMainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/smartisanos/home/settings/view/SettingMainActivity;


# direct methods
.method constructor <init>(Lcom/smartisanos/home/settings/view/SettingMainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/home/settings/view/SettingMainActivity;

    .prologue
    .line 296
    iput-object p1, p0, Lcom/smartisanos/home/settings/view/SettingMainActivity$5;->this$0:Lcom/smartisanos/home/settings/view/SettingMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 299
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/SettingMainActivity$5;->this$0:Lcom/smartisanos/home/settings/view/SettingMainActivity;

    .line 301
    invoke-static {v0}, Lcom/smartisanos/home/settings/view/SettingMainActivity;->access$500(Lcom/smartisanos/home/settings/view/SettingMainActivity;)V

    .line 303
    invoke-static {v0}, Lcom/smartisan/updater/UpdateSharedPreference;->getInstance(Landroid/content/Context;)Lcom/smartisan/updater/UpdateSharedPreference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/smartisan/updater/UpdateSharedPreference;->getDownloadId()J

    move-result-wide v1

    .line 305
    invoke-static {v0, v1, v2}, Lcom/smartisan/updater/UpdateUtils;->isDownloadProcessing(Landroid/content/Context;J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 307
    const v1, 0x7f080270

    invoke-static {v0, v1}, Lcom/smartisan/updater/UpdateUtils;->showToast(Landroid/content/Context;I)V

    return-void

    :cond_0
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/smartisanos/launcher/data/Utils;->checkUpdate(Landroid/app/Activity;Z)V

    return-void
.end method
