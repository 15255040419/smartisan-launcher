.class public interface abstract Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxContract$Presenter;
.super Ljava/lang/Object;
.source "ResultBoxContract.java"

# interfaces
.implements Lcom/smartisanos/quicksearchbox/ibase/BasePresenter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Presenter"
.end annotation


# virtual methods
.method public abstract clearQueryResultShowBackground()V
.end method

.method public abstract createQwertyQueryResult(Ljava/lang/String;)V
.end method

.method public abstract createT9QueryResult(Ljava/lang/String;)V
.end method
