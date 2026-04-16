@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   Smartisan Launcher Release Tool
echo ========================================

:: 1. Check release.conf
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_VERSION_CODE" tools\release.conf') do set CURRENT_CODE=%%a
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_BASE_VERSION" tools\release.conf') do set CURRENT_VER=%%a
echo Current Config: Version=%CURRENT_VER%, Code=%CURRENT_CODE%
echo.

set /p confirm="Confirm config? (y/n): "
if /i "%confirm%" neq "y" exit /b

:: 1.5. Sync version to files
echo.
echo [1/4] Syncing version strings...
python tools\sync_version.py
if %errorlevel% neq 0 (
    echo [ERROR] Sync failed. Check Python and tools/release.conf
    pause
    exit /b
)

:: 2. Commit message
set /p msg="Commit message (Enter for default): "
if "!msg!"=="" set msg=Update %CURRENT_VER%

:: 3. Tag name
set /p tag="Tag name (Enter for %CURRENT_VER%): "
if "!tag!"=="" set tag=%CURRENT_VER%

:: 4. Git Operations
echo.
echo [2/4] Adding files...
git add .

echo [3/4] Committing...
git diff --cached --quiet
if %errorlevel% neq 0 (
    git commit -m "!msg!"
) else (
    echo No changes to commit.
)

echo [4/4] Updating tag and pushing...
:: Force update tag (-f) to overwrite the old v1.5.3 on GitHub
git tag -f %tag%
git push origin main --tags -f

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS! GitHub Actions is building APK.
    echo   Check GitHub Actions page for Run #5.
    echo ========================================
) else (
    echo [ERROR] Push failed.
)

pause
