.class Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSortComparator;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;

# instance fields
.field private mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;


# direct methods
.method public constructor <init>(Lcom/smartisanos/home/settings/icons/IconManager;)V
    .locals 0
    .param p1, "iconManager"    # Lcom/smartisanos/home/settings/icons/IconManager;

    .prologue
    .line 380
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSortComparator;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;
    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .prologue
    .line 385
    check-cast p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    check-cast p2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    # 1. Check if both are adapted (md5 != null)
    iget-object v0, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->md5:Ljava/lang/String;
    iget-object v1, p2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->md5:Ljava/lang/String;

    if-eqz v0, :cond_unadapted_lhs
    
    # LHS is adapted
    if-nez v1, :cond_both_same_type
    # RHS is unadapted, LHS comes first
    const/4 v2, -0x1
    return v2

    :cond_unadapted_lhs
    # LHS is unadapted
    if-eqz v1, :cond_both_same_type
    # RHS is adapted, RHS comes first
    const/4 v2, 0x1
    return v2

    :cond_both_same_type
    # Both same type, sort by title alphabetically
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSortComparator;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;
    iget-object v1, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;
    iget-object v2, p1, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/smartisanos/home/settings/icons/IconManager;->getLableForPackage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    
    if-nez v0, :cond_lhs_title_ok
    const-string v0, ""
    :cond_lhs_title_ok
    
    iget-object v1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSortComparator;->mIconManager:Lcom/smartisanos/home/settings/icons/IconManager;
    iget-object v2, p2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;
    iget-object v3, p2, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;
    invoke-virtual {v1, v2, v3}, Lcom/smartisanos/home/settings/icons/IconManager;->getLableForPackage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    
    if-nez v1, :cond_rhs_title_ok
    const-string v1, ""
    :cond_rhs_title_ok

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v2
    return v2
.end method
