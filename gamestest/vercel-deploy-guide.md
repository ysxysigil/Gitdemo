# 🎯 从 Gitdemo 仓库部署 gamestest 子目录

## 问题说明

`gamestest` 是 `Gitdemo` 仓库的一个子目录：

```
Gitdemo/                    # 主仓库
├── README.md
├── GIT_LEARNING_GUIDE.md
└── gamestest/              # 游戏子目录 ← 我们要部署这个
    ├── index.html
    ├── style.css
    └── game.js
```

我们需要告诉 Vercel 只部署 `gamestest` 子目录。

---

## ✅ 方法 1：使用 Vercel CLI（推荐）

### 步骤 1：安装 Vercel CLI

```bash
npm install -g vercel
```

### 步骤 2：进入项目根目录

```bash
cd /e/Pgithub/Gitdemo
```

**注意：** 是进入 `Gitdemo` 目录，不是 `gamestest` 目录！

### 步骤 3：首次部署并配置

```bash
vercel
```

在配置过程中会询问：

```
? Set up and deploy "~/Gitdemo"? [Y/n] y
? Which scope do you want to deploy to? (选择你的账号)
? Link to existing project? [y/N] n
? What's your project's name? jump-game
? In which directory is your code located? gamestest      ← 关键！输入 gamestest
```

### 步骤 4：部署到生产环境

```bash
vercel --prod
```

完成！你的游戏现在已经部署了。

---

## ✅ 方法 2：修改 vercel.json 配置

在 **Gitdemo 根目录**（不是 gamestest 目录）创建 `vercel.json`：

### 创建配置文件

```bash
cd /e/Pgithub/Gitdemo
```

创建或修改 `vercel.json`：

```json
{
  "version": 2,
  "name": "jump-game",
  "buildCommand": "echo 'No build needed'",
  "outputDirectory": "gamestest",
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/gamestest/$1"
    }
  ]
}
```

然后部署：

```bash
vercel --prod
```

---

## ✅ 方法 3：通过 GitHub 导入（推荐给非技术用户）

### 步骤 1：确保代码已推送到 GitHub

```bash
cd /e/Pgithub/Gitdemo
git status
git push origin master
```

### 步骤 2：在 Vercel 导入项目

