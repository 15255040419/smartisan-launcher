.class Lsmartisanos/widget/ShareView$2;
.super Ljava/lang/Object;
.source "ShareView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lsmartisanos/widget/ShareView;->checkActiveComponent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lsmartisanos/widget/ShareView;


# direct methods
.method constructor <init>(Lsmartisanos/widget/ShareView;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lsmartisanos/widget/ShareView$2;->this$0:Lsmartisanos/widget/ShareView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lsmartisanos/widget/ShareView$2;->this$0:Lsmartisanos/widget/ShareView;

    invoke-static {v0}, Lsmartisanos/widget/ShareView;->access$000(Lsmartisanos/widget/ShareView;)V

    .line 127
    return-void
.end method
