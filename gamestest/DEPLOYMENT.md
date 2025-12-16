# 🚀 Vercel 部署指南

## 方法一：使用 Vercel CLI（推荐）

### 1. 安装 Vercel CLI

```bash
npm install -g vercel
```

### 2. 登录 Vercel

```bash
vercel login
```

### 3. 部署项目

```bash
# 进入项目目录
cd gamestest

# 部署（测试环境）
vercel

# 部署到生产环境
vercel --prod
```

### 4. 访问你的游戏

部署完成后，Vercel 会提供一个 URL，例如：
```
https://your-game-name.vercel.app
```

---

## 方法二：通过 GitHub 自动部署

### 1. 推送代码到 GitHub

如果还没有推送，运行：

```bash
cd /e/Pgithub/Gitdemo
git add .
git commit -m "Add jump game"
git push origin master
```

### 2. 在 Vercel 导入项目

1. 访问 [vercel.com](https://vercel.com) 并登录
2. 点击 "Add New Project"
3. 选择 "Import Git Repository"
4. 连接你的 GitHub 账号
5. 选择 `Gitdemo` 仓库
6. 设置项目配置：
   - **Root Directory**: 选择 `gamestest`
   - **Framework Preset**: 选择 "Other"
   - 保持其他默认设置

7. 点击 "Deploy"

### 3. 配置自动部署

每次推送到 GitHub 的 master 分支，Vercel 会自动重新部署。

---

## 方法三：拖放部署（最简单）

### 1. 准备文件

确保 `gamestest` 文件夹包含以下文件：
- index.html
- style.css
- game.js
- vercel.json

### 2. 拖放部署

1. 访问 [vercel.com](https://vercel.com) 并登录
2. 点击 "Add New Project"
3. 选择 "Deploy from folder"
4. 将整个 `gamestest` 文件夹拖放到界面上
5. 等待部署完成（通常 30 秒内）

---

## 方法四：使用 Vercel Desktop（可视化工具）

### 1. 下载 Vercel Desktop

访问 [Vercel Desktop](https://vercel.com/desktop) 下载应用

### 2. 打开项目

在 Vercel Desktop 中打开 `gamestest` 文件夹

### 3. 点击部署

点击 "Deploy" 按钮即可

---

## 部署配置说明

### vercel.json 配置

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

这个配置确保：
- 所有静态文件被正确服务
- 路由正确映射到文件

---

## 自定义域名（可选）

### 1. 在 Vercel 项目设置中

1. 进入项目的 "Settings" 页面
2. 选择 "Domains"
3. 添加你的自定义域名

### 2. 配置 DNS

在你的域名提供商处，添加以下 DNS 记录：

**使用 A 记录：**
```
A     @     76.76.21.21
```

**或使用 CNAME 记录：**
```
CNAME    @    cname.vercel-dns.com
```

---

## 环境变量（如果需要）

虽然这个游戏不需要环境变量，但如果将来需要：

1. 在 Vercel 项目设置中选择 "Environment Variables"
2. 添加键值对
3. 重新部署项目

---

## 监控和分析

### Vercel Analytics

1. 在项目设置中启用 Analytics
2. 查看访问统计、性能指标等

### 查看部署日志

1. 在 Vercel Dashboard 查看每次部署的日志
2. 可以回滚到之前的任何版本

---

## 性能优化建议

### 1. 启用 Vercel 的优化功能

- 自动压缩静态资源
- 全球 CDN 分发
- HTTP/2 支持

### 2. 图片优化（如果添加图片）

使用 Vercel 的 Image Optimization API：

```html
<img src="/api/og?title=Game" />
```

### 3. 缓存配置

在 `vercel.json` 中添加缓存头：

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

---

## 常见问题

### Q: 部署失败怎么办？

**A:** 检查：
1. 文件结构是否正确
2. vercel.json 格式是否正确
3. 查看部署日志中的错误信息

### Q: 如何更新已部署的项目？

**A:**
- 使用 GitHub: 推送代码后自动更新
- 使用 CLI: 再次运行 `vercel --prod`
- 使用拖放: 重新拖放文件夹

### Q: 部署后游戏无法运行？

**A:** 检查：
1. 浏览器控制台是否有错误
2. 文件路径是否正确
3. 在本地先测试游戏是否正常运行

### Q: 如何删除部署的项目？

**A:**
1. 在 Vercel Dashboard 中找到项目
2. 进入 Settings
3. 滚动到底部，点击 "Delete Project"

---

## 下一步

部署成功后，你可以：

1. 分享游戏链接给朋友
2. 在社交媒体上分享
3. 继续改进游戏功能
4. 添加更多关卡和功能

---

## 有用的链接

- [Vercel 官方文档](https://vercel.com/docs)
- [Vercel CLI 文档](https://vercel.com/docs/cli)
- [Vercel GitHub 集成](https://vercel.com/docs/git/vercel-for-github)
- [Vercel 社区](https://github.com/vercel/vercel/discussions)

---

**祝部署顺利！** 🎉

如果遇到问题，可以查看 Vercel 的官方文档或在 GitHub 上提 issue。
