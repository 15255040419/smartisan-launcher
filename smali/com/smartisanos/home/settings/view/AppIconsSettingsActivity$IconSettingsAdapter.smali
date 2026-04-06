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

    invoke-static {v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$000(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 401
    iget-object v0, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$000(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;

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
    if-nez p1, :cond_0

    .line 412
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$900(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Landroid/widget/LinearLayout;

    move-result-object p2

    move-object v1, p2

    .line 481
    .end local p2    # "convertView":Landroid/view/View;
    .local v1, "convertView":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 416
    .end local v1    # "convertView":Ljava/lang/Object;
    .restart local p2    # "convertView":Landroid/view/View;
    :cond_0
    const/4 v7, 0x0

    .line 417
    .local v7, "needReload":Z
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 419
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_1

    .line 420
    const/4 v7, 0x1

    .line 422
    :cond_1
    const/4 v3, 0x0

    .line 423
    .local v3, "holder":Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    if-eqz p2, :cond_2

    if-eqz v7, :cond_3

    .line 424
    :cond_2
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f04001e

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 425
    new-instance v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;

    .end local v3    # "holder":Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    invoke-direct {v3, p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;-><init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;)V

    .line 426
    .restart local v3    # "holder":Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    const v8, 0x7f0f006c

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/RelativeLayout;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->layout:Landroid/widget/RelativeLayout;

    .line 427
    const v8, 0x7f0f006f

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIcon:Landroid/widget/ImageView;

    .line 428
    const v8, 0x7f0f0070

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;

    .line 429
    const v8, 0x7f0f006e

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;

    .line 430
    const v8, 0x7f0f0073

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIcon:Landroid/widget/ImageView;

    .line 431
    const v8, 0x7f0f0074

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;

    .line 432
    const v8, 0x7f0f0072

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;

    .line 433
    const v8, 0x7f0f0076

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->appName:Landroid/widget/TextView;

    .line 434
    const v8, 0x7f0f0077

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;

    .line 435
    invoke-virtual {p2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 440
    :goto_1
    if-nez p1, :cond_4

    move-object v1, p2

    .line 442
    .restart local v1    # "convertView":Ljava/lang/Object;
    goto/16 :goto_0

    .line 437
    .end local v1    # "convertView":Ljava/lang/Object;
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "holder":Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    check-cast v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;

    .restart local v3    # "holder":Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;
    goto :goto_1

    .line 445
    :cond_4
    const/4 v0, 0x0

    .line 446
    .local v0, "bgRes":I
    add-int/lit8 v5, p1, -0x1

    .line 447
    .local v5, "index":I
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getCount()I

    move-result v8

    add-int/lit8 v2, v8, -0x1

    .line 448
    .local v2, "count":I
    const/4 v8, 0x1

    if-le v2, v8, :cond_8

    .line 449
    if-nez v5, :cond_6

    .line 450
    const v0, 0x7f020253

    .line 459
    :cond_5
    :goto_2
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 461
    invoke-virtual {p0, v5}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 462
    .local v4, "iconInfo":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-boolean v8, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->useImprovedAppIcon:Z

    if-eqz v8, :cond_9

    .line 463
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 464
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 465
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;

    const v9, 0x7f080100

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    .line 472
    :goto_3
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

    .line 473
    iget-object v9, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIcon:Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$800(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;

    move-result-object v8

    invoke-virtual {v4}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->getPrimaryId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 475
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 476
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 477
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconBg:Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 478
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconBg:Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 479
    iget-object v8, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$600(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/icons/IconManager;

    move-result-object v8

    iget-object v9, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    iget-object v10, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;

    invoke-virtual {v8, v9, v10}, Lcom/smartisanos/home/settings/icons/IconManager;->getLableForPackage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 480
    .local v6, "label":Ljava/lang/String;
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->appName:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v1, p2

    .line 481
    .restart local v1    # "convertView":Ljava/lang/Object;
    goto/16 :goto_0

    .line 451
    .end local v1    # "convertView":Ljava/lang/Object;
    .end local v4    # "iconInfo":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v6    # "label":Ljava/lang/String;
    :cond_6
    add-int/lit8 v8, v2, -0x1

    if-ne v5, v8, :cond_7

    .line 452
    const v0, 0x7f02024a

    goto/16 :goto_2

    .line 454
    :cond_7
    const v0, 0x7f02024d

    goto/16 :goto_2

    .line 456
    :cond_8
    const/4 v8, 0x1

    if-ne v2, v8, :cond_5

    .line 457
    const v0, 0x7f020250

    goto/16 :goto_2

    .line 467
    .restart local v4    # "iconInfo":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :cond_9
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->officialIconSelectedFrame:Landroid/widget/ImageView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 468
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->unofficialIconSelectedFrame:Landroid/widget/ImageView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 469
    iget-object v8, v3, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter$ViewHolder;->authorName:Landroid/widget/TextView;

    const v9, 0x7f08009d

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_3
.end method
