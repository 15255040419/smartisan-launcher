.class Lcom/smartisanos/launcher/view/FloatPageNode$3;
.super Ljava/lang/Object;
.source "FloatPageNode.java"

# interfaces
.implements Lcom/smartisanos/smengine/SceneNode$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/view/FloatPageNode;->initListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/view/FloatPageNode;


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/view/FloatPageNode;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/view/FloatPageNode;

    .prologue
    .line 721
    iput-object p1, p0, Lcom/smartisanos/launcher/view/FloatPageNode$3;->this$0:Lcom/smartisanos/launcher/view/FloatPageNode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/smartisanos/smengine/SceneNode;)V
    .locals 1
    .param p1, "v"    # Lcom/smartisanos/smengine/SceneNode;

    .prologue
    .line 726
    iget-object v0, p0, Lcom/smartisanos/launcher/view/FloatPageNode$3;->this$0:Lcom/smartisanos/launcher/view/FloatPageNode;

    invoke-virtual {v0}, Lcom/smartisanos/launcher/view/FloatPageNode;->resetPage()V

    .line 727
    return-void
.end method
