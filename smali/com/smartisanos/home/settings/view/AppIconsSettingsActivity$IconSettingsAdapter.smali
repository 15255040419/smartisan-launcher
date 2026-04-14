.class Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;
.super Landroid/widget/BaseAdapter;
.source "AppIconsSettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IconSettingsAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;


# direct methods
.method public constructor <init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;Landroid/content/Context;)V
    .locals 1
    .param p1, "this$0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 391
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 392
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 396
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$1100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;
    move-result-object v0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    move-result v0
    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 401
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$1100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;
    move-result-object v0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 406
    int-to-long v0, p1
    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 411
    if-eqz p1, :cond_item_zero

    # --- Data Logic ---
    invoke-virtual {p0, p1}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1

    # Check for Section Header (String)
    instance-of v8, v1, Ljava/lang/String;
    if-eqz v8, :cond_header

    # --- Header Case ---
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;
    const v9, 0x7f04005b
    const/4 v10, 0x0
    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p2
    move-object v8, p2
    check-cast v8, Landroid/widget/TextView;
    check-cast v1, Ljava/lang/String;
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-object p2

    :cond_header
    # --- Normal Item Case ---
    const/4 v7, 0x0 # needReload
    if-eqz p2, :cond_inflate
    # check if existing convertView is a header or switch
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v3
    if-eqz v3, :cond_inflate
    instance-of v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    if-eqz v8, :cond_inflate
    check-cast v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    goto :populate

    :cond_inflate
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;
    const v9, 0x7f04001e
    const/4 v10, 0x0
    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p2
    new-instance v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    invoke-direct {v3, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;)V
    
    # Init ViewHolder
    const v8, 0x7f0f006c
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/RelativeLayout;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->layout:Landroid/widget/RelativeLayout;
    const v8, 0x7f0f006f
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIcon:Landroid/widget/ImageView;
    const v8, 0x7f0f0070
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;
    const v8, 0x7f0f006e
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;
    const v8, 0x7f0f0073
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIcon:Landroid/widget/ImageView;
    const v8, 0x7f0f0074
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;
    const v8, 0x7f0f0072
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/ImageView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;
    const v8, 0x7f0f0076
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/TextView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->appName:Landroid/widget/TextView;
    const v8, 0x7f0f0077
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
    check-cast v8, Landroid/widget/TextView;
    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;
    invoke-virtual {p2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :populate
    # background logic
    move-object v8, p0
    move v9, p1
    invoke-direct {v8, v9}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getBackgroundForPosition(I)I
    move-result v9
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->layout:Landroid/widget/RelativeLayout;
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V
    move-object v4, v1
    check-cast v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    
    # selection frames
    iget-boolean v8, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z
    if-eqz v8, :cond_improved
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;
    const/16 v9, 0x8
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;
    const/4 v9, 0x0
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;
    const v9, 0x7f080100
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V
    goto :icon_load
    :cond_improved
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;
    const/4 v9, 0x0
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;
    const/16 v9, 0x8
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;
    const v9, 0x7f08009d
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    :icon_load
    iget-object v9, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIcon:Landroid/widget/ImageView;
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$700(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;
    move-result-object v8
    invoke-virtual {v4}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->getPrimaryId()Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v8, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Landroid/graphics/drawable/Drawable;
    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    
    iget-object v9, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIcon:Landroid/widget/ImageView;
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$800(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;
    move-result-object v8
    invoke-virtual {v4}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->getPrimaryId()Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v8, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Landroid/graphics/drawable/Drawable;
    
    # ALWAYS clear the image first to prevent flickering/reuse issues
    const/4 v10, 0x0
    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz v8, :cond_set_plus
    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    goto :cond_icon_load_done

    :cond_set_plus
    const v8, 0x7f0202bb # ic_add_icon_plus
    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_icon_load_done
    # Row index: compute absolute index in mIconInfoList and add 1
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    iget-object v8, v8, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->mIconInfoList:Ljava/util/ArrayList;
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I
    move-result v8
    add-int/lit8 v8, v8, 0x1
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$600(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/icons/IconManager;
    move-result-object v8
    iget-object v9, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;
    iget-object v10, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;
    invoke-virtual {v8, v9, v10}, Lcom/smartisanos/home/settings/icons/IconManager;->getLableForPackage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->appName:Landroid/widget/TextView;
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-object p2

    :cond_item_zero
    # --- Switch Case ---
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$900(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Landroid/widget/LinearLayout;
    move-result-object p2
    return-object p2
.end method

.method private getBackgroundForPosition(I)I
    .locals 5

    const/4 v0, 0x0 # isTop
    const/4 v1, 0x0 # isBottom
    
    # 1. Check if Top
    if-nez p1, :cond_check_top
    const/4 v0, 0x1
    goto :cond_check_bottom
    :cond_check_top
    add-int/lit8 v2, p1, -0x1
    invoke-virtual {p0, v2}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
    instance-of v2, v2, Ljava/lang/String;
    if-eqz v2, :cond_check_bottom
    const/4 v0, 0x1

    :cond_check_bottom
    # 2. Check if Bottom
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getCount()I
    move-result v2
    add-int/lit8 v2, v2, -0x1
    if-ne p1, v2, :cond_check_next
    const/4 v1, 0x1
    goto :cond_final
    :cond_check_next
    add-int/lit8 v2, p1, 0x1
    invoke-virtual {p0, v2}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
    instance-of v2, v2, Ljava/lang/String;
    if-eqz v2, :cond_final
    const/4 v1, 0x1

    :cond_final
    # 3. Choose background
    if-eqz v0, :cond_middle
    if-eqz v1, :cond_top_only
    const v3, 0x7f0201cd # selector_setting_sub_item_bg_single
    return v3
    :cond_top_only
    const v3, 0x7f0201ce # selector_setting_sub_item_bg_top
    return v3
    :cond_middle
    if-eqz v1, :cond_mid_only
    const v3, 0x7f0201cb # selector_setting_sub_item_bg_bottom
    return v3
    :cond_mid_only
    const v3, 0x7f0201cc # selector_setting_sub_item_bg_middle
    return v3
.end method
