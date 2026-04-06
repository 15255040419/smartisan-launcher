.class Lcom/smartisan/useragreement/UserAgreementActivity$2;
.super Ljava/lang/Object;
.source "UserAgreementActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/useragreement/UserAgreementActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/useragreement/UserAgreementActivity;


# direct methods
.method constructor <init>(Lcom/smartisan/useragreement/UserAgreementActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisan/useragreement/UserAgreementActivity;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/smartisan/useragreement/UserAgreementActivity$2;->this$0:Lcom/smartisan/useragreement/UserAgreementActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/smartisan/useragreement/UserAgreementActivity$2;->this$0:Lcom/smartisan/useragreement/UserAgreementActivity;

    invoke-virtual {v0}, Lcom/smartisan/useragreement/UserAgreementActivity;->finish()V

    .line 88
    return-void
.end method
