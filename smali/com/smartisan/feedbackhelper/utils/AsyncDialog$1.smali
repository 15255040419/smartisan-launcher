.class Lcom/smartisan/feedbackhelper/utils/AsyncDialog$1;
.super Ljava/lang/Object;
.source "AsyncDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisan/feedbackhelper/utils/AsyncDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/feedbackhelper/utils/AsyncDialog;


# direct methods
.method constructor <init>(Lcom/smartisan/feedbackhelper/utils/AsyncDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisan/feedbackhelper/utils/AsyncDialog;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/smartisan/feedbackhelper/utils/AsyncDialog$1;->this$0:Lcom/smartisan/feedbackhelper/utils/AsyncDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/smartisan/feedbackhelper/utils/AsyncDialog$1;->this$0:Lcom/smartisan/feedbackhelper/utils/AsyncDialog;

    invoke-static {v0}, Lcom/smartisan/feedbackhelper/utils/AsyncDialog;->access$000(Lcom/smartisan/feedbackhelper/utils/AsyncDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/smartisan/feedbackhelper/utils/AsyncDialog$1;->this$0:Lcom/smartisan/feedbackhelper/utils/AsyncDialog;

    invoke-static {v0}, Lcom/smartisan/feedbackhelper/utils/AsyncDialog;->access$000(Lcom/smartisan/feedbackhelper/utils/AsyncDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 73
    :cond_0
    return-void
.end method
