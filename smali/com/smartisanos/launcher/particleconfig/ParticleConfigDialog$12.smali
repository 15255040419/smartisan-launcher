.class Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$12;
.super Ljava/lang/Object;
.source "ParticleConfigDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$12;->this$0:Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 206
    invoke-static {}, Lcom/smartisanos/launcher/view/FlagDismissAnimation$FlagParticle;->reset()V

    .line 207
    iget-object v0, p0, Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$12;->this$0:Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;

    invoke-static {v0}, Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;->access$100(Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;)V

    .line 208
    return-void
.end method
