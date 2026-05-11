.class Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;
.super Ljava/lang/Object;
.source "AppIconsSettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->showIconPackPicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

.field final synthetic val$packs:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    iput-object p2, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;->val$packs:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    if-nez p2, :cond_pack

    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    const-string v1, "__disabled__"

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->applySelectedIconPackPackage(Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void

    :cond_pack
    add-int/lit8 v1, p2, -0x1

    iget-object v2, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;->val$packs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$4;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->applySelectedIconPackPackage(Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
