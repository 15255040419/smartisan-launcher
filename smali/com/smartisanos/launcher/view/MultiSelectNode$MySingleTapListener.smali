.class public Lcom/smartisanos/launcher/view/MultiSelectNode$MySingleTapListener;
.super Ljava/lang/Object;
.source "MultiSelectNode.java"

# interfaces
.implements Lcom/smartisanos/smengine/SceneNode$SingleTapListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/launcher/view/MultiSelectNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MySingleTapListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/launcher/view/MultiSelectNode;


# direct methods
.method public constructor <init>(Lcom/smartisanos/launcher/view/MultiSelectNode;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/launcher/view/MultiSelectNode;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/smartisanos/launcher/view/MultiSelectNode$MySingleTapListener;->this$0:Lcom/smartisanos/launcher/view/MultiSelectNode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/smartisanos/smengine/TouchEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/smartisanos/smengine/TouchEvent;

    .prologue
    .line 196
    return-void
.end method
