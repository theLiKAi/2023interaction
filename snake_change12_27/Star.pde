void drawStar() {
  // 星星的颜色
  if (starExists) {
    fill(#FFAA0A); // 設定星星的顏色，這裡使用黃色
    rect(starX, starY, w, h);
  }

  // 標記星星存在

  starKey=true;
}

void generateRandomStar() {
  boolean starGenerated = false;

  // 生成星星的隨機坐標，直到生成在蛇的五格內
  while (!starGenerated) {
    starX = int(random(1, 570 / w - 1)) * w;
    starY = int(random(1, 570 / h - 1)) * h;

    // 檢查星星是否在蛇的五格內
    boolean insideSnake = false;
    for (int i = 0; i < snakeLength; i++) {
      if (starX == x[i] && starY == y[i]) {
        insideSnake = true;
        break;
      }
    }

    // 如果星星不在蛇的五格內，標記星星已生成
    if (!insideSnake) {
      starGenerated = true;
    }
  }

  // 標記星星存在
  starExists = true;
}
