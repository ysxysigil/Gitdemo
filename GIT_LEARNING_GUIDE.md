# Git 完整学习指南

## 目录

- [Git 完整学习指南](#git-完整学习指南)
  - [目录](#目录)
  - [1. Git 基础配置](#1-git-基础配置)
    - [1.1 安装 Git](#11-安装-git)
    - [1.2 配置用户信息](#12-配置用户信息)
    - [1.3 查看配置](#13-查看配置)
    - [1.4 配置级别](#14-配置级别)
  - [2. 创建仓库和基本操作](#2-创建仓库和基本操作)
    - [2.1 初始化仓库](#21-初始化仓库)
    - [2.2 工作区、暂存区、版本库](#22-工作区暂存区版本库)
    - [2.3 查看状态](#23-查看状态)
    - [2.4 添加文件到暂存区](#24-添加文件到暂存区)
    - [2.5 提交更改](#25-提交更改)
    - [2.6 查看提交历史](#26-查看提交历史)
  - [3. .gitignore 文件](#3-gitignore-文件)
    - [3.1 什么是 .gitignore](#31-什么是-gitignore)
    - [3.2 .gitignore 语法规则](#32-gitignore-语法规则)
    - [3.3 常用 .gitignore 模板](#33-常用-gitignore-模板)
  - [4. 远程仓库操作](#4-远程仓库操作)
    - [4.1 添加远程仓库](#41-添加远程仓库)
    - [4.2 查看远程仓库](#42-查看远程仓库)
    - [4.3 推送到远程仓库](#43-推送到远程仓库)
    - [4.4 从远程仓库拉取](#44-从远程仓库拉取)
    - [4.5 克隆远程仓库](#45-克隆远程仓库)
    - [4.6 删除远程仓库](#46-删除远程仓库)
  - [5. 分支管理](#5-分支管理)
    - [5.1 什么是分支](#51-什么是分支)
    - [5.2 查看分支](#52-查看分支)
    - [5.3 创建分支](#53-创建分支)
    - [5.4 切换分支](#54-切换分支)
    - [5.5 创建并切换分支](#55-创建并切换分支)
    - [5.6 合并分支](#56-合并分支)
    - [5.7 删除分支](#57-删除分支)
    - [5.8 分支管理最佳实践](#58-分支管理最佳实践)
  - [6. 查看历史和差异](#6-查看历史和差异)
    - [6.1 查看提交历史](#61-查看提交历史)
    - [6.2 查看具体提交的详细信息](#62-查看具体提交的详细信息)
    - [6.3 查看差异](#63-查看差异)
    - [6.4 格式化日志输出](#64-格式化日志输出)
  - [7. 撤销和回退操作](#7-撤销和回退操作)
    - [7.1 撤销工作区的修改](#71-撤销工作区的修改)
    - [7.2 取消暂存](#72-取消暂存)
    - [7.3 修改最后一次提交](#73-修改最后一次提交)
    - [7.4 回退版本](#74-回退版本)
    - [7.5 恢复误删的提交](#75-恢复误删的提交)
    - [7.6 删除未跟踪的文件](#76-删除未跟踪的文件)
  - [8. Stash 暂存工作](#8-stash-暂存工作)
    - [8.1 什么是 Stash](#81-什么是-stash)
    - [8.2 暂存当前工作](#82-暂存当前工作)
    - [8.3 查看暂存列表](#83-查看暂存列表)
    - [8.4 查看暂存内容](#84-查看暂存内容)
    - [8.5 应用暂存](#85-应用暂存)
    - [8.6 删除暂存](#86-删除暂存)
    - [8.7 从暂存创建分支](#87-从暂存创建分支)
  - [9. 处理合并冲突](#9-处理合并冲突)
    - [9.1 什么是合并冲突](#91-什么是合并冲突)
    - [9.2 冲突的标记](#92-冲突的标记)
    - [9.3 解决冲突的步骤](#93-解决冲突的步骤)
    - [9.4 取消合并](#94-取消合并)
    - [9.5 使用合并工具](#95-使用合并工具)
  - [10. 标签管理](#10-标签管理)
    - [10.1 什么是标签](#101-什么是标签)
    - [10.2 查看标签](#102-查看标签)
    - [10.3 创建轻量标签](#103-创建轻量标签)
    - [10.4 创建附注标签](#104-创建附注标签)
    - [10.5 给历史提交打标签](#105-给历史提交打标签)
    - [10.6 查看标签信息](#106-查看标签信息)
    - [10.7 推送标签到远程](#107-推送标签到远程)
    - [10.8 删除标签](#108-删除标签)
    - [10.9 检出标签](#109-检出标签)
  - [11. 常用工作流程](#11-常用工作流程)
    - [11.1 日常开发流程](#111-日常开发流程)
    - [11.2 功能开发流程](#112-功能开发流程)
    - [11.3 Bug 修复流程](#113-bug-修复流程)
    - [11.4 代码审查流程](#114-代码审查流程)
  - [12. Git 最佳实践](#12-git-最佳实践)
    - [12.1 提交信息规范](#121-提交信息规范)
    - [12.2 分支命名规范](#122-分支命名规范)
    - [12.3 其他最佳实践](#123-其他最佳实践)
  - [13. 常见问题解决](#13-常见问题解决)
    - [13.1 忘记添加文件到上次提交](#131-忘记添加文件到上次提交)
    - [13.2 提交到了错误的分支](#132-提交到了错误的分支)
    - [13.3 需要撤销已推送的提交](#133-需要撤销已推送的提交)
    - [13.4 误删了分支](#134-误删了分支)
  - [14. Git 命令速查表](#14-git-命令速查表)
    - [14.1 配置相关](#141-配置相关)
    - [14.2 仓库操作](#142-仓库操作)
    - [14.3 基本操作](#143-基本操作)
    - [14.4 分支操作](#144-分支操作)
    - [14.5 远程操作](#145-远程操作)
    - [14.6 历史查看](#146-历史查看)
    - [14.7 撤销操作](#147-撤销操作)
    - [14.8 暂存操作](#148-暂存操作)
    - [14.9 标签操作](#149-标签操作)
  - [15. 进阶主题](#15-进阶主题)
    - [15.1 Rebase vs Merge](#151-rebase-vs-merge)
    - [15.2 Cherry-pick](#152-cherry-pick)
    - [15.3 Git Hooks](#153-git-hooks)
    - [15.4 子模块（Submodules）](#154-子模块submodules)
  - [16. 学习资源](#16-学习资源)

---

## 1. Git 基础配置

### 1.1 安装 Git

**Windows:**
```bash
# 下载 Git for Windows
# https://git-scm.com/download/win
# 运行安装程序，按默认选项安装
```

**macOS:**
```bash
# 使用 Homebrew 安装
brew install git
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install git

# CentOS/Fedora
sudo yum install git
```

验证安装：
```bash
git --version
```

### 1.2 配置用户信息

Git 需要知道你的身份信息，用于记录提交者信息。

```bash
# 配置用户名
git config --global user.name "Your Name"

# 配置邮箱
git config --global user.email "your.email@example.com"
```

**示例：**
```bash
git config --global user.name "ysxy"
git config --global user.email "390236300@qq.com"
```

### 1.3 查看配置

```bash
# 查看所有配置
git config --global --list

# 查看特定配置
git config --global user.name
git config --global user.email
```

### 1.4 配置级别

Git 有三个配置级别：

1. **系统级别** (`--system`)：对所有用户生效
2. **全局级别** (`--global`)：对当前用户所有仓库生效（推荐）
3. **仓库级别** (`--local`)：仅对当前仓库生效

```bash
# 全局配置（推荐）
git config --global user.name "Your Name"

# 仓库级别配置
git config --local user.name "Your Name"

# 查看配置来源
git config --list --show-origin
```

---

## 2. 创建仓库和基本操作

### 2.1 初始化仓库

```bash
# 在当前目录初始化 Git 仓库
git init

# 在指定目录初始化 Git 仓库
git init <directory>
```

**示例：**
```bash
# 创建项目目录并初始化
mkdir my-project
cd my-project
git init
```

这会在当前目录创建一个 `.git` 隐藏文件夹，包含所有 Git 需要的文件。

### 2.2 工作区、暂存区、版本库

Git 有三个工作区域：

```
工作区（Working Directory）
    ↓  git add
暂存区（Staging Area / Index）
    ↓  git commit
版本库（Repository）
```

- **工作区**：你实际编辑文件的地方
- **暂存区**：临时存储准备提交的更改
- **版本库**：Git 存储所有提交历史的地方

### 2.3 查看状态

```bash
# 查看工作区和暂存区的状态
git status

# 简洁输出
git status -s
git status --short
```

**输出示例：**
```
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        newfile.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

### 2.4 添加文件到暂存区

```bash
# 添加指定文件
git add <file>

# 添加多个文件
git add <file1> <file2> <file3>

# 添加当前目录所有更改
git add .

# 添加所有更改（包括删除）
git add -A
git add --all

# 添加指定目录
git add <directory>

# 交互式添加
git add -p
git add --patch
```

**示例：**
```bash
# 添加 README.md
git add README.md

# 添加所有 .js 文件
git add *.js

# 添加 src 目录下所有文件
git add src/
```

### 2.5 提交更改

```bash
# 提交暂存区的更改
git commit -m "提交信息"

# 提交并显示详细差异
git commit -v

# 跳过暂存区直接提交所有已跟踪文件的更改
git commit -a -m "提交信息"
git commit -am "提交信息"

# 修改最后一次提交
git commit --amend -m "新的提交信息"
```

**示例：**
```bash
git add README.md
git commit -m "Add README file with project description"
```

### 2.6 查看提交历史

```bash
# 查看提交历史
git log

# 简洁的单行显示
git log --oneline

# 显示最近 n 条提交
git log -n 5

# 显示提交的详细差异
git log -p
git log --patch

# 显示统计信息
git log --stat

# 图形化显示分支历史
git log --graph --oneline --all
```

---

## 3. .gitignore 文件

### 3.1 什么是 .gitignore

`.gitignore` 文件用于告诉 Git 哪些文件或目录不需要被版本控制。

### 3.2 .gitignore 语法规则

```bash
# 注释以 # 开头

# 忽略所有 .a 文件
*.a

# 但跟踪 lib.a，即使上面忽略了所有 .a 文件
!lib.a

# 只忽略当前目录下的 TODO 文件，不忽略子目录的 TODO
/TODO

# 忽略 build/ 目录下的所有文件
build/

# 忽略 doc 目录下的所有 .txt 文件，但不包括子目录
doc/*.txt

# 忽略 doc 目录及其子目录下的所有 .pdf 文件
doc/**/*.pdf
```

### 3.3 常用 .gitignore 模板

**通用模板：**
```gitignore
# 依赖目录
node_modules/
vendor/
bower_components/

# 日志文件
*.log
logs/
npm-debug.log*

# 操作系统生成的文件
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE 配置文件
.vscode/
.idea/
*.swp
*.swo
*~
.project
.classpath
.settings/

# 编译输出
*.com
*.class
*.dll
*.exe
*.o
*.so
dist/
build/
out/
target/

# 环境变量文件
.env
.env.local
.env.*.local

# 临时文件
*.tmp
*.temp
*.bak
*.cache
```

**Node.js 项目：**
```gitignore
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.npm
.yarn-integrity
.env
dist/
build/
.cache/
```

**Python 项目：**
```gitignore
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/
*.egg-info/
dist/
build/
```

**Java 项目：**
```gitignore
*.class
*.jar
*.war
*.ear
target/
.gradle/
build/
.idea/
*.iml
```

---

## 4. 远程仓库操作

### 4.1 添加远程仓库

```bash
# 添加远程仓库
git remote add <name> <url>

# 通常使用 origin 作为默认远程仓库名称
git remote add origin https://github.com/username/repo.git
```

**示例：**
```bash
git remote add origin https://github.com/ysxysigil/Gitdemo.git
```

### 4.2 查看远程仓库

```bash
# 查看远程仓库列表
git remote

# 查看远程仓库详细信息
git remote -v

# 查看指定远程仓库的详细信息
git remote show origin
```

### 4.3 推送到远程仓库

```bash
# 推送到远程仓库
git push <remote> <branch>

# 第一次推送，设置上游分支
git push -u origin master
git push --set-upstream origin master

# 之后可以简写为
git push

# 推送所有分支
git push --all origin

# 强制推送（危险操作！）
git push -f origin master
git push --force origin master
```

**示例：**
```bash
# 第一次推送
git push -u origin master

# 后续推送
git push
```

### 4.4 从远程仓库拉取

```bash
# 拉取并合并远程分支
git pull <remote> <branch>

# 简写形式（使用默认远程分支）
git pull

# 只拉取不合并
git fetch origin

# 查看远程分支
git branch -r

# 查看所有分支（本地和远程）
git branch -a
```

**pull vs fetch:**
- `git pull` = `git fetch` + `git merge`
- `git fetch` 只下载数据，不自动合并
- `git pull` 下载数据并自动合并到当前分支

### 4.5 克隆远程仓库

```bash
# 克隆仓库
git clone <url>

# 克隆到指定目录
git clone <url> <directory>

# 克隆指定分支
git clone -b <branch> <url>

# 浅克隆（只克隆最近的提交历史）
git clone --depth 1 <url>
```

**示例：**
```bash
git clone https://github.com/ysxysigil/Gitdemo.git
git clone https://github.com/ysxysigil/Gitdemo.git my-project
```

### 4.6 删除远程仓库

```bash
# 删除远程仓库引用
git remote remove <name>
git remote rm <name>

# 重命名远程仓库
git remote rename <old-name> <new-name>
```

---

## 5. 分支管理

### 5.1 什么是分支

分支是 Git 最强大的功能之一。分支允许你从主线上分离出来，独立开发功能而不影响主线。

```
master  ─●─●─●─●─●─●─●
              ↓
         feature ●─●─●
```

### 5.2 查看分支

```bash
# 查看本地分支
git branch

# 查看远程分支
git branch -r

# 查看所有分支（本地和远程）
git branch -a

# 查看分支详细信息
git branch -v

# 查看已合并到当前分支的分支
git branch --merged

# 查看未合并到当前分支的分支
git branch --no-merged
```

### 5.3 创建分支

```bash
# 创建新分支
git branch <branch-name>

# 基于指定提交创建分支
git branch <branch-name> <commit-hash>
```

**示例：**
```bash
git branch feature-login
git branch bugfix-issue-123
```

### 5.4 切换分支

```bash
# 切换到指定分支
git checkout <branch-name>

# 新的切换命令（Git 2.23+）
git switch <branch-name>
```

### 5.5 创建并切换分支

```bash
# 创建并切换到新分支
git checkout -b <branch-name>

# 新的命令（Git 2.23+）
git switch -c <branch-name>
```

**示例：**
```bash
git checkout -b feature/user-auth
git switch -c feature/shopping-cart
```

### 5.6 合并分支

```bash
# 合并指定分支到当前分支
git merge <branch-name>

# 禁用快进合并（保留分支历史）
git merge --no-ff <branch-name>

# 压缩合并（将多个提交合并为一个）
git merge --squash <branch-name>
```

**示例：**
```bash
# 切换到 master 分支
git checkout master

# 合并 feature 分支
git merge feature-login
```

**合并类型：**

1. **Fast-forward 合并**：
```
master     ●─●─●
                ↓
feature        ●─●

合并后：
master     ●─●─●─●─●
```

2. **三方合并**：
```
master     ●─●─●─●
                ↓  ↘
feature        ●─●  ●（合并提交）
```

### 5.7 删除分支

```bash
# 删除已合并的分支
git branch -d <branch-name>

# 强制删除分支（即使未合并）
git branch -D <branch-name>

# 删除远程分支
git push origin --delete <branch-name>
git push origin :<branch-name>
```

**示例：**
```bash
git branch -d feature-login
git push origin --delete feature-login
```

### 5.8 分支管理最佳实践

**常见分支类型：**

- `master / main`：主分支，生产环境代码
- `develop`：开发分支，集成最新开发成果
- `feature/*`：功能分支，开发新功能
- `bugfix/*`：Bug 修复分支
- `hotfix/*`：紧急修复分支
- `release/*`：发布分支

**示例：**
```bash
# 功能开发
git checkout -b feature/user-authentication

# Bug 修复
git checkout -b bugfix/login-error

# 紧急修复
git checkout -b hotfix/security-patch
```

---

## 6. 查看历史和差异

### 6.1 查看提交历史

```bash
# 查看完整提交历史
git log

# 简洁单行显示
git log --oneline

# 显示最近 n 条
git log -n 5
git log -5

# 显示某个文件的历史
git log <file>

# 显示某个作者的提交
git log --author="ysxy"

# 按时间范围查看
git log --since="2 weeks ago"
git log --after="2024-01-01"
git log --before="2024-12-31"

# 按提交信息搜索
git log --grep="bug"

# 图形化显示
git log --graph --oneline --all --decorate
```

### 6.2 查看具体提交的详细信息

```bash
# 查看指定提交
git show <commit-hash>

# 查看最新提交
git show HEAD

# 查看上一个提交
git show HEAD~1
git show HEAD^

# 查看上上个提交
git show HEAD~2
git show HEAD^^
```

### 6.3 查看差异

```bash
# 查看工作区和暂存区的差异
git diff

# 查看暂存区和版本库的差异
git diff --staged
git diff --cached

# 查看工作区和版本库的差异
git diff HEAD

# 比较两个提交
git diff <commit1> <commit2>

# 比较两个分支
git diff <branch1> <branch2>

# 查看指定文件的差异
git diff <file>

# 只显示文件名
git diff --name-only

# 显示统计信息
git diff --stat
```

**示例：**
```bash
# 查看未暂存的更改
git diff

# 查看已暂存的更改
git diff --staged

# 比较 master 和 feature 分支
git diff master feature

# 比较两次提交
git diff abc123 def456
```

### 6.4 格式化日志输出

```bash
# 自定义格式
git log --pretty=format:"%h - %an, %ar : %s"

# 常用格式化选项：
# %H  提交的完整哈希值
# %h  提交的简写哈希值
# %an 作者名字
# %ae 作者邮箱
# %ad 作者修订日期
# %ar 作者修订日期，相对格式
# %s  提交说明
# %d  ref 名称

# 美化的图形化显示
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
```

---

## 7. 撤销和回退操作

### 7.1 撤销工作区的修改

```bash
# 撤销工作区的修改（恢复到暂存区状态）
git restore <file>

# 旧版命令
git checkout -- <file>

# 撤销所有工作区修改
git restore .
```

**示例：**
```bash
# 撤销 README.md 的修改
git restore README.md
```

### 7.2 取消暂存

```bash
# 将文件从暂存区移除（但保留工作区修改）
git restore --staged <file>

# 旧版命令
git reset HEAD <file>

# 取消所有暂存
git restore --staged .
```

**示例：**
```bash
# 取消 README.md 的暂存
git restore --staged README.md
```

### 7.3 修改最后一次提交

```bash
# 修改最后一次提交的信息
git commit --amend -m "新的提交信息"

# 添加遗漏的文件到最后一次提交
git add forgotten-file.txt
git commit --amend --no-edit
```

**注意：** 不要修改已经推送到远程的提交！

### 7.4 回退版本

```bash
# 回退到上一个版本（三种模式）

# 1. soft：只移动 HEAD，保留暂存区和工作区
git reset --soft HEAD~1

# 2. mixed（默认）：移动 HEAD，重置暂存区，保留工作区
git reset HEAD~1
git reset --mixed HEAD~1

# 3. hard：移动 HEAD，重置暂存区和工作区（危险！）
git reset --hard HEAD~1

# 回退到指定提交
git reset --hard <commit-hash>
```

**三种模式对比：**

```
                    工作区  暂存区  版本库
--soft               ✓       ✓       ✗
--mixed (默认)       ✓       ✗       ✗
--hard               ✗       ✗       ✗

✓ 保留  ✗ 重置
```

**示例：**
```bash
# 撤销最后一次提交，保留更改在工作区
git reset HEAD~1

# 完全撤销最后一次提交和更改
git reset --hard HEAD~1

# 回退到指定提交
git reset --hard abc1234
```

### 7.5 恢复误删的提交

```bash
# 查看所有操作历史（包括已删除的提交）
git reflog

# 恢复到指定状态
git reset --hard <commit-hash>
```

**示例：**
```bash
# 查看操作历史
git reflog

# 输出示例：
# abc1234 HEAD@{0}: reset: moving to HEAD~1
# def5678 HEAD@{1}: commit: Add feature

# 恢复被删除的提交
git reset --hard def5678
```

### 7.6 删除未跟踪的文件

```bash
# 查看将要删除的文件（预览）
git clean -n
git clean --dry-run

# 删除未跟踪的文件
git clean -f
git clean --force

# 删除未跟踪的文件和目录
git clean -fd

# 删除未跟踪的文件（包括被 .gitignore 忽略的文件）
git clean -fx
```

---

## 8. Stash 暂存工作

### 8.1 什么是 Stash

Stash 用于临时保存当前工作状态，让你可以切换到其他分支工作，之后再恢复。

**使用场景：**
- 需要紧急切换分支修复 bug
- 当前工作未完成，不想提交
- 需要拉取远程更新但有本地修改

### 8.2 暂存当前工作

```bash
# 暂存工作区和暂存区的修改
git stash
git stash save

# 暂存时添加描述信息
git stash save "描述信息"

# 暂存包括未跟踪的文件
git stash -u
git stash --include-untracked

# 暂存所有文件（包括被忽略的文件）
git stash -a
git stash --all
```

### 8.3 查看暂存列表

```bash
# 查看所有暂存
git stash list

# 输出示例：
# stash@{0}: WIP on master: abc1234 Add feature
# stash@{1}: WIP on develop: def5678 Fix bug
```

### 8.4 查看暂存内容

```bash
# 查看最新暂存的内容
git stash show

# 查看详细差异
git stash show -p
git stash show --patch

# 查看指定暂存
git stash show stash@{1}
```

### 8.5 应用暂存

```bash
# 应用最新的暂存（不删除 stash）
git stash apply

# 应用指定的暂存
git stash apply stash@{1}

# 应用最新的暂存并删除
git stash pop

# 应用指定暂存并删除
git stash pop stash@{1}
```

**apply vs pop:**
- `apply`：应用暂存但不删除
- `pop`：应用暂存并删除

### 8.6 删除暂存

```bash
# 删除最新的暂存
git stash drop

# 删除指定暂存
git stash drop stash@{1}

# 清空所有暂存
git stash clear
```

### 8.7 从暂存创建分支

```bash
# 从暂存创建新分支
git stash branch <branch-name>

# 从指定暂存创建分支
git stash branch <branch-name> stash@{1}
```

**完整示例：**
```bash
# 1. 正在 master 分支开发
vim feature.js

# 2. 紧急需要修复 bug，但工作未完成
git stash save "未完成的功能开发"

# 3. 切换到 hotfix 分支
git checkout -b hotfix/urgent-bug

# 4. 修复 bug 并提交
vim bugfix.js
git add .
git commit -m "Fix urgent bug"

# 5. 切换回 master
git checkout master

# 6. 恢复之前的工作
git stash pop
```

---

## 9. 处理合并冲突

### 9.1 什么是合并冲突

当两个分支修改了同一文件的同一部分时，Git 无法自动合并，需要手动解决冲突。

### 9.2 冲突的标记

冲突文件中会包含特殊标记：

```
<<<<<<< HEAD
当前分支的内容
=======
要合并的分支的内容
>>>>>>> branch-name
```

**示例：**
```
<<<<<<< HEAD
function hello() {
    console.log("Hello from master");
}
=======
function hello() {
    console.log("Hello from feature");
}
>>>>>>> feature-branch
```

### 9.3 解决冲突的步骤

1. **查看冲突文件**
```bash
git status
```

2. **手动编辑冲突文件**
   - 删除冲突标记 (`<<<<<<<`, `=======`, `>>>>>>>`)
   - 保留需要的内容
   - 或者合并两边的内容

3. **标记冲突已解决**
```bash
git add <conflicted-file>
```

4. **完成合并**
```bash
git commit -m "Merge branch and resolve conflicts"
```

**完整示例：**
```bash
# 1. 尝试合并
git merge feature-branch

# 输出：
# Auto-merging index.html
# CONFLICT (content): Merge conflict in index.html
# Automatic merge failed; fix conflicts and then commit the result.

# 2. 查看冲突文件
git status

# 3. 编辑文件解决冲突
vim index.html

# 修改前：
# <<<<<<< HEAD
# <h1>Welcome to Master</h1>
# =======
# <h1>Welcome to Feature</h1>
# >>>>>>> feature-branch

# 修改后：
# <h1>Welcome to Our Site</h1>

# 4. 标记为已解决
git add index.html

# 5. 完成合并
git commit -m "Merge feature-branch and resolve conflicts"
```

### 9.4 取消合并

```bash
# 取消合并，恢复到合并前的状态
git merge --abort
```

### 9.5 使用合并工具

```bash
# 使用可视化工具解决冲突
git mergetool

# 配置合并工具（如 VS Code）
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
```

**冲突解决策略：**

```bash
# 使用当前分支的版本
git checkout --ours <file>

# 使用要合并分支的版本
git checkout --theirs <file>

# 然后标记为已解决
git add <file>
```

---

## 10. 标签管理

### 10.1 什么是标签

标签是对某个提交的固定引用，通常用于标记版本发布点。

**两种标签类型：**
1. **轻量标签**：只是某个提交的引用
2. **附注标签**：包含标签信息、日期、作者等（推荐）

### 10.2 查看标签

```bash
# 列出所有标签
git tag

# 列出符合模式的标签
git tag -l "v1.*"
git tag --list "v1.*"

# 查看标签详细信息
git show <tag-name>
```

### 10.3 创建轻量标签

```bash
# 在当前提交创建轻量标签
git tag <tag-name>

# 示例
git tag v1.0.0
```

### 10.4 创建附注标签

```bash
# 创建附注标签
git tag -a <tag-name> -m "标签说明"

# 示例
git tag -a v1.0.0 -m "Release version 1.0.0"

# 不加 -m，会打开编辑器输入说明
git tag -a v1.0.0
```

### 10.5 给历史提交打标签

```bash
# 给指定提交打标签
git tag <tag-name> <commit-hash>

# 示例
git tag v0.9.0 abc1234
git tag -a v0.9.0 abc1234 -m "Beta version"
```

### 10.6 查看标签信息

```bash
# 查看标签详细信息
git show v1.0.0

# 轻量标签输出提交信息
# 附注标签输出标签信息和提交信息
```

### 10.7 推送标签到远程

```bash
# 推送指定标签
git push origin <tag-name>

# 推送所有标签
git push origin --tags

# 示例
git push origin v1.0.0
git push origin --tags
```

### 10.8 删除标签

```bash
# 删除本地标签
git tag -d <tag-name>
git tag --delete <tag-name>

# 删除远程标签
git push origin --delete <tag-name>
git push origin :refs/tags/<tag-name>

# 示例
git tag -d v1.0.0
git push origin --delete v1.0.0
```

### 10.9 检出标签

```bash
# 查看标签对应的代码（处于"分离头指针"状态）
git checkout <tag-name>

# 基于标签创建新分支
git checkout -b <branch-name> <tag-name>

# 示例
git checkout -b version-1.0 v1.0.0
```

**标签命名规范：**
```bash
# 语义化版本号
v1.0.0      # 主版本.次版本.修订号
v2.1.3
v1.0.0-beta # 预发布版本
v1.0.0-rc1  # 候选版本

# 日期标签
release-2024-12-16
```

---

## 11. 常用工作流程

### 11.1 日常开发流程

```bash
# 1. 更新本地代码
git pull

# 2. 创建功能分支
git checkout -b feature/new-feature

# 3. 开发并提交
vim code.js
git add .
git commit -m "Add new feature"

# 4. 推送到远程
git push -u origin feature/new-feature

# 5. 切换回主分支
git checkout master

# 6. 合并功能分支
git merge feature/new-feature

# 7. 推送主分支
git push

# 8. 删除功能分支
git branch -d feature/new-feature
git push origin --delete feature/new-feature
```

### 11.2 功能开发流程

```bash
# 1. 从最新的 develop 分支创建功能分支
git checkout develop
git pull
git checkout -b feature/user-login

# 2. 开发功能
# ... 编码 ...

# 3. 定期提交
git add .
git commit -m "Implement user login form"

# 4. 保持与 develop 同步
git checkout develop
git pull
git checkout feature/user-login
git merge develop

# 5. 功能完成后推送
git push -u origin feature/user-login

# 6. 创建 Pull Request（在 GitHub/GitLab 上）

# 7. 代码审查通过后合并
git checkout develop
git merge feature/user-login

# 8. 清理分支
git branch -d feature/user-login
git push origin --delete feature/user-login
```

### 11.3 Bug 修复流程

```bash
# 1. 从主分支创建 bugfix 分支
git checkout master
git checkout -b bugfix/fix-login-error

# 2. 修复 bug
vim login.js
git add login.js
git commit -m "Fix login validation error"

# 3. 推送并合并
git push -u origin bugfix/fix-login-error

# 4. 合并到主分支
git checkout master
git merge bugfix/fix-login-error
git push

# 5. 如果需要，也合并到 develop
git checkout develop
git merge bugfix/fix-login-error
git push

# 6. 删除 bugfix 分支
git branch -d bugfix/fix-login-error
git push origin --delete bugfix/fix-login-error
```

### 11.4 代码审查流程

```bash
# 1. 获取远程分支
git fetch origin

# 2. 检出要审查的分支
git checkout -b review-feature origin/feature/new-feature

# 3. 查看更改
git log master..review-feature
git diff master review-feature

# 4. 测试代码
# ... 运行测试 ...

# 5. 提出修改意见或批准合并

# 6. 切换回原分支
git checkout master

# 7. 删除审查分支
git branch -d review-feature
```

---

## 12. Git 最佳实践

### 12.1 提交信息规范

**格式：**
```
<type>(<scope>): <subject>

<body>

<footer>
```

**type 类型：**
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式（不影响代码运行）
- `refactor`: 重构
- `test`: 测试相关
- `chore`: 构建过程或辅助工具的变动

**示例：**
```bash
feat(auth): add user login functionality

Implement login form with validation
- Add email/password validation
- Add error handling
- Add loading state

Closes #123
```

**简短提交：**
```bash
git commit -m "fix: resolve login validation error"
git commit -m "feat: add user profile page"
git commit -m "docs: update README with installation steps"
```

### 12.2 分支命名规范

```bash
# 功能分支
feature/user-authentication
feature/shopping-cart
feature/payment-integration

# Bug 修复
bugfix/login-error
bugfix/memory-leak
fix/typo-in-readme

# 热修复
hotfix/security-patch
hotfix/critical-bug

# 发布分支
release/v1.0.0
release/2024-12-16

# 实验性分支
experiment/new-algorithm
poc/new-design
```

### 12.3 其他最佳实践

1. **经常提交**
   - 小步提交，每个提交只做一件事
   - 提交信息要清晰描述做了什么

2. **提交前测试**
   - 确保代码能运行
   - 运行测试确保没有破坏现有功能

3. **不要提交敏感信息**
   - 使用 .gitignore 忽略配置文件
   - 不要提交密码、API 密钥等

4. **保持主分支稳定**
   - master/main 分支应该总是可部署的
   - 在功能分支上开发

5. **使用 Pull Request**
   - 代码审查
   - 讨论和改进
   - 保持代码质量

6. **定期同步**
   - 经常从主分支拉取更新
   - 避免大的合并冲突

7. **有意义的分支名**
   - 分支名应该描述其用途
   - 使用统一的命名规范

---

## 13. 常见问题解决

### 13.1 忘记添加文件到上次提交

```bash
# 添加遗漏的文件
git add forgotten-file.txt

# 修改上次提交（不改变提交信息）
git commit --amend --no-edit
```

### 13.2 提交到了错误的分支

```bash
# 方法1：使用 cherry-pick

# 1. 记下提交的哈希值
git log --oneline -1

# 2. 切换到正确的分支
git checkout correct-branch

# 3. 应用该提交
git cherry-pick <commit-hash>

# 4. 回到错误的分支
git checkout wrong-branch

# 5. 删除错误的提交
git reset --hard HEAD~1
```

```bash
# 方法2：使用 reset 和 stash

# 1. 撤销提交但保留更改
git reset HEAD~1

# 2. 暂存更改
git stash

# 3. 切换到正确的分支
git checkout correct-branch

# 4. 应用更改
git stash pop

# 5. 提交
git commit -m "Correct commit"
```

### 13.3 需要撤销已推送的提交

```bash
# 方法1：使用 revert（推荐，安全）
git revert <commit-hash>
git push

# 方法2：使用 reset（危险，需要强制推送）
git reset --hard <commit-hash>
git push -f origin master
```

**注意：** 强制推送会影响其他协作者，谨慎使用！

### 13.4 误删了分支

```bash
# 1. 查找分支最后的提交
git reflog

# 2. 恢复分支
git checkout -b recovered-branch <commit-hash>
```

---

## 14. Git 命令速查表

### 14.1 配置相关

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --list
```

### 14.2 仓库操作

```bash
git init                           # 初始化仓库
git clone <url>                    # 克隆仓库
git status                         # 查看状态
```

### 14.3 基本操作

```bash
git add <file>                     # 添加文件到暂存区
git add .                          # 添加所有文件
git commit -m "message"            # 提交
git commit -am "message"           # 添加并提交已跟踪文件
```

### 14.4 分支操作

```bash
git branch                         # 查看分支
git branch <name>                  # 创建分支
git checkout <branch>              # 切换分支
git checkout -b <branch>           # 创建并切换分支
git merge <branch>                 # 合并分支
git branch -d <branch>             # 删除分支
```

### 14.5 远程操作

```bash
git remote add origin <url>        # 添加远程仓库
git push -u origin master          # 推送到远程
git pull                           # 拉取并合并
git fetch                          # 拉取不合并
git clone <url>                    # 克隆仓库
```

### 14.6 历史查看

```bash
git log                            # 查看历史
git log --oneline                  # 简洁历史
git log --graph                    # 图形化历史
git show <commit>                  # 查看提交详情
git diff                           # 查看差异
```

### 14.7 撤销操作

```bash
git restore <file>                 # 撤销工作区修改
git restore --staged <file>        # 取消暂存
git reset HEAD~1                   # 撤销提交（保留更改）
git reset --hard HEAD~1            # 撤销提交（丢弃更改）
git revert <commit>                # 创建新提交撤销指定提交
git reflog                         # 查看所有操作历史
```

### 14.8 暂存操作

```bash
git stash                          # 暂存工作
git stash list                     # 查看暂存列表
git stash pop                      # 应用并删除暂存
git stash apply                    # 应用暂存
git stash drop                     # 删除暂存
```

### 14.9 标签操作

```bash
git tag                            # 查看标签
git tag <name>                     # 创建轻量标签
git tag -a <name> -m "msg"         # 创建附注标签
git push origin <tag>              # 推送标签
git push origin --tags             # 推送所有标签
git tag -d <tag>                   # 删除本地标签
```

---

## 15. 进阶主题

### 15.1 Rebase vs Merge

**Merge：**
- 保留完整的提交历史
- 创建合并提交
- 历史记录更复杂

```bash
git checkout master
git merge feature
```

**Rebase：**
- 重写提交历史
- 线性历史记录
- 更清晰的提交历史

```bash
git checkout feature
git rebase master
```

**何时使用：**
- 公共分支用 merge
- 个人分支用 rebase
- 不要 rebase 已推送的提交

### 15.2 Cherry-pick

选择性地应用某个提交到当前分支。

```bash
# 应用指定提交
git cherry-pick <commit-hash>

# 应用多个提交
git cherry-pick <commit1> <commit2>

# 应用提交范围
git cherry-pick <start-commit>..<end-commit>
```

### 15.3 Git Hooks

Git Hooks 是在特定事件发生时自动运行的脚本。

**常用 Hooks：**
- `pre-commit`：提交前运行
- `commit-msg`：提交信息验证
- `pre-push`：推送前运行
- `post-merge`：合并后运行

**位置：** `.git/hooks/`

**示例：pre-commit**
```bash
#!/bin/bash
# .git/hooks/pre-commit

# 运行测试
npm test

# 如果测试失败，阻止提交
if [ $? -ne 0 ]; then
    echo "Tests failed. Commit aborted."
    exit 1
fi
```

### 15.4 子模块（Submodules）

在一个 Git 仓库中包含另一个 Git 仓库。

```bash
# 添加子模块
git submodule add <url> <path>

# 克隆包含子模块的仓库
git clone --recursive <url>

# 初始化子模块
git submodule init
git submodule update

# 更新子模块
git submodule update --remote
```

---

## 16. 学习资源

**官方文档：**
- Git 官方文档：https://git-scm.com/doc
- Pro Git 书籍（免费）：https://git-scm.com/book/zh

**在线教程：**
- GitHub Learning Lab：https://lab.github.com/
- Learn Git Branching：https://learngitbranching.js.org/
- Git 命令参考：https://git-scm.com/docs

**可视化工具：**
- GitKraken：https://www.gitkraken.com/
- SourceTree：https://www.sourcetreeapp.com/
- Git GUI（内置）：`git gui`

**练习平台：**
- Try Git：https://try.github.io/
- Git Immersion：http://gitimmersion.com/

**视频教程：**
- Git and GitHub for Beginners - Crash Course (YouTube)
- Git Tutorial for Beginners (YouTube)

---

## 总结

Git 是一个强大的版本控制系统，掌握它需要：

1. **理解基本概念**：工作区、暂存区、版本库
2. **掌握基本命令**：add, commit, push, pull
3. **熟练分支操作**：创建、合并、删除分支
4. **学会处理问题**：冲突解决、版本回退
5. **遵循最佳实践**：规范的提交信息、合理的分支策略

**学习路径：**
```
基础配置 → 基本操作 → 分支管理 → 远程协作 → 高级技巧
```

记住：**多练习，多使用，在实践中掌握 Git！**

---

**文档版本：** v1.0.0
**最后更新：** 2025-12-16
**作者：** ysxy
