# 🌐 Vercel 网页端部署完整指南

## 📖 目录
- [准备工作](#准备工作)
- [步骤一：登录 Vercel](#步骤一登录-vercel)
- [步骤二：导入 GitHub 项目](#步骤二导入-github-项目)
- [步骤三：配置项目（关键）](#步骤三配置项目关键)
- [步骤四：部署并获取 URL](#步骤四部署并获取-url)
- [常见问题](#常见问题)
- [后续操作](#后续操作)

---

## 准备工作

### ✅ 确保代码已推送到 GitHub

```bash
cd /e/Pgithub/Gitdemo
git status
git push origin master
```

确认你的仓库地址：
```
https://github.com/ysxysigil/Gitdemo
```

---

## 步骤一：登录 Vercel

### 1.1 访问 Vercel 官网

在浏览器中打开：
```
https://vercel.com
```

### 1.2 登录或注册

点击右上角的 **"Sign Up"** 或 **"Login"** 按钮。

**推荐方式：使用 GitHub 登录**

1. 点击 **"Continue with GitHub"**
2. 授权 Vercel 访问你的 GitHub 账号
3. 完成登录

> 💡 **提示：** 使用 GitHub 登录后，Vercel 可以直接访问你的仓库，无需额外配置。

---

## 步骤二：导入 GitHub 项目

### 2.1 进入控制台

登录后，你会看到 Vercel Dashboard（控制台）。

### 2.2 创建新项目

点击右上角的 **"Add New..."** 按钮，然后选择 **"Project"**

或者直接点击 **"Import Project"** / **"New Project"** 按钮。

### 2.3 选择 Git 提供商

在 "Import Git Repository" 页面：

1. 确保选择了 **"GitHub"**
2. 如果是首次使用，需要点击 **"Install"** 或 **"Adjust GitHub App Permissions"**

### 2.4 授权 GitHub（如果需要）

如果 Vercel 还没有访问权限：

1. 点击 **"Adjust GitHub App Permissions"**
2. 在弹出的 GitHub 授权页面中：
   - 可以选择 **"All repositories"**（所有仓库）
   - 或选择 **"Only select repositories"**（仅选定仓库）
   - 推荐选择 **"Only select repositories"**，然后选中 `Gitdemo`
3. 点击 **"Install & Authorize"**

### 2.5 找到并选择你的仓库

在仓库列表中找到 `Gitdemo`：

```
🔍 搜索框：输入 "Gitdemo"
或
📋 列表中找到：ysxysigil/Gitdemo
```

点击仓库右侧的 **"Import"** 按钮。

> 📸 **截图参考：**
> ```
> ┌─────────────────────────────────────────┐
> │  Import Git Repository                  │
> ├─────────────────────────────────────────┤
> │  Search repositories...                 │
> │                                         │
> │  ysxysigil/Gitdemo                     │
> │  Git learning demo repo        [Import]│
> │                                         │
> │  ysxysigil/other-repo                  │
> │  Another project              [Import] │
> └─────────────────────────────────────────┘
> ```

---

## 步骤三：配置项目（关键）

### 3.1 项目基本配置

导入后，会进入 "Configure Project" 页面。

**填写以下信息：**

#### ① Project Name（项目名称）
```
jump-game
```
或其他你喜欢的名字（会用于生成 URL）

#### ② Framework Preset（框架预设）
```
Other
```

点击下拉菜单，选择 **"Other"**（因为我们是纯静态 HTML 项目）

> 📸 **截图参考：**
> ```
> ┌─────────────────────────────────────────┐
> │  Framework Preset                       │
> │  ┌─────────────────────────────────┐   │
> │  │ Other                        ▼  │   │
> │  └─────────────────────────────────┘   │
> │  ○ Next.js                              │
> │  ○ Create React App                     │
> │  ○ Vue.js                               │
> │  ● Other                                │
> └─────────────────────────────────────────┘
> ```

### 3.2 配置 Root Directory（最关键！）

这是最重要的一步！

#### 找到 "Root Directory" 选项

在配置页面向下滚动，找到 **"Root Directory"** 部分。

默认显示：
```
Root Directory: ./
```

#### 点击 "Edit" 按钮

点击 Root Directory 右侧的 **"Edit"** 按钮。

#### 输入子目录路径

在弹出的输入框中输入：
```
gamestest
```

#### 确认修改

点击 **"Continue"** 或 **"Save"** 按钮。

> 📸 **截图参考：**
> ```
> ┌─────────────────────────────────────────┐
> │  Root Directory                    Edit │
> │  ┌─────────────────────────────────┐   │
> │  │ gamestest                       │   │
> │  └─────────────────────────────────┘   │
> │                                         │
> │  Your source code is located in the    │
> │  "gamestest" directory.                │
> └─────────────────────────────────────────┘
> ```

### 3.3 其他构建设置（可选，通常留空）

#### Build and Output Settings

这些设置通常**不需要修改**，保持默认即可：

| 设置项 | 值 | 说明 |
|--------|-----|------|
| Build Command | (留空) | 不需要构建 |
| Output Directory | (留空) | 使用源文件 |
| Install Command | (留空) | 不需要安装依赖 |

> 💡 **提示：** 如果这些选项被折叠了，可以点击 **"Build and Output Settings"** 旁边的箭头展开。

### 3.4 环境变量（不需要）

这个游戏不需要环境变量，跳过此步骤。

---

## 步骤四：部署并获取 URL

### 4.1 开始部署

确认所有配置正确后，点击页面底部的 **"Deploy"** 按钮。

> 📸 **截图参考：**
> ```
> ┌─────────────────────────────────────────┐
> │                                         │
> │  ✓ Project Name: jump-game             │
> │  ✓ Framework: Other                    │
> │  ✓ Root Directory: gamestest           │
> │                                         │
> │              [Deploy] ←───────点击这里   │
> └─────────────────────────────────────────┘
> ```

### 4.2 等待部署

部署过程通常需要 **30-90 秒**。

你会看到：
1. **Building** - 正在构建（对于我们的项目很快）
2. **Deploying** - 正在部署
3. **Ready** - 部署完成 ✅

> 📸 **部署中的界面：**
> ```
> ┌─────────────────────────────────────────┐
> │  🎉 Deploying jump-game                │
> │                                         │
> │  ━━━━━━━━━━━━━━━━━━━━━ 75%            │
> │                                         │
> │  ✓ Building                            │
> │  ▶ Deploying...                        │
> │  ○ Ready                               │
> └─────────────────────────────────────────┘
> ```

### 4.3 获取 URL

部署成功后，你会看到：

```
🎉 Congratulations!
Your project has been deployed.
```

在页面上会显示你的游戏 URL：

```
https://jump-game-xxx.vercel.app
```

或类似的格式（xxx 是自动生成的字符）

### 4.4 访问你的游戏

点击 URL 或复制链接在浏览器中打开，你应该能看到跳跃游戏！

**如果看到游戏界面 → 恭喜！部署成功！** 🎉

**如果看到 404 错误 → 查看下面的"常见问题"部分**

---

## 常见问题

### ❌ 问题 1：部署后显示 404 Not Found

**原因：** Root Directory 没有正确设置为 `gamestest`

**解决方案：**

1. 在 Vercel Dashboard 中找到你的项目
2. 点击项目进入详情页
3. 点击顶部的 **"Settings"** 标签
4. 在左侧菜单找到 **"General"**
5. 向下滚动找到 **"Root Directory"**
6. 点击 **"Edit"** 按钮
7. 输入 `gamestest`
8. 点击 **"Save"**
9. 返回 **"Deployments"** 标签
10. 点击最右侧的 **"..."** 菜单
11. 选择 **"Redeploy"**（重新部署）

> 📸 **设置页面参考：**
> ```
> Settings > General
>
> ┌─────────────────────────────────────────┐
> │  Root Directory                         │
> │  ┌─────────────────────────────────┐   │
> │  │ gamestest                  Edit │   │
> │  └─────────────────────────────────┘   │
> │                                         │
> │                          [Save]         │
> └─────────────────────────────────────────┘
> ```

### ❌ 问题 2：找不到我的 GitHub 仓库

**原因：** Vercel 没有访问权限

**解决方案：**

1. 在导入页面点击 **"Adjust GitHub App Permissions"**
2. 在 GitHub 授权页面，确保选中了 `Gitdemo` 仓库
3. 点击 **"Install & Authorize"**
4. 返回 Vercel，刷新页面

### ❌ 问题 3：部署失败

**可能原因和解决方案：**

1. **检查仓库是否公开**
   - 进入 GitHub 仓库设置
   - 确保仓库是 Public（公开的）

2. **检查 vercel.json 配置**
   - 确保 `gamestest/vercel.json` 文件存在
   - 检查 JSON 格式是否正确

3. **查看部署日志**
   - 在 Vercel 项目页面
   - 点击 **"Deployments"** 标签
   - 点击失败的部署
   - 查看 **"Build Logs"** 获取详细错误信息

### ❌ 问题 4：游戏加载了但功能不正常

**检查清单：**

1. **打开浏览器开发者工具**
   - 按 F12 或右键 → 检查
   - 查看 Console 标签中的错误信息

2. **检查文件路径**
   - 确保 `gamestest` 目录包含所有必需文件：
     - index.html
     - style.css
     - game.js

3. **清除缓存**
   - 按 Ctrl+Shift+R (Windows) 或 Cmd+Shift+R (Mac) 强制刷新

---

## 后续操作

### 🔄 自动部署设置

部署成功后，Vercel 会自动监听你的 GitHub 仓库：

✅ **每次推送代码到 GitHub，Vercel 会自动重新部署！**

测试自动部署：

```bash
# 1. 修改游戏代码
vim gamestest/style.css

# 2. 提交更改
git add gamestest/
git commit -m "Update game style"
git push origin master

# 3. 访问 Vercel Dashboard
# 你会看到新的部署正在进行
```

### 🌐 自定义域名

如果你有自己的域名：

1. 进入项目的 **"Settings"** → **"Domains"**
2. 点击 **"Add"** 按钮
3. 输入你的域名（如 `game.yourdomain.com`）
4. 按照提示配置 DNS 记录
5. 等待 DNS 生效（可能需要几分钟到几小时）

### 📊 查看分析数据

启用 Vercel Analytics：

1. 进入项目的 **"Analytics"** 标签
2. 点击 **"Enable Analytics"**
3. 查看访问量、性能数据等

### 🔙 版本回滚

如果新部署有问题，可以回滚到之前的版本：

1. 进入 **"Deployments"** 标签
2. 找到之前成功的部署
3. 点击右侧的 **"..."** 菜单
4. 选择 **"Promote to Production"**

---

## 📝 配置总结

### 正确的配置应该是：

| 配置项 | 值 |
|--------|-----|
| Project Name | `jump-game`（或你喜欢的名字） |
| Framework Preset | `Other` |
| **Root Directory** | **`gamestest`**（最重要！） |
| Build Command | (留空) |
| Output Directory | (留空) |
| Install Command | (留空) |

### 完整配置截图示意：

```
┌──────────────────────────────────────────────┐
│  Configure Project                           │
├──────────────────────────────────────────────┤
│                                              │
│  Project Name                                │
│  ┌────────────────────────────────────┐     │
│  │ jump-game                          │     │
│  └────────────────────────────────────┘     │
│                                              │
│  Framework Preset                            │
│  ┌────────────────────────────────────┐     │
│  │ Other                           ▼  │     │
│  └────────────────────────────────────┘     │
│                                              │
│  Root Directory                         Edit │
│  ┌────────────────────────────────────┐     │
│  │ gamestest                          │     │
│  └────────────────────────────────────┘     │
│                                              │
│  Build and Output Settings                  │
│  Build Command:         (留空)              │
│  Output Directory:      (留空)              │
│  Install Command:       (留空)              │
│                                              │
│                            [Deploy] ←─────点击│
└──────────────────────────────────────────────┘
```

---

## 🎯 快速检查清单

部署前检查：

- [ ] 代码已推送到 GitHub
- [ ] 已登录 Vercel
- [ ] 已授权 Vercel 访问 GitHub
- [ ] 选择了正确的仓库 (Gitdemo)

配置时检查：

- [ ] Framework Preset 选择了 "Other"
- [ ] **Root Directory 设置为 "gamestest"** ⭐ 最重要！
- [ ] Build/Output 设置留空

部署后检查：

- [ ] 部署状态显示 "Ready"
- [ ] 访问 URL 能看到游戏
- [ ] 游戏功能正常（能跳跃、计分）

---

## 📞 需要帮助？

如果遇到问题：

1. 📖 查看本文档的"常见问题"部分
2. 🔍 在 Vercel Dashboard 查看部署日志
3. 💬 访问 [Vercel 社区](https://github.com/vercel/vercel/discussions)
4. 📧 联系 Vercel 支持

---

## 🎉 成功部署后

你的游戏 URL 格式：
```
https://jump-game-[random-id].vercel.app
```

**恭喜！你的跳跃游戏已经上线了！** 🎮

现在你可以：
- 🔗 分享链接给朋友
- 📱 在手机上玩
- 🏆 挑战高分记录
- 💻 继续开发新功能

---

**最后提示：** 记住 Root Directory 设置为 `gamestest` 是成功部署的关键！✨
