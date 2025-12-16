# 🎮 跳跃小游戏

一个简单有趣的跳跃游戏，使用纯 HTML5 Canvas 开发。

## 🎯 游戏特点

- 🏃 简单易玩的跳跃玩法
- 🎨 精美的渐变色界面设计
- 📊 分数系统和最高分记录
- 📱 完全响应式，支持移动设备
- 🎮 支持键盘和触摸屏控制
- 💾 本地存储最高分

## 🎲 游戏玩法

1. 点击"开始游戏"按钮开始
2. 按**空格键**或**点击屏幕**让角色跳跃
3. 躲避障碍物，获得更高分数
4. 碰到障碍物游戏结束

## 🛠️ 技术栈

- HTML5
- CSS3 (渐变、动画、响应式设计)
- JavaScript (Canvas API)
- LocalStorage (保存最高分)

## 📦 文件结构

```
gamestest/
├── index.html      # 主页面
├── style.css       # 样式文件
├── game.js         # 游戏逻辑
├── vercel.json     # Vercel 部署配置
└── README.md       # 项目说明
```

## 🚀 本地运行

1. 克隆或下载项目文件
2. 在浏览器中打开 `index.html`
3. 开始游戏！

或者使用本地服务器：

```bash
# 使用 Python 3
python -m http.server 8000

# 使用 Node.js
npx serve
```

然后访问 `http://localhost:8000`

## 🌐 部署到 Vercel

### 方法 1：使用 Vercel CLI

```bash
# 安装 Vercel CLI
npm install -g vercel

# 在项目目录中运行
cd gamestest
vercel

# 或直接部署
vercel --prod
```

### 方法 2：通过 GitHub

1. 将代码推送到 GitHub
2. 访问 [vercel.com](https://vercel.com)
3. 导入你的 GitHub 仓库
4. Vercel 会自动检测并部署

### 方法 3：拖放部署

1. 访问 [vercel.com](https://vercel.com)
2. 将 `gamestest` 文件夹直接拖放到 Vercel 界面
3. 等待部署完成

## 🎮 游戏截图

游戏包含以下特性：
- 可爱的方块角色
- 动态生成的障碍物
- 渐变色背景
- 实时分数显示
- 游戏结束弹窗

## 📝 更新日志

### v1.0.0 (2025-12-16)
- ✨ 初始版本发布
- 🎮 基本跳跃玩法
- 📊 分数系统
- 💾 最高分记录
- 📱 响应式设计

## 📄 许可证

MIT License

## 👨‍💻 作者

ysxy - [GitHub](https://github.com/ysxysigil)

---

**祝你游戏愉快！** 🎉
