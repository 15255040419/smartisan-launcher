@echo off
setlocal enabledelayedexpansion

:: 1. 环境配置
set "JAVA_HOME=D:\Program Files\Android\Android Studio\jbr"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "ADB=C:\Users\ck\AppData\Local\Android\Sdk\platform-tools\adb.exe"

echo [0/4] Syncing version from tools\release.conf...
:: 从 release.conf 读取版本号
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_VERSION_CODE" tools\release.conf') do set VERSION_CODE=%%a
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_BASE_VERSION" tools\release.conf') do set VERSION_NAME=%%a

if "%VERSION_CODE%"=="" (
    echo FAIL: Could not find RELEASE_VERSION_CODE in tools\release.conf
    exit /b 1
)

:: 使用 PowerShell 更新 apktool.yml 中的版本号
powershell -Command "(Get-Content apktool.yml) -replace 'versionCode: \d+', 'versionCode: %VERSION_CODE%' -replace 'versionName: [^\n]+', 'versionName: %VERSION_NAME%' | Set-Content apktool.yml"
echo Version synced: %VERSION_NAME% (%VERSION_CODE%)

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
