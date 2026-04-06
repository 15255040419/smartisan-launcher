.class Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView$3;
.super Ljava/lang/Object;
.source "PinnedSectionListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;


# direct methods
.method constructor <init>(Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;)V
    .locals 0

    .prologue
    .line 381
    iput-object p1, p0, Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView$3;->this$0:Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView$3;->this$0:Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;

    invoke-virtual {v0}, Lcom/smartisan/pullToRefresh/pinnedhead/PinnedSectionListView;->recreatePinnedShadow()V

    .line 385
    return-void
.end method
