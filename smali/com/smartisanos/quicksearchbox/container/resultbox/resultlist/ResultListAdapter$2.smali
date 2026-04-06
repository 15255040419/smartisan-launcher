.class Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter$2;
.super Ljava/lang/Object;
.source "ResultListAdapter.java"

# interfaces
.implements Lcom/smartisanos/quicksearchbox/ibase/BaseItemOnClikcListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter;


# direct methods
.method constructor <init>(Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter$2;->this$0:Lcom/smartisanos/quicksearchbox/container/resultbox/resultlist/ResultListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public longClick()Z
    .locals 1

    .prologue
    .line 156
    const/4 v0, 0x0

    return v0
.end method

.method public onClick()V
    .locals 0

    .prologue
    .line 162
    return-void
.end method
