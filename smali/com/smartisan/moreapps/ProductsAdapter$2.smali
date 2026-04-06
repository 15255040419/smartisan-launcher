.class Lcom/smartisan/moreapps/ProductsAdapter$2;
.super Ljava/lang/Object;
.source "ProductsAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/moreapps/ProductsAdapter;->showDialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/moreapps/ProductsAdapter;


# direct methods
.method constructor <init>(Lcom/smartisan/moreapps/ProductsAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisan/moreapps/ProductsAdapter;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/smartisan/moreapps/ProductsAdapter$2;->this$0:Lcom/smartisan/moreapps/ProductsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 152
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 153
    return-void
.end method