1. 访问 [vercel.com](https://vercel.com) 并登录
2. 点击 **"Add New Project"**
3. 选择 **"Import Git Repository"**
4. 连接 GitHub 并选择 **"Gitdemo"** 仓库
5. **重要配置：**

   ```
   Project Name: jump-game
   Framework Preset: Other
   Root Directory: gamestest    ← 关键！点击 "Edit" 并输入 gamestest
   Build Command: (留空)
   Output Directory: (留空)
   Install Command: (留空)
   ```

6. 点击 **"Deploy"**

### 步骤 3：等待部署完成

通常 30-60 秒内完成，你会得到一个 URL：
```
https://jump-game-xxx.vercel.app
```

---

## ✅ 方法 4：使用更新的部署脚本

我为你创建了一个更好的部署脚本，它会自动处理子目录的问题。

### Windows 用户

使用新的 `deploy-subdirectory.bat`：

```batch
@echo off
cd /d %~dp0
cd ..
echo 当前目录: %cd%
echo 部署子目录: gamestest
vercel --prod
```

### Linux/macOS 用户

使用新的 `deploy-subdirectory.sh`：

```bash
#!/bin/bash
cd "$(dirname "$0")/.."
echo "当前目录: $(pwd)"
echo "部署子目录: gamestest"
vercel --prod
```

---

## 🔧 验证配置是否正确

### 检查 vercel.json

确保 `gamestest/vercel.json` 内容正确：

```json
{
  "version": 2,
  "builds": [
    {
      "src": "*.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/$1"
    }
  ]
}
```

### 测试部署

```bash
# 进入 Gitdemo 根目录
cd /e/Pgithub/Gitdemo

# 测试部署（不会发布到生产）
vercel

# 如果成功，部署到生产
vercel --prod
```

---

## 📝 完整的部署流程示例

### 首次部署

```bash
# 1. 进入项目根目录
cd /e/Pgithub/Gitdemo

# 2. 确保代码是最新的
git pull

# 3. 登录 Vercel（首次需要）
vercel login

# 4. 部署项目
vercel

# 当询问 "In which directory is your code located?" 时
# 输入: gamestest

# 5. 部署到生产环境
vercel --prod
```

### 后续更新

```bash
# 1. 修改游戏代码
# 2. 提交更改
git add gamestest/
git commit -m "Update game"
git push

# 3. 重新部署
cd /e/Pgithub/Gitdemo
vercel --prod
```

---

## 🎯 常见问题

### Q1: 部署后显示 404 错误？

**原因：** 没有正确指定根目录。

**解决方案：**

方法 A - 使用 Vercel Dashboard：
1. 进入项目设置 (Settings)
2. 找到 "Root Directory"
3. 设置为 `gamestest`
4. 保存并重新部署

方法 B - 删除项目重新部署：
```bash
vercel remove your-project-name
vercel --prod
# 重新配置时正确输入 gamestest
```

### Q2: 部署后游戏无法加载？

**检查清单：**

1. 确认 Root Directory 是 `gamestest`
2. 检查 `gamestest/vercel.json` 是否存在
3. 检查浏览器控制台的错误信息
4. 确认本地游戏可以正常运行

### Q3: 如何查看当前的 Root Directory 设置？

```bash
cd /e/Pgithub/Gitdemo
vercel inspect
```

### Q4: 每次都要输入 gamestest 太麻烦？

创建 `.vercelignore` 在 Gitdemo 根目录：

```
# .vercelignore
*
!gamestest/**
```

或者在 `vercel.json`（Gitdemo 根目录）中配置：

```json
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
```

---

## 🚀 推荐的部署方式

根据你的情况，我推荐：

### 方案 A：使用 Vercel CLI（最灵活）

```bash
cd /e/Pgithub/Gitdemo
vercel --prod --yes --scope your-username --name jump-game --project-settings='{\"rootDirectory\":\"gamestest\"}'
```

### 方案 B：GitHub 集成（最省心）

1. 在 Vercel 导入 Gitdemo 仓库
2. 设置 Root Directory 为 `gamestest`
3. 每次 push 到 GitHub 自动部署

---

## 📊 项目结构建议

为了更好地管理，建议的目录结构：

```
Gitdemo/
├── vercel.json              # Vercel 根配置
├── README.md
├── GIT_LEARNING_GUIDE.md
│
└── gamestest/               # 游戏子项目
    ├── vercel.json          # 游戏特定配置
    ├── index.html
    ├── style.css
    ├── game.js
    └── README.md
```

两个 `vercel.json` 的作用：
- **根目录的**：告诉 Vercel 部署 gamestest 子目录
- **gamestest 内的**：配置游戏的路由和构建

---

## 🎉 快速开始命令

复制粘贴这些命令立即部署：

```bash
# 克隆仓库（如果还没有）
git clone https://github.com/ysxysigil/Gitdemo.git
cd Gitdemo

# 安装 Vercel CLI
npm install -g vercel

# 登录
vercel login

# 部署（会询问配置，记得输入 gamestest）
vercel

# 部署到生产
vercel --prod
```

---

## 💡 高级技巧

### 使用别名

```bash
vercel --prod --alias jump-game.vercel.app
```

### 设置环境变量（如果需要）

```bash
vercel env add GAME_NAME production
```

### 查看部署日志

```bash
vercel logs your-deployment-url
```

### 回滚到之前的版本

在 Vercel Dashboard 中可以一键回滚。

---

**记住关键点：** 从 Gitdemo 根目录运行 `vercel`，并在配置时指定 `gamestest` 作为根目录！

祝部署顺利！🚀
