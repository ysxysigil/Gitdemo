@echo off
REM 跳跃游戏 - Vercel 快速部署脚本 (Windows)

echo ========================================
echo 🎮 跳跃游戏 - Vercel 部署脚本
echo ========================================
echo.

REM 检查是否安装了 Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 未找到 Node.js
    echo 请先安装 Node.js: https://nodejs.org/
    pause
    exit /b 1
)

REM 检查是否安装了 vercel CLI
where vercel >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Vercel CLI 未安装
    echo 📦 正在安装 Vercel CLI...
    npm install -g vercel

    if %errorlevel% neq 0 (
        echo ❌ 安装失败！请手动运行: npm install -g vercel
        pause
        exit /b 1
    )
    echo ✅ Vercel CLI 安装成功
    echo.
)

echo 📂 当前目录: %cd%
echo.

REM 询问部署类型
echo 请选择部署类型：
echo 1) 测试环境部署 (Preview)
echo 2) 生产环境部署 (Production)
echo.
set /p deploy_type="请输入选项 (1 或 2): "

echo.

if "%deploy_type%"=="1" (
    echo 🚀 开始部署到测试环境...
    vercel
) else if "%deploy_type%"=="2" (
    echo 🚀 开始部署到生产环境...
    vercel --prod
) else (
    echo ❌ 无效选项！
    pause
    exit /b 1
)

if %errorlevel% equ 0 (
    echo.
    echo ✅ 部署成功！
    echo 🎉 你的游戏已经可以访问了！
) else (
    echo.
    echo ❌ 部署失败！请检查错误信息。
)

echo.
pause
