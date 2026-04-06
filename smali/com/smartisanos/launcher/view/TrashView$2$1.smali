.class Lcom/smartisanos/launcher/view/TrashView$2$1;
.super Ljava/lang/Object;
.source "TrashView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/view/TrashView$2;->onComplete()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/smartisanos/launcher/view/TrashView$2;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/view/TrashView$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/smartisanos/launcher/view/TrashView$2;

    .prologue
    .line 477
    iput-object p1, p0, Lcom/smartisanos/launcher/view/TrashView$2$1;->this$1:Lcom/smartisanos/launcher/view/TrashView$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 480
    invoke-static {}, Lcom/smartisanos/launcher/view/MainView;->getInstance()Lcom/smartisanos/launcher/view/MainView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/smartisanos/launcher/view/MainView;->getLauncherApplication()Lcom/smartisanos/launcher/LauncherApplication;

    move-result-object v0

    sget v1, Lcom/smartisanos/launcher/ResIds$string;->uninstal_user_app_success:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 481
    return-void
.end method
