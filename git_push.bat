@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   Smartisan Launcher 自动发布工具
echo ========================================

:: 1. 检查 release.conf
echo [提示] 提交前请确保已手动修改 tools\release.conf 中的版本号和代码！
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_VERSION_CODE" tools\release.conf') do set CURRENT_CODE=%%a
for /f "tokens=2 delims==" %%a in ('findstr "RELEASE_BASE_VERSION" tools\release.conf') do set CURRENT_VER=%%a
echo 当前配置: 版本=%CURRENT_VER%, 代码=%CURRENT_CODE%
echo.

set /p confirm="确认配置无误并继续？(y/n): "
if /i "%confirm%" neq "y" exit /b

:: 1.5. 同步版本号到项目文件
echo.
echo [提示] 正在同步版本号到项目文件...
python tools\sync_version.py
if %errorlevel% neq 0 (
    echo.
    echo [错误] 版本同步失败，请检查 Python 环境或 release.conf 配置！
    pause
    exit /b
)
echo.

:: 2. 输入提交信息
set /p msg="请输入本次更新说明 (Commit Message): "
if "%msg%"=="" set msg="Update %CURRENT_VER%"

:: 3. 输入 Tag 标签
echo [注意] 标签必须以 v 开头，例如: %CURRENT_VER%
set /p tag="请输入版本标签 (直接回车使用 %CURRENT_VER%): "
if "%tag%"=="" set tag=%CURRENT_VER%

:: 4. 执行 Git 操作
echo.
echo [1/3] 正在添加文件...
git add .

echo [2/3] 正在提交代码...
git commit -m "%msg%"

echo [3/3] 正在打标签并推送...
git tag %tag%
git push origin main --tags

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   发布成功！GitHub Actions 正在开始编译...
    echo ========================================
) else (
    echo.
    echo [错误] 推送失败，请检查网络或权限。
)

pause
