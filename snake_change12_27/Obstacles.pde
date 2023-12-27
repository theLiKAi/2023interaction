void generateRandomObstacles() {
  // 產生障礙物的隨機座標
  int obstacleX = int(random(1, 570 / w - 1)) * w;
  int obstacleY = int(random(1, 570 / h - 1)) * h;

  // 檢查障礙物位置是否有效
  boolean isValid = checkObstacleValidity(obstacleX, obstacleY);

  // 如果位置無效，重新產生座標
  while (!isValid) {
    obstacleX = int(random(1, 570 / w - 1)) * w;
    obstacleY = int(random(1, 570 / h - 1)) * h;
    isValid = checkObstacleValidity(obstacleX, obstacleY);
  }

  // 加入有效的障礙物座標到清單中
  int[] obstacle = {obstacleX, obstacleY};
  obstacles.add(obstacle);
  Obstacles++;
}

void generateS5Obstacles1() {
  // 產生障礙物的隨機座標
  int obstacleX = int (510);
  int obstacleY = int (285);

  // 加入有效的障礙物座標到清單中
  int[] obstacle = {obstacleX, obstacleY};
  obstacles.add(obstacle);
  Obstacles++;
}
void generateS5Obstacles2() {
  // 產生障礙物的隨機座標
  int obstacleX = int (510);
  int obstacleY = int (300);

  // 加入有效的障礙物座標到清單中
  int[] obstacle = {obstacleX, obstacleY};
  obstacles.add(obstacle);
  Obstacles++;
}

boolean checkObstacleValidity(int obstacleX, int obstacleY) {
  // 檢查障礙物是否與蛇頭發生碰撞
  if (obstacleX == snakeHeadX && obstacleY == snakeHeadY) {
    return false;
  }
  // 檢查障礙物是否在蛇的5個單位內
  for (int i = 0; i < snakeLength; i++) {
    float distance = dist(obstacleX, obstacleY, x[i], y[i]);
    if (distance < 5 * w) {
      return false;
    }
  }

  return true;
}


void drawObstacles() {
  fill(#333333); // 障礙物的顏色，可以根據需要更改
  for (int i = 0; i < obstacles.size(); i++) {
    int obstacleX = obstacles.get(i)[0];
    int obstacleY = obstacles.get(i)[1];
    rect(obstacleX, obstacleY, w, h);
  }
}


boolean checkObstacleCollision() {
  for (int i = 0; i < obstacles.size(); i++) {
    int obstacleX = obstacles.get(i)[0];
    int obstacleY = obstacles.get(i)[1];
    if (snakeHeadX == obstacleX && snakeHeadY == obstacleY) {
      return true; // 蛇頭碰到障礙物，遊戲結束
    }
  }
  return false; // 沒有碰到障礙物
}

void convertObstacleToFood() {
  // 清空障礙物列表
  obstacles.clear();
  foodKey = false;
  starExists = false;
  starKey=false;
}
