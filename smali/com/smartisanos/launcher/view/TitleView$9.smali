.class Lcom/smartisanos/launcher/view/TitleView$9;
.super Lcom/smartisanos/smengine/Animation$AnimationListener;
.source "TitleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/view/TitleView;->setEyeState(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/view/TitleView;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/view/TitleView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/view/TitleView;

    .prologue
    .line 1285
    iput-object p1, p0, Lcom/smartisanos/launcher/view/TitleView$9;->this$0:Lcom/smartisanos/launcher/view/TitleView;

    invoke-direct {p0}, Lcom/smartisanos/smengine/Animation$AnimationListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnd()V
    .locals 2

    .prologue
    .line 1289
    iget-object v0, p0, Lcom/smartisanos/launcher/view/TitleView$9;->this$0:Lcom/smartisanos/launcher/view/TitleView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/smartisanos/launcher/view/TitleView;->access$802(Lcom/smartisanos/launcher/view/TitleView;Z)Z

    .line 1290
    return-void
.end method
