.class Lcom/smartisanos/launcher/view/EditTitleDialog$3;
.super Ljava/lang/Object;
.source "EditTitleDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/view/EditTitleDialog;->show(Lcom/smartisanos/launcher/view/Page;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/view/EditTitleDialog;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/view/EditTitleDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/view/EditTitleDialog;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/smartisanos/launcher/view/EditTitleDialog$3;->this$0:Lcom/smartisanos/launcher/view/EditTitleDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/smartisanos/launcher/view/EditTitleDialog$3;->this$0:Lcom/smartisanos/launcher/view/EditTitleDialog;

    invoke-virtual {v0}, Lcom/smartisanos/launcher/view/EditTitleDialog;->dismiss()V

    .line 104
    return-void
.end method
