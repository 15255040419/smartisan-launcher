.class Lcom/smartisan/updater/ApkUpdater$7;
.super Ljava/lang/Object;
.source "ApkUpdater.java"

# interfaces
.implements Landroid/view/View$OnClickListener;

# instance fields
.field final synthetic val$dialog:Landroid/content/DialogInterface;
.field final synthetic val$listener:Landroid/content/DialogInterface$OnClickListener;

# direct methods
.method constructor <init>(Landroid/content/DialogInterface;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/smartisan/updater/ApkUpdater$7;->val$dialog:Landroid/content/DialogInterface;

    iput-object p2, p0, Lcom/smartisan/updater/ApkUpdater$7;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/smartisan/updater/ApkUpdater$7;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/smartisan/updater/ApkUpdater$7;->val$dialog:Landroid/content/DialogInterface;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    # Automatically dismiss the dialog after click
    iget-object v1, p0, Lcom/smartisan/updater/ApkUpdater$7;->val$dialog:Landroid/content/DialogInterface;

    check-cast v1, Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method
