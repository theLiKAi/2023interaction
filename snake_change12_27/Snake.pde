// 蛇初始化參數
void snakeInit() {
  snakeLength = 1;
  gameOverKey = false;
  snakeHeadX = int(random(1, 570 / w - 1)) * w;
  snakeHeadY = int(random(1, 570 / h - 1)) * h;
  snakeDirection='A';
}

// 畫蛇
void drawSnake() {
  // 重新設定蛇的座標
  // 從蛇尾開始更新
  for (int i=snakeLength-1; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  // 設定蛇頭新的座標
  y[0] = snakeHeadY;
  x[0] = snakeHeadX;

  // 開始畫蛇
  for (int i = 0; i < snakeLength; i++) {
    if (i == 0) {
      fill(#4100F7);
    } else {
      fill(#6C4CC6);
    }
    rect(x[i], y[i], w, h);
  }
}

//蛇移動
void snakemove()
{
// 當方向鍵被按下時
        if (keyPressed && key == CODED) {
          switch(keyCode) {
          case LEFT:
            if (snakeDirection != 'R') {
              snakeDirection = 'L';
            }
            break;
          case RIGHT:
            if (snakeDirection != 'L') {
              snakeDirection = 'R';
            }
            break;
          case DOWN:
            if (snakeDirection != 'U') {
              snakeDirection = 'D';
            }
            break;
          case UP:
            if (snakeDirection != 'D') {
              snakeDirection = 'U';
            }
            break;
          }
        }

        // 依照上面方向鍵按下時所得到的方向，控制蛇頭的方向
        switch(snakeDirection) {
        case 'L':
          snakeHeadX -= w;
          break;
        case 'R':
          snakeHeadX += w;
          break;
        case 'D':
          snakeHeadY += w;
          break;
        case 'U':
          snakeHeadY -= w;
          break;
        }
        drawSnake();
}
