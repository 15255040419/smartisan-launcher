.class Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard$1;
.super Ljava/lang/Object;
.source "T9KeyBoard.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;->initDialButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;


# direct methods
.method constructor <init>(Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard$1;->this$0:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard$1;->this$0:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;

    invoke-static {v0}, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;->access$000(Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9KeyBoard;)Lcom/smartisanos/quicksearchbox/SearchMainActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->clearResultFromT9KeyBoard()V

    .line 102
    const/4 v0, 0x1

    return v0
.end method
