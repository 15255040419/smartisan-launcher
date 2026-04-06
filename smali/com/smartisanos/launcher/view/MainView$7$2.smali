.class Lcom/smartisanos/launcher/view/MainView$7$2;
.super Ljava/lang/Object;
.source "MainView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/view/MainView$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/smartisanos/launcher/view/MainView$7;

.field final synthetic val$isDark:Z


# direct methods
.method constructor <init>(Lcom/smartisanos/launcher/view/MainView$7;Z)V
    .locals 0
    .param p1, "this$1"    # Lcom/smartisanos/launcher/view/MainView$7;

    .prologue
    .line 985
    iput-object p1, p0, Lcom/smartisanos/launcher/view/MainView$7$2;->this$1:Lcom/smartisanos/launcher/view/MainView$7;

    iput-boolean p2, p0, Lcom/smartisanos/launcher/view/MainView$7$2;->val$isDark:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 988
    iget-boolean v0, p0, Lcom/smartisanos/launcher/view/MainView$7$2;->val$isDark:Z

    if-eqz v0, :cond_0

    .line 990
    invoke-static {}, Lcom/smartisanos/launcher/LauncherApplication;->getInstance()Lcom/smartisanos/launcher/LauncherApplication;

    move-result-object v0

    invoke-static {v0}, Lcom/smartisanos/launcher/theme/ThemeManager;->getCurrentTheme(Landroid/content/Context;)Lcom/smartisanos/launcher/theme/Theme;

    move-result-object v0

    .line 989
    invoke-static {v0}, Lcom/smartisanos/launcher/data/Utils;->setStatusBarColor(Lcom/smartisanos/launcher/theme/Theme;)V

    .line 995
    :goto_0
    return-void

    .line 993
    :cond_0
    invoke-static {}, Lcom/smartisanos/launcher/LauncherApplication;->getInstance()Lcom/smartisanos/launcher/LauncherApplication;

    move-result-object v0

    invoke-static {v0}, Lcom/smartisanos/launcher/theme/ThemeManager;->getCurrentTheme(Landroid/content/Context;)Lcom/smartisanos/launcher/theme/Theme;

    move-result-object v0

    const-string v1, "_light"

    .line 992
    invoke-static {v0, v1}, Lcom/smartisanos/launcher/data/Utils;->setStatusBarColor(Lcom/smartisanos/launcher/theme/Theme;Ljava/lang/String;)V

    goto :goto_0
.end method
