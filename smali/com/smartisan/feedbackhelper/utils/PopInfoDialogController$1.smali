.class Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController$1;
.super Ljava/lang/Object;
.source "PopInfoDialogController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;->initTransparentView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;


# direct methods
.method constructor <init>(Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController$1;->this$0:Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController$1;->this$0:Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;

    invoke-static {v0}, Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;->access$000(Lcom/smartisan/feedbackhelper/utils/PopInfoDialogController;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 51
    return-void
.end method
