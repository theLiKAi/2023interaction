void spawnapple() {
  // 在畫布上的隨機位置生成食物，並確保食物在地面上
  appleX = width+int(random(500,3000));
  appleY = groundLevel - appleSize+10;
 if(Time<53) appleSpeed = (random(3,8));
 if(stage==13)
 {
  if(Time>53)  appleSpeed = 0;
 }
}

void jump() {
  if (!jumping) {
    snakeSpeedY = -15; // 跳躍的力量
    jumping = true;
    
  }
}

void jumpGame()
{
   // 檢查是否通過障礙物
  if (obstacleX + obstacleWidth < snakeX && !obstaclePassed) {
    obstaclePassed = true;
    obstaclePassed1++;
  }
  if (highObstacleX + highObstacleWidth < snakeX && !highObstaclePassed) {
    highObstaclePassed = true;
    highObstaclePassed1++;
  }
  
  // 檢查是否碰到食物
  if (dist(snakeX + 15, snakeY + 15, appleX, appleY) < 15) {
    // 蛇吃到了食物
    score++;
    snakeLength++;
    spawnapple(); // 生成新的食物
  }

  // 移動蛇的身體
  for (int i = snakeLength - 1; i > 0; i--) {
    snakeBodyX[i] = snakeBodyX[i - 1];
    snakeBodyY[i] = snakeBodyY[i - 1];
  }
  
  // 更新蛇頭的位置
  snakeBodyX[0] = int(snakeX);
  snakeBodyY[0] = int(snakeY);
  
  // 更新蛇身體的X座標
  for (int i = 1; i < snakeLength; i++) {
    snakeBodyX[i] -= 30; // 假設蛇是向右移動的
  }
  
  // 繪製蛇的身體
  fill(#4100F7);
  for (int i = 0; i < snakeLength; i++) {
    if (i == 0) {
      fill(#4100F7);
      rect(snakeBodyX[i], snakeBodyY[i], 30, 30);
    } else {
      fill(#6C4CC6);
      rect(snakeBodyX[i], snakeBodyY[i]+5, 30, 25);
    }
    
  }
  // 更新障礙物的位置
  if(Time>5) obstacleX -= obstacleSpeed;  
  if(Time>40)highObstacleX -=highObstacleSpeed ;
  if(highObstaclePassed1==8)  highObstacleSpeed=10;
  if (obstacleX + obstacleWidth < 0) {
    obstacleX = width+int(random(0,300));
    obstaclePassed = false;
    if(Time<40) obstacleSpeed=int(random(5,8));
    if(stage==13)
    {
    if(Time>53) obstacleSpeed = 0;    
    if(Time>40&&Time<53) obstacleSpeed=6;
    }
  }
  if (highObstacleX + highObstacleWidth < 0) {
    highObstacleX = width +int(random(500,1000)); // 更高障礙物超出畫面時重設位置
    highObstaclePassed = false;
    if(stage==13)
    {
    if(Time>53) highObstacleSpeed = 0;
    }
  }
  if (highObstacleX + highObstacleWidth < obstacleX + obstacleWidth+150) {
    obstacleSpeed = highObstacleSpeed;
  }
  // 更新食物的位置（以相似的速度移動）
  appleX -= appleSpeed;
  //EyeX -= EyeSpeed;
  // 檢查食物是否超出畫面
  if (appleX + appleSize < 0) {
    spawnapple(); // 生成新的食物
  }
  
  // 檢查是否在跳躍
  if (jumping) {
  
    snakeY += snakeSpeedY;
    snakeSpeedY += 1; // 重力
    if (snakeY >= groundLevel-30) {
      snakeY = groundLevel-30;
      jumping = false; 
    }
  }
}
