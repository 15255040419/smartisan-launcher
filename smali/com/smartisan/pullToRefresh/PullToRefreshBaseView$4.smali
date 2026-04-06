.class Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$4;
.super Ljava/lang/Object;
.source "PullToRefreshBaseView.java"

# interfaces
.implements Lcom/smartisan/pullToRefresh/ConversationListFooterView$FooterViewClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;->onAttachedToWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;


# direct methods
.method constructor <init>(Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;)V
    .locals 0

    .prologue
    .line 309
    iput-object p1, p0, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$4;->this$0:Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFooterViewLoadMoreClick()V
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$4;->this$0:Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;

    invoke-static {v0}, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;->access$400(Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;)Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$RefreshListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 313
    iget-object v0, p0, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$4;->this$0:Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;

    invoke-static {v0}, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;->access$400(Lcom/smartisan/pullToRefresh/PullToRefreshBaseView;)Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$RefreshListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/smartisan/pullToRefresh/PullToRefreshBaseView$RefreshListener;->onPullUpToLoad()V

    .line 315
    :cond_0
    return-void
.end method
