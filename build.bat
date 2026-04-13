@echo off
set "JAVA_HOME=D:\Program Files\Android\Android Studio\jbr"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "ADB=C:\Users\ck\AppData\Local\Android\Sdk\platform-tools\adb.exe"

if not exist build mkdir build

echo [1/3] Building APK with apktool...
java -jar tools/apktool.jar b . -o build/unsigned.apk
if %errorlevel% neq 0 (
    echo FAIL: apktool build failed.
    exit /b %errorlevel%
)

echo [2/3] Signing APK...
if not exist build\signing mkdir build\signing
if not exist build\signing\debug.keystore (
    keytool -genkeypair -keystore build\signing\debug.keystore -storepass android -keypass android -alias androiddebugkey -dname "CN=Android Debug,O=Android,C=US" -keyalg RSA -keysize 2048 -validity 10000
)

copy /y build\unsigned.apk build\signed.apk >nul
jarsigner -keystore build\signing\debug.keystore -storepass android -keypass android build\signed.apk androiddebugkey
if %errorlevel% neq 0 (
    echo FAIL: jarsigner failed.
    exit /b %errorlevel%
)

echo [3/3] Installing APK...
"%ADB%" install -r build/signed.apk
if %errorlevel% neq 0 (
    echo FAIL: adb install failed.
    exit /b %errorlevel%
)

echo SUCCESS: Application built, signed, and installed.
