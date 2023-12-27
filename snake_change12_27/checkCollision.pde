// 檢查座標是否與障礙物、星星和蛇的身體碰撞
boolean checkCollision(int checkX, int checkY) {
  // 檢查是否與障礙物碰撞
  for (int i = 0; i < obstacles.size(); i++) {
    int obstacleX = obstacles.get(i)[0];
    int obstacleY = obstacles.get(i)[1];
    if (checkX == obstacleX && checkY == obstacleY) {
      return true;
    }
  }

  // 檢查是否與星星碰撞
  if (starExists && checkX == starX && checkY == starY) {
    return true;
  }

  // 檢查是否與蛇的身體碰撞
  for (int i = 0; i < snakeLength; i++) {
    if (checkX == x[i] && checkY == y[i]) {
      return true;
    }
  }

  return false;
}
