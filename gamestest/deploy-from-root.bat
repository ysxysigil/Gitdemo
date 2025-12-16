@echo off
REM 从 Gitdemo 根目录部署 gamestest 子目录到 Vercel

echo ========================================
echo 🎮 跳跃游戏 - Vercel 子目录部署
echo ========================================
echo.

REM 切换到 Gitdemo 根目录
cd /d "%~dp0\.."

echo 📂 当前目录: %cd%
echo 📁 部署子目录: gamestest
echo.

REM 检查是否在正确的目录
if not exist "gamestest\index.html" (
    echo ❌ 错误：找不到 gamestest\index.html
    echo 请确保在 Gitdemo 根目录运行此脚本
    pause
    exit /b 1
)

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

REM 检查或创建 vercel.json
if not exist "vercel.json" (
    echo 📝 创建 vercel.json 配置文件...
    (
        echo {
        echo   "version": 2,
        echo   "name": "jump-game",
        echo   "builds": [
        echo     {
        echo       "src": "gamestest/*.html",
        echo       "use": "@vercel/static"
        echo     }
        echo   ]
        echo }
    ) > vercel.json
    echo ✅ vercel.json 创建成功
    echo.
)

echo 请选择部署类型：
echo 1) 测试环境部署 (Preview)
echo 2) 生产环境部署 (Production)
echo.
set /p deploy_type="请输入选项 (1 或 2): "

echo.

if "%deploy_type%"=="1" (
    echo 🚀 开始部署到测试环境...
    echo 💡 提示: 如果询问配置，Root Directory 请输入: gamestest
    echo.
    vercel
) else if "%deploy_type%"=="2" (
    echo 🚀 开始部署到生产环境...
    echo 💡 提示: 如果询问配置，Root Directory 请输入: gamestest
    echo.
    vercel --prod
) else (
    echo ❌ 无效选项！
    pause
    exit /b 1
)

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✅ 部署成功！
    echo 🎉 你的游戏已经可以访问了！
    echo ========================================
    echo.
    echo 📝 提示：
    echo - 在浏览器中打开 Vercel 提供的 URL
    echo - 如果遇到 404，检查 Root Directory 是否设置为 gamestest
    echo - 可以在 vercel.com 的项目设置中修改
) else (
    echo.
    echo ❌ 部署失败！
    echo.
    echo 💡 常见问题：
    echo 1. 确保已登录: vercel login
    echo 2. 检查 Root Directory 设置为: gamestest
    echo 3. 查看详细文档: gamestest\vercel-deploy-guide.md
)

echo.
pause
