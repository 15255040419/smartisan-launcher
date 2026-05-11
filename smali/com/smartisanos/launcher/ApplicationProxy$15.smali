.class Lcom/smartisanos/launcher/ApplicationProxy$15;
.super Ljava/lang/Object;
.source "ApplicationProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/launcher/ApplicationProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/ApplicationProxy;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/ApplicationProxy;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/ApplicationProxy;

    .prologue
    iput-object p1, p0, Lcom/smartisanos/launcher/ApplicationProxy$15;->this$0:Lcom/smartisanos/launcher/ApplicationProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    invoke-static {}, Lcom/smartisanos/launcher/view/MainView;->getInstance()Lcom/smartisanos/launcher/view/MainView;

    move-result-object v0

    if-eqz v0, :cond_return

    invoke-virtual {v0}, Lcom/smartisanos/launcher/view/MainView;->getPageView()Lcom/smartisanos/launcher/view/PageView;

    move-result-object v1

    if-eqz v1, :cond_return

    invoke-virtual {v1}, Lcom/smartisanos/launcher/view/PageView;->getAnimationController()Lcom/smartisanos/launcher/view/AnimationController;

    move-result-object v2

    if-eqz v2, :cond_return

    invoke-virtual {v2}, Lcom/smartisanos/launcher/view/AnimationController;->isUnLockAnimationRunning()Z

    move-result v3

    if-eqz v3, :cond_return

    invoke-static {}, Lcom/smartisanos/launcher/ApplicationProxy;->access$200()Lcom/smartisanos/launcher/LOG;

    move-result-object v3

    const-string v4, "### unlock animation watchdog force finish"

    invoke-virtual {v3, v4}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/smartisanos/launcher/ApplicationProxy$15;->this$0:Lcom/smartisanos/launcher/ApplicationProxy;

    invoke-static {v3}, Lcom/smartisanos/launcher/ApplicationProxy;->access$700(Lcom/smartisanos/launcher/ApplicationProxy;)Lcom/smartisanos/smengine/Event;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/smartisanos/smengine/Event;->send(F)V

    :cond_return
    return-void
.end method
