#!/bin/bash

# 跳跃游戏 - Vercel 快速部署脚本

echo "🎮 跳跃游戏 - Vercel 部署脚本"
echo "================================"
echo ""

# 检查是否安装了 vercel CLI
if ! command -v vercel &> /dev/null
then
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

echo "📂 当前目录: $(pwd)"
echo ""

# 询问部署类型
echo "请选择部署类型："
echo "1) 测试环境部署 (Preview)"
echo "2) 生产环境部署 (Production)"
echo ""
read -p "请输入选项 (1 或 2): " deploy_type

echo ""

case $deploy_type in
    1)
        echo "🚀 开始部署到测试环境..."
        vercel
        ;;
    2)
        echo "🚀 开始部署到生产环境..."
        vercel --prod
        ;;
    *)
        echo "❌ 无效选项！"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo "🎉 你的游戏已经可以访问了！"
else
    echo ""
    echo "❌ 部署失败！请检查错误信息。"
    exit 1
fi
