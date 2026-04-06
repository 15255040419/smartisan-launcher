.class Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;
.super Landroid/content/BroadcastReceiver;
.source "AppIconsSettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;


# direct methods
.method constructor <init>(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 211
    const-string v12, "action"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 212
    .local v1, "action":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 286
    :cond_0
    :goto_0
    return-void

    .line 215
    :cond_1
    const-string v12, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 216
    const-string v12, "pkg"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 217
    .local v8, "pkg":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 220
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12, v8}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$200(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;Ljava/lang/String;)V

    .line 221
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 224
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$300(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/Map;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 225
    new-instance v6, Ljava/util/ArrayList;

    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$300(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/Map;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 226
    .local v6, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v10, "removeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_2
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 228
    .local v5, "key":Ljava/lang/String;
    iget-object v13, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v13}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$300(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 229
    .local v4, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-object v13, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 230
    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 233
    .end local v4    # "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    .end local v5    # "key":Ljava/lang/String;
    :cond_3
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 234
    .local v9, "removeKey":Ljava/lang/String;
    iget-object v13, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v13}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$300(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 237
    .end local v9    # "removeKey":Ljava/lang/String;
    :cond_4
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    move-result-object v12

    invoke-virtual {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->notifyDataSetChanged()V

    .line 238
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$400(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V

    goto/16 :goto_0

    .line 240
    .end local v6    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "pkg":Ljava/lang/String;
    .end local v10    # "removeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    const-string v12, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 241
    const-string v12, "pkg"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 242
    .restart local v8    # "pkg":Ljava/lang/String;
    const-string v12, "cmp"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 243
    .local v2, "cmp":Ljava/lang/String;
    if-eqz v8, :cond_6

    if-nez v2, :cond_7

    .line 244
    :cond_6
    invoke-static {}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$500()Lcom/smartisanos/launcher/LOG;

    move-result-object v12

    const-string v13, "DEBUG"

    const-string v14, "refreshIconListReceiver onReceive return by pkg or cmp is null"

    invoke-virtual {v12, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 247
    :cond_7
    invoke-static {}, Lcom/smartisanos/launcher/LauncherApplication;->getInstance()Lcom/smartisanos/launcher/LauncherApplication;

    move-result-object v12

    invoke-static {v12, v8}, Lcom/smartisanos/launcher/LauncherModel;->findActivitiesForPackage(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    .line 248
    .local v11, "rsvList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    if-eqz v12, :cond_0

    .line 251
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 252
    .local v4, "info":Landroid/content/pm/ResolveInfo;
    iget-object v13, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v13}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$600(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/icons/IconManager;

    move-result-object v13

    invoke-virtual {v13, v4}, Lcom/smartisanos/home/settings/icons/IconManager;->appendResolveInfo(Landroid/content/pm/ResolveInfo;)V

    goto :goto_3

    .line 254
    .end local v4    # "info":Landroid/content/pm/ResolveInfo;
    :cond_8
    const/4 v4, 0x0

    .line 255
    .local v4, "info":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$000(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_9
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    .line 256
    .local v3, "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    if-eqz v3, :cond_9

    .line 259
    iget-object v13, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    iget-object v13, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->componentName:Ljava/lang/String;

    .line 260
    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 261
    move-object v4, v3

    goto :goto_4

    .line 264
    .end local v3    # "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    :cond_a
    invoke-static {v8, v2}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconDB;->getRedirectIconInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;

    move-result-object v3

    .line 265
    .restart local v3    # "icon":Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;
    if-nez v3, :cond_b

    .line 266
    invoke-static {}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$500()Lcom/smartisanos/launcher/LOG;

    move-result-object v12

    const-string v13, "DEBUG"

    const-string v14, "can\'t get icon info from db"

    invoke-virtual {v12, v13, v14}, Lcom/smartisanos/launcher/LOG;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 269
    :cond_b
    if-nez v4, :cond_d

    .line 271
    move-object v4, v3

    .line 272
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$000(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    :goto_5
    invoke-virtual {v4}, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->getPrimaryId()Ljava/lang/String;

    move-result-object v5

    .line 278
    .restart local v5    # "key":Ljava/lang/String;
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-virtual {v12, v4}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->loadOfficialIcon(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 279
    .local v7, "officialIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v7, :cond_c

    .line 280
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$700(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;

    move-result-object v12

    invoke-virtual {v12, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$800(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Ljava/util/HashMap;

    move-result-object v12

    iget-object v13, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-virtual {v13, v4}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->loadUnOfficialIcon(Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    invoke-virtual {v12, v5, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    :cond_c
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$100(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;

    move-result-object v12

    invoke-virtual {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$IconSettingsAdapter;->notifyDataSetChanged()V

    .line 284
    iget-object v12, p0, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity$3;->this$0:Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;

    invoke-static {v12}, Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;->access$400(Lcom/smartisanos/home/settings/view/AppIconsSettingsActivity;)V

    goto/16 :goto_0

    .line 275
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "officialIcon":Landroid/graphics/drawable/Drawable;
    :cond_d
    iget-object v12, v3, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->iconData:[B

    iput-object v12, v4, Lcom/smartisanos/launcher/data/redirectIcon/RedirectIconInfo;->iconData:[B

    goto :goto_5
.end method
