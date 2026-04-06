.class final Lcom/smartisanos/launcher/data/Utils$5;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/launcher/data/Utils;->showWeatherInfoToast()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 2216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatInvalid"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2220
    invoke-static {}, Lcom/smartisanos/home/Launcher;->getInstance()Lcom/smartisanos/home/Launcher;

    move-result-object v3

    .line 2221
    .local v3, "launcher":Lcom/smartisanos/home/Launcher;
    if-nez v3, :cond_0

    .line 2240
    :goto_0
    return-void

    .line 2224
    :cond_0
    const v6, 0x7f0801f8

    invoke-virtual {v3, v6}, Lcom/smartisanos/home/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2225
    .local v2, "info":Ljava/lang/String;
    sget-object v6, Lcom/smartisanos/launcher/view/WeatherView;->WEATHER_DATA:Landroid/content/Intent;

    if-eqz v6, :cond_1

    .line 2226
    sget-object v6, Lcom/smartisanos/launcher/view/WeatherView;->WEATHER_DATA:Landroid/content/Intent;

    const-string v7, "weatherCode"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2227
    .local v5, "weatherCode":Ljava/lang/String;
    invoke-static {v3, v5}, Lcom/smartisan/weather/lib/bean/Weather;->getWeatherDesc(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2228
    .local v1, "codeName":Ljava/lang/String;
    sget-object v6, Lcom/smartisanos/launcher/view/WeatherView;->WEATHER_DATA:Landroid/content/Intent;

    const-string v7, "temp"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2229
    .local v0, "celsiusTemperature":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v9, v6}, Lcom/smartisanos/launcher/view/WeatherView;->getValidTemp(ZI)I

    move-result v4

    .line 2230
    .local v4, "temp":I
    const v6, 0x7f0801f7

    invoke-virtual {v3, v6}, Lcom/smartisanos/home/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2231
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    aput-object v1, v6, v9

    invoke-static {v2, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 2234
    .end local v0    # "celsiusTemperature":Ljava/lang/String;
    .end local v1    # "codeName":Ljava/lang/String;
    .end local v4    # "temp":I
    .end local v5    # "weatherCode":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/smartisanos/launcher/data/Utils;->access$400()Landroid/widget/Toast;

    move-result-object v6

    if-nez v6, :cond_2

    .line 2235
    invoke-static {v3, v2, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-static {v6}, Lcom/smartisanos/launcher/data/Utils;->access$402(Landroid/widget/Toast;)Landroid/widget/Toast;

    .line 2239
    :goto_1
    invoke-static {}, Lcom/smartisanos/launcher/data/Utils;->access$400()Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2237
    :cond_2
    invoke-static {}, Lcom/smartisanos/launcher/data/Utils;->access$400()Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method
