.class public Lcom/smartisanos/quicksearchbox/SearchMainActivity;
.super Lcom/smartisanos/quicksearchbox/BaseActivity;
.source "SearchMainActivity.java"


# static fields
.field public static final MSG_REFRESHRESULT:I


# instance fields
.field private isT9KeyBoardShowing:Ljava/lang/Boolean;

.field private mBackgroundHintContainer:Landroid/view/ViewGroup;

.field private mBeanRepository:Lcom/smartisanos/quicksearchbox/repository/BeanRepository;

.field private mContext:Landroid/content/Context;

.field private mEditBoxContainer:Landroid/view/ViewGroup;

.field private mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

.field private mEditBoxPresenter:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxPresenter;

.field private mFragmentManager:Landroid/support/v4/app/FragmentManager;

.field private mMainContainer:Lcom/smartisanos/quicksearchbox/container/MainContainerView;

.field private mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

.field private mResultBoxPresenter:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;

.field private mResultContainer:Landroid/view/ViewGroup;

.field private mT9PanelView:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

.field private mainHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 36
    invoke-static {}, Lcom/smartisanos/quicksearchbox/util/LogUtil;->disableLog()V

    .line 37
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/BaseActivity;-><init>()V

    .line 44
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->isT9KeyBoardShowing:Ljava/lang/Boolean;

    .line 63
    new-instance v0, Lcom/smartisanos/quicksearchbox/SearchMainActivity$1;

    invoke-direct {v0, p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity$1;-><init>(Lcom/smartisanos/quicksearchbox/SearchMainActivity;)V

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method private init()V
    .locals 0

    .prologue
    .line 143
    iput-object p0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    .line 144
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initQuickSearchBoxSetting()V

    .line 145
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initManager()V

    .line 146
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initBeanRepository()V

    .line 147
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initMainContainer()V

    .line 148
    return-void
.end method

.method private initBeanRepository()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/smartisanos/quicksearchbox/repository/BeanRepository;->getInstance(Landroid/content/Context;)Lcom/smartisanos/quicksearchbox/repository/BeanRepository;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBeanRepository:Lcom/smartisanos/quicksearchbox/repository/BeanRepository;

    .line 202
    return-void
.end method

.method private initBottomPannel()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 168
    const v2, 0x7f0f016d

    invoke-virtual {p0, v2}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 169
    .local v0, "tabInputSoft":Landroid/widget/ImageView;
    const v2, 0x7f0f016c

    invoke-virtual {p0, v2}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 171
    .local v1, "tabInputT9":Landroid/widget/ImageView;
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 172
    new-instance v2, Lcom/smartisanos/quicksearchbox/SearchMainActivity$2;

    invoke-direct {v2, p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity$2;-><init>(Lcom/smartisanos/quicksearchbox/SearchMainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 184
    new-instance v2, Lcom/smartisanos/quicksearchbox/SearchMainActivity$3;

    invoke-direct {v2, p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity$3;-><init>(Lcom/smartisanos/quicksearchbox/SearchMainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    return-void
.end method

.method private initEditBoxFragment()V
    .locals 3

    .prologue
    const v2, 0x7f0f005a

    .line 220
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    .line 223
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    if-nez v0, :cond_0

    .line 224
    invoke-static {}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->newInstance()Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-static {v0, v1, v2}, Lcom/smartisanos/quicksearchbox/util/ActivityUtil;->addFragmentToActivity(Landroid/support/v4/app/FragmentManager;Landroid/support/v4/app/Fragment;I)V

    .line 227
    return-void
.end method

.method private initMainContainer()V
    .locals 1

    .prologue
    .line 156
    const v0, 0x7f0f0059

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/quicksearchbox/container/MainContainerView;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mMainContainer:Lcom/smartisanos/quicksearchbox/container/MainContainerView;

    .line 157
    const v0, 0x7f0f005a

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxContainer:Landroid/view/ViewGroup;

    .line 158
    const v0, 0x7f0f005c

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultContainer:Landroid/view/ViewGroup;

    .line 159
    const v0, 0x7f0f00e8

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBackgroundHintContainer:Landroid/view/ViewGroup;

    .line 160
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initResultBoxFragment()V

    .line 161
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initEditBoxFragment()V

    .line 162
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initPreseters()V

    .line 163
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initBottomPannel()V

    .line 164
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->initT9Pannel()V

    .line 165
    return-void
.end method

.method private initManager()V
    .locals 1

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 152
    return-void
.end method

.method private initPreseters()V
    .locals 4

    .prologue
    .line 240
    new-instance v0, Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;

    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBeanRepository:Lcom/smartisanos/quicksearchbox/repository/BeanRepository;

    iget-object v3, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    invoke-direct {v0, v1, v2, v3}, Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;-><init>(Landroid/content/Context;Lcom/smartisanos/quicksearchbox/repository/BeanRepository;Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxContract$View;)V

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxPresenter:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;

    .line 241
    new-instance v0, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxPresenter;

    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    iget-object v2, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxPresenter:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;

    iget-object v3, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBeanRepository:Lcom/smartisanos/quicksearchbox/repository/BeanRepository;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxPresenter;-><init>(Landroid/content/Context;Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxContract$View;Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxPresenter;Lcom/smartisanos/quicksearchbox/repository/BeanRepository;)V

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxPresenter:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxPresenter;

    .line 242
    return-void
.end method

.method private initQuickSearchBoxSetting()V
    .locals 3

    .prologue
    .line 211
    :try_start_0
    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/smartisanos/quicksearchbox/util/EngineUtil;->getCurrentEngine(Landroid/content/Context;)I

    move-result v1

    const v2, -0x1e1b9

    if-ne v1, v2, :cond_0

    .line 212
    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/smartisanos/quicksearchbox/util/EngineUtil;->setSearchEngineToDefault(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private initResultBoxFragment()V
    .locals 3

    .prologue
    const v2, 0x7f0f005c

    .line 230
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    .line 232
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    if-nez v0, :cond_0

    .line 233
    invoke-static {}, Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;->newInstance()Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    .line 235
    :cond_0
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    invoke-static {v0, v1, v2}, Lcom/smartisanos/quicksearchbox/util/ActivityUtil;->addFragmentToActivity(Landroid/support/v4/app/FragmentManager;Landroid/support/v4/app/Fragment;I)V

    .line 237
    return-void
.end method

.method private initT9Pannel()V
    .locals 1

    .prologue
    .line 197
    const v0, 0x7f0f005e

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mT9PanelView:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

    .line 198
    return-void
.end method


# virtual methods
.method public changeBackgroundHint()V
    .locals 0

    .prologue
    .line 338
    return-void
.end method

.method public clearResultFromT9KeyBoard()V
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->clearKeyWordEditor()V

    .line 250
    invoke-virtual {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->showBackgroundHint()V

    .line 251
    return-void
.end method

.method public clearResultShowBackGround()V
    .locals 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultBoxFragment:Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/resultbox/ResultBoxFragment;->clearResult()V

    .line 324
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mResultContainer:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 325
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBackgroundHintContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 326
    return-void
.end method

.method public getMainHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public hideBackgroundHint()V
    .locals 2

    .prologue
    .line 329
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBackgroundHintContainer:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 330
    return-void
.end method

.method public hideSoftKeyBoard()V
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->getKeyWordEditor()Lcom/smartisanos/quicksearchbox/container/editbox/keywordeditor/KeyWordEditor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->hideSoftKeyBoard(Landroid/view/View;)V

    .line 305
    return-void
.end method

.method public hideSoftKeyBoard(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 311
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/smartisanos/quicksearchbox/SearchMainActivity$5;

    invoke-direct {v1, p0, p1}, Lcom/smartisanos/quicksearchbox/SearchMainActivity$5;-><init>(Lcom/smartisanos/quicksearchbox/SearchMainActivity;Landroid/view/View;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 320
    return-void
.end method

.method public hideT9KeyBoard()V
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mT9PanelView:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;->hideT9Panel(Z)Z

    .line 255
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->isT9KeyBoardShowing:Ljava/lang/Boolean;

    .line 256
    return-void
.end method

.method public inputFromT9KeyBoard(I)V
    .locals 1
    .param p1, "keyCode"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0, p1}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->setKeyWordEditorKeyCode(I)V

    .line 246
    return-void
.end method

.method public isT9KeyBoardShowing()Z
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->isT9KeyBoardShowing:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mT9PanelView:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-super {p0}, Lcom/smartisanos/quicksearchbox/BaseActivity;->onBackPressed()V

    .line 103
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/smartisanos/quicksearchbox/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    invoke-virtual {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/smartisanos/launcher/data/Utils;->applyTransparentStatusBar(Landroid/content/Context;Landroid/view/Window;)V

    .line 86
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/smartisanos/launcher/data/Utils;->setMiuiStatusBarDarkMode(Landroid/app/Activity;Z)Z

    .line 87
    const v0, 0x7f04001b

    invoke-virtual {p0, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->setContentView(I)V

    .line 88
    invoke-direct {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->init()V

    .line 89
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;->getInstance(Landroid/content/Context;)Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;->registMonitor()V

    .line 90
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 107
    invoke-super {p0}, Lcom/smartisanos/quicksearchbox/BaseActivity;->onDestroy()V

    .line 108
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;->getInstance(Landroid/content/Context;)Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/repository/contact/db/ContactChangeMonitor;->unRegistMonitor()V

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mContext:Landroid/content/Context;

    .line 110
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 94
    invoke-super {p0}, Lcom/smartisanos/quicksearchbox/BaseActivity;->onPause()V

    .line 95
    invoke-virtual {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->hideSoftKeyBoard()V

    .line 96
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 114
    invoke-super {p0}, Lcom/smartisanos/quicksearchbox/BaseActivity;->onResume()V

    .line 115
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/repository/contact/db/helper/ContactSearchIndexHelper;->getInstance(Landroid/content/Context;)Lcom/smartisanos/quicksearchbox/repository/contact/db/helper/ContactSearchIndexHelper;

    move-result-object v1

    .line 116
    .local v1, "contactSearchIndexHelper":Lcom/smartisanos/quicksearchbox/repository/contact/db/helper/ContactSearchIndexHelper;
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper;->getInstance(Landroid/content/Context;)Lcom/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper;

    move-result-object v0

    .line 118
    .local v0, "appSearchIndexHelper":Lcom/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper;
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/util/Util;->isIndexDataInit(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 119
    invoke-virtual {v1}, Lcom/smartisanos/quicksearchbox/repository/contact/db/helper/ContactSearchIndexHelper;->initLocalContactIndexFirst()Z

    move-result v2

    if-nez v2, :cond_0

    .line 120
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "\u4e0d\u80fd\u521d\u59cb\u5316\u8054\u7cfb\u4eba\u6570\u636e"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 122
    :cond_0
    const-string v2, "\u8054\u7cfb\u4eba\u6570\u636e\u521d\u59cb\u5316\u6210\u529f"

    invoke-static {v2}, Lcom/smartisanos/quicksearchbox/util/LogUtil;->debug(Ljava/lang/String;)V

    .line 123
    invoke-static {p0}, Lcom/smartisanos/quicksearchbox/util/Util;->indexDataInited(Landroid/content/Context;)Z

    .line 133
    :goto_0
    return-void

    .line 127
    :cond_1
    invoke-virtual {v1}, Lcom/smartisanos/quicksearchbox/repository/contact/db/helper/ContactSearchIndexHelper;->syncContactAccurate()V

    .line 129
    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/repository/app/db/helper/AppSearchIndexHelper;->loadAppSearchBeans()[Lcom/smartisanos/quicksearchbox/repository/app/bean/AppSearchBean;

    .line 131
    invoke-virtual {p0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->refreshResultBox()V

    goto :goto_0
.end method

.method public refreshResultBox()V
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    iget-object v1, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v1}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->getKeyWordEditorText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->query(Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method public showBackgroundHint()V
    .locals 2

    .prologue
    .line 333
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mBackgroundHintContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 334
    return-void
.end method

.method public showSoftKeyBoard(Z)V
    .locals 1
    .param p1, "clearEditor"    # Z

    .prologue
    .line 276
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->getKeyWordEditor()Lcom/smartisanos/quicksearchbox/container/editbox/keywordeditor/KeyWordEditor;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->showSoftKeyBoard(ZLandroid/view/View;)V

    .line 277
    return-void
.end method

.method public showSoftKeyBoard(ZLandroid/view/View;)V
    .locals 4
    .param p1, "clearEditor"    # Z
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 283
    if-eqz p1, :cond_0

    .line 284
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->clearKeyWordEditor()V

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->setShowSoftInputOnFocus(Z)V

    .line 287
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/smartisanos/quicksearchbox/SearchMainActivity$4;

    invoke-direct {v1, p0, p2}, Lcom/smartisanos/quicksearchbox/SearchMainActivity$4;-><init>(Lcom/smartisanos/quicksearchbox/SearchMainActivity;Landroid/view/View;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 297
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/smartisanos/quicksearchbox/util/Util;->setLastShownKeyBoard(Landroid/content/Context;Z)Z

    .line 298
    return-void
.end method

.method public showT9KeyBoard(Z)V
    .locals 3
    .param p1, "clearEditor"    # Z

    .prologue
    const/4 v2, 0x1

    .line 259
    if-eqz p1, :cond_0

    .line 260
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    invoke-virtual {v0}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->clearKeyWordEditor()V

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mEditBoxFragment:Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/smartisanos/quicksearchbox/container/editbox/EditBoxFragment;->setShowSoftInputOnFocus(Z)V

    .line 263
    iget-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->mT9PanelView:Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;

    invoke-virtual {v0, v2}, Lcom/smartisanos/quicksearchbox/container/t9keyboard/T9PanelView;->showT9Panel(Z)V

    .line 264
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/smartisanos/quicksearchbox/SearchMainActivity;->isT9KeyBoardShowing:Ljava/lang/Boolean;

    .line 265
    invoke-static {p0, v2}, Lcom/smartisanos/quicksearchbox/util/Util;->setLastShownKeyBoard(Landroid/content/Context;Z)Z

    .line 266
    return-void
.end method
