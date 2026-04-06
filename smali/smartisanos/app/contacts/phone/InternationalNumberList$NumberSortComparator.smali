.class public Lsmartisanos/app/contacts/phone/InternationalNumberList$NumberSortComparator;
.super Ljava/lang/Object;
.source "InternationalNumberList.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsmartisanos/app/contacts/phone/InternationalNumberList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NumberSortComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lsmartisanos/app/contacts/phone/InternationalNumberList;


# direct methods
.method public constructor <init>(Lsmartisanos/app/contacts/phone/InternationalNumberList;)V
    .locals 0

    .prologue
    .line 341
    iput-object p1, p0, Lsmartisanos/app/contacts/phone/InternationalNumberList$NumberSortComparator;->this$0:Lsmartisanos/app/contacts/phone/InternationalNumberList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 341
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lsmartisanos/app/contacts/phone/InternationalNumberList$NumberSortComparator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p1, "lhs"    # Ljava/lang/String;
    .param p2, "rhs"    # Ljava/lang/String;

    .prologue
    .line 345
    invoke-virtual {p2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
