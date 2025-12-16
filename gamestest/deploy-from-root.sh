#!/bin/bash

# 从 Gitdemo 根目录部署 gamestest 子目录到 Vercel

echo "========================================"
echo "🎮 跳跃游戏 - Vercel 子目录部署"
echo "========================================"
echo ""

# 切换到 Gitdemo 根目录（脚本所在目录的上一级）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR/.."

echo "📂 当前目录: $(pwd)"
echo "📁 部署子目录: gamestest"
echo ""

# 检查是否在正确的目录
if [ ! -f "gamestest/index.html" ]; then
    echo "❌ 错误：找不到 gamestest/index.html"
    echo "请确保在 Gitdemo 根目录运行此脚本"
    exit 1
fi

# 检查是否安装了 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 未找到 Node.js"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

# 检查是否安装了 vercel CLI
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI 未安装"
    echo "📦 正在安装 Vercel CLI..."
    npm install -g vercel

    if [ $? -ne 0 ]; then
        echo "❌ 安装失败！请手动运行: npm install -g vercel"
        exit 1
    fi
    echo "✅ Vercel CLI 安装成功"
    echo ""
fi

# 检查或创建 vercel.json
if [ ! -f "vercel.json" ]; then
    echo "📝 创建 vercel.json 配置文件..."
    cat > vercel.json << 'EOF'
{
  "version": 2,
  "name": "jump-game",
  "builds": [
    {
      "src": "gamestest/*.html",
      "use": "@vercel/static"
    }
  ]
}
EOF
    echo "✅ vercel.json 创建成功"
    echo ""
fi

echo "请选择部署类型："
echo "1) 测试环境部署 (Preview)"
echo "2) 生产环境部署 (Production)"
echo ""
read -p "请输入选项 (1 或 2): " deploy_type

echo ""

case $deploy_type in
    1)
        echo "🚀 开始部署到测试环境..."
        echo "💡 提示: 如果询问配置，Root Directory 请输入: gamestest"
        echo ""
        vercel
        ;;
    2)
        echo "🚀 开始部署到生产环境..."
        echo "💡 提示: 如果询问配置，Root Directory 请输入: gamestest"
        echo ""
        vercel --prod
        ;;
    *)
        echo "❌ 无效选项！"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "✅ 部署成功！"
    echo "🎉 你的游戏已经可以访问了！"
    echo "========================================"
    echo ""
    echo "📝 提示："
    echo "- 在浏览器中打开 Vercel 提供的 URL"
    echo "- 如果遇到 404，检查 Root Directory 是否设置为 gamestest"
    echo "- 可以在 vercel.com 的项目设置中修改"
else
    echo ""
    echo "❌ 部署失败！"
    echo ""
    echo "💡 常见问题："
    echo "1. 确保已登录: vercel login"
    echo "2. 检查 Root Directory 设置为: gamestest"
    echo "3. 查看详细文档: gamestest/vercel-deploy-guide.md"
    exit 1
fi
