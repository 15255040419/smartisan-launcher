.class Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$7;
.super Ljava/lang/Object;
.source "ParticleConfigDialog.java"

# interfaces
.implements Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$onProgressChanged;


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
    .line 143
    iput-object p1, p0, Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog$7;->this$0:Lcom/smartisanos/launcher/particleconfig/ParticleConfigDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(F)V
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 147
    const/high16 v0, 0x447a0000    # 1000.0f

    div-float v0, p1, v0

    sput v0, Lcom/smartisanos/launcher/view/FlagDismissAnimation$FlagParticle;->mTestLifeH:F

    .line 149
    return-void
.end method
