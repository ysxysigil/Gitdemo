# 🚀 快速开始指南

## 本地测试游戏

### 方法 1：直接打开（最简单）

1. 找到 `gamestest` 文件夹
2. 双击 `index.html` 文件
3. 游戏会在浏览器中打开
4. 点击"开始游戏"按钮开始玩！

### 方法 2：使用本地服务器（推荐）

**使用 Python（如果已安装）：**

```bash
cd gamestest
python -m http.server 8000
```

然后在浏览器访问：`http://localhost:8000`

**使用 Node.js（如果已安装）：**

```bash
cd gamestest
npx serve
```

**使用 VS Code 插件：**

1. 安装 "Live Server" 插件
2. 右键点击 `index.html`
3. 选择 "Open with Live Server"

---

## 部署到 Vercel

### ⚡ 超快速部署（Windows）

双击运行 `deploy.bat` 文件，按提示操作！

### ⚡ 超快速部署（Linux/macOS）

```bash
chmod +x deploy.sh
./deploy.sh
```

### 📝 手动部署步骤

#### 1. 安装 Vercel CLI

```bash
npm install -g vercel
```

#### 2. 登录 Vercel

```bash
vercel login
```

按提示完成登录（会打开浏览器）

#### 3. 部署

```bash
# 进入游戏目录
cd gamestest

# 部署到生产环境
vercel --prod
```

#### 4. 访问游戏

部署完成后，你会得到一个 URL，例如：
```
https://your-game.vercel.app
```

复制这个 URL 分享给朋友！

---

## 游戏玩法

### 🎮 控制方式

- **键盘**：按 `空格键` 跳跃
- **触摸屏**：点击屏幕跳跃
- **鼠标**：点击游戏画面跳跃

### 🎯 游戏目标

- 控制角色跳跃
- 躲避障碍物
- 获得更高分数
- 挑战最高分记录

### 💡 小技巧

1. **掌握节奏**：观察障碍物的间隔，把握跳跃时机
2. **早跳不如晚跳**：稍微晚一点起跳反而更安全
3. **保持专注**：随着分数增加，游戏会变得更具挑战性
4. **多次练习**：熟能生巧，找到最佳的跳跃节奏

---

## 自定义游戏

想修改游戏？很简单！

### 修改角色颜色

编辑 `game.js` 文件，找到：

```javascript
const player = {
    // ...
    color: '#667eea'  // 修改这个颜色值
};
```

### 修改障碍物颜色

```javascript
obstacles.push({
    // ...
    color: '#764ba2'  // 修改这个颜色值
});
```

### 调整游戏难度

```javascript
// 障碍物生成间隔（越小越难）
const obstacleInterval = 120;  // 修改这个数值

// 障碍物移动速度（越大越难）
obstacle.x -= 5;  // 修改这个数值
```

### 修改跳跃高度

```javascript
const player = {
    // ...
    jumpPower: -12,  // 负值越大，跳得越高
    gravity: 0.6     // 值越大，下落越快
};
```

---

## 常见问题

### Q: 游戏无法打开？

**A:** 确保使用现代浏览器（Chrome、Firefox、Edge、Safari）

### Q: 分数不显示？

**A:** 刷新页面重试，或清除浏览器缓存

### Q: 部署后游戏无法访问？

**A:** 检查：
1. 部署是否成功完成
2. URL 是否正确
3. 网络连接是否正常

### Q: 想修改游戏背景？

**A:** 编辑 `style.css` 中的 `body` 样式：

```css
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}
```

### Q: 如何添加更多功能？

**A:** 查看完整的 [README.md](README.md) 了解代码结构，然后修改相应文件：
- `index.html` - 页面结构
- `style.css` - 样式设计
- `game.js` - 游戏逻辑

---

## 下一步

🎉 **恭喜！** 你已经成功运行了游戏！

现在你可以：

1. ✅ 分享游戏链接给朋友
2. ✅ 自定义游戏外观和难度
3. ✅ 添加新功能（如音效、更多障碍物类型）
4. ✅ 学习 HTML5 Canvas 开发

---

## 需要帮助？

- 📖 查看 [完整文档](README.md)
- 🚀 查看 [部署指南](DEPLOYMENT.md)
- 🐛 [报告问题](https://github.com/ysxysigil/Gitdemo/issues)

---

**祝你游戏愉快！** 🎮✨
