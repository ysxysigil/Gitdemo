// 游戏配置
const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// 游戏状态
let gameRunning = false;
let score = 0;
let highScore = localStorage.getItem('highScore') || 0;
let animationId;

// 玩家对象
const player = {
    x: 50,
    y: 300,
    width: 40,
    height: 40,
    velocityY: 0,
    gravity: 0.6,
    jumpPower: -12,
    isJumping: false,
    color: '#667eea'
};

// 障碍物数组
let obstacles = [];
let obstacleTimer = 0;
const obstacleInterval = 120; // 每120帧生成一个障碍物

// 地面高度
const groundHeight = 350;

// 初始化游戏
function init() {
    document.getElementById('highScore').textContent = highScore;

    // 开始按钮
    document.getElementById('startBtn').addEventListener('click', startGame);

    // 重新开始按钮
    document.getElementById('restartBtn').addEventListener('click', () => {
        document.getElementById('gameOver').classList.remove('show');
        startGame();
    });

    // 键盘控制
    document.addEventListener('keydown', (e) => {
        if (e.code === 'Space' && gameRunning) {
            e.preventDefault();
            jump();
        }
    });

    // 触摸/点击控制
    canvas.addEventListener('click', () => {
        if (gameRunning) {
            jump();
        }
    });

    // 绘制初始画面
    drawInitialScreen();
}

// 绘制初始画面
function drawInitialScreen() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // 绘制地面
    drawGround();

    // 绘制玩家
    drawPlayer();

    // 绘制提示文字
    ctx.fillStyle = '#333';
    ctx.font = 'bold 30px Arial';
    ctx.textAlign = 'center';
    ctx.fillText('点击"开始游戏"开始', canvas.width / 2, canvas.height / 2);
}

// 开始游戏
function startGame() {
    gameRunning = true;
    score = 0;
    obstacles = [];
    obstacleTimer = 0;
    player.y = 300;
    player.velocityY = 0;
    player.isJumping = false;

    document.getElementById('score').textContent = score;
    document.getElementById('startBtn').disabled = true;

    gameLoop();
}

// 跳跃
function jump() {
    if (!player.isJumping) {
        player.velocityY = player.jumpPower;
        player.isJumping = true;
    }
}

// 游戏主循环
function gameLoop() {
    if (!gameRunning) return;

    // 清空画布
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // 更新玩家
    updatePlayer();

    // 更新障碍物
    updateObstacles();

    // 绘制游戏元素
    drawGround();
    drawPlayer();
    drawObstacles();

    // 碰撞检测
    checkCollisions();

    // 更新分数
    score++;
    document.getElementById('score').textContent = Math.floor(score / 10);

    // 继续游戏循环
    animationId = requestAnimationFrame(gameLoop);
}

// 更新玩家
function updatePlayer() {
    // 应用重力
    player.velocityY += player.gravity;
    player.y += player.velocityY;

    // 地面碰撞
    if (player.y + player.height >= groundHeight) {
        player.y = groundHeight - player.height;
        player.velocityY = 0;
        player.isJumping = false;
    }
}

// 绘制玩家
function drawPlayer() {
    // 玩家身体
    ctx.fillStyle = player.color;
    ctx.fillRect(player.x, player.y, player.width, player.height);

    // 玩家眼睛
    ctx.fillStyle = 'white';
    ctx.fillRect(player.x + 10, player.y + 10, 8, 8);
    ctx.fillRect(player.x + 22, player.y + 10, 8, 8);

    // 瞳孔
    ctx.fillStyle = 'black';
    ctx.fillRect(player.x + 13, player.y + 13, 3, 3);
    ctx.fillRect(player.x + 25, player.y + 13, 3, 3);

    // 嘴巴
    ctx.strokeStyle = 'white';
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.arc(player.x + 20, player.y + 25, 8, 0, Math.PI);
    ctx.stroke();
}

// 更新障碍物
function updateObstacles() {
    obstacleTimer++;

    // 生成新障碍物
    if (obstacleTimer >= obstacleInterval) {
        const height = Math.random() * 80 + 40; // 随机高度 40-120
        obstacles.push({
            x: canvas.width,
            y: groundHeight - height,
            width: 30,
            height: height,
            color: '#764ba2'
        });
        obstacleTimer = 0;
    }

    // 移动障碍物
    obstacles.forEach((obstacle, index) => {
        obstacle.x -= 5; // 障碍物移动速度

        // 移出屏幕的障碍物删除
        if (obstacle.x + obstacle.width < 0) {
            obstacles.splice(index, 1);
        }
    });
}

// 绘制障碍物
function drawObstacles() {
    obstacles.forEach(obstacle => {
        // 障碍物主体
        ctx.fillStyle = obstacle.color;
        ctx.fillRect(obstacle.x, obstacle.y, obstacle.width, obstacle.height);

        // 障碍物边框
        ctx.strokeStyle = '#5a3a7d';
        ctx.lineWidth = 2;
        ctx.strokeRect(obstacle.x, obstacle.y, obstacle.width, obstacle.height);

        // 添加纹理
        ctx.fillStyle = 'rgba(255, 255, 255, 0.1)';
        for (let i = 0; i < obstacle.height; i += 10) {
            ctx.fillRect(obstacle.x + 5, obstacle.y + i, 20, 5);
        }
    });
}

// 绘制地面
function drawGround() {
    // 地面
    ctx.fillStyle = '#8B7355';
    ctx.fillRect(0, groundHeight, canvas.width, canvas.height - groundHeight);

    // 草地
    ctx.fillStyle = '#7CB342';
    ctx.fillRect(0, groundHeight, canvas.width, 5);

    // 地面纹理
    ctx.fillStyle = '#6B5345';
    for (let x = 0; x < canvas.width; x += 20) {
        ctx.fillRect(x, groundHeight + 10, 10, 5);
        ctx.fillRect(x + 10, groundHeight + 20, 10, 5);
    }
}

// 碰撞检测
function checkCollisions() {
    obstacles.forEach(obstacle => {
        if (
            player.x < obstacle.x + obstacle.width &&
            player.x + player.width > obstacle.x &&
            player.y < obstacle.y + obstacle.height &&
            player.y + player.height > obstacle.y
        ) {
            gameOver();
        }
    });
}

// 游戏结束
function gameOver() {
    gameRunning = false;
    cancelAnimationFrame(animationId);

    const finalScore = Math.floor(score / 10);

    // 更新最高分
    if (finalScore > highScore) {
        highScore = finalScore;
        localStorage.setItem('highScore', highScore);
        document.getElementById('highScore').textContent = highScore;
    }

    // 显示游戏结束界面
    document.getElementById('finalScore').textContent = finalScore;
    document.getElementById('gameOver').classList.add('show');
    document.getElementById('startBtn').disabled = false;
}

// 初始化游戏
init();
