@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 1. 环境配置
set "JAVA_HOME=D:\Program Files\Android\Android Studio\jbr"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "ADB=C:\Users\ck\AppData\Local\Android\Sdk\platform-tools\adb.exe"

echo [0/4] Syncing version from tools\release.conf...
:: 使用 Python 脚本同步所有文件的版本号
python tools\sync_version.py
if %errorlevel% neq 0 (
    echo FAIL: Version sync failed.
    exit /b %errorlevel%
)

:: 刷新变量以用于输出
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_VERSION_CODE" tools\release.conf') do set VERSION_CODE=%%a
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_BASE_VERSION" tools\release.conf') do set VERSION_NAME=%%a
echo Version ready: %VERSION_NAME% (%VERSION_CODE%)

:: 2. 编译 APK
if not exist build mkdir build
echo [1/4] Building APK with apktool...
java -jar tools/apktool.jar b . -o build/unsigned.apk
if %errorlevel% neq 0 (
    echo FAIL: apktool build failed.
    exit /b %errorlevel%
)

:: 3. 签名应用
echo [2/4] Signing APK with persistent keystore...
set "KEYSTORE=tools\signing\release.keystore"

if not exist "%KEYSTORE%" (
    echo FAIL: Keystore missing at %KEYSTORE%. Please run keytool to create it.
    exit /b 1
)

copy /y build\unsigned.apk build\signed.apk >nul
jarsigner -keystore "%KEYSTORE%" -storepass android -keypass android build\signed.apk smartisan
if %errorlevel% neq 0 (
    echo FAIL: jarsigner failed.
    exit /b %errorlevel%
)

:: 4. 安装应用
echo [3/4] Installing APK...
"%ADB%" install -r build/signed.apk
if %errorlevel% neq 0 (
    echo FAIL: adb install failed.
    exit /b %errorlevel%
)

echo SUCCESS: Version %VERSION_NAME% (%VERSION_CODE%) built, signed, and installed.
pause
