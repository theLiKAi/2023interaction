// 出現遊戲結束後的畫面，要監聽處理的事情
void listenGameOver() {
  if ( gameOverKey && keyPressed && (key == 'r' || key == 'R') ) {
    gameStarted=false;
    stage=0;
    chanllege_mode=0;
    cursor();
    obstacles.clear();
    snakeInit();
    score=0;
    foodKey = true;
    Obstacles=0;
    second=0;
    stone=1;
    starExists = false;
    kg=0;
    rego=6;
    itemX=510;
    itemY=285;
    typing="the snake";
    typed="";
    ID = 0;
    w=15;h=15;
    eatItem=false;
    snakeMoving=true;
   message = "the EXIT is a lie";
   currentLength1 = 0;
   error1 ="kg:";
   currentLength2 = 0;
  error2 ="difficulty:";
   currentLength3 = 0;
   error3 ="暫停時間:";
  currentLength4 = 0;
     error4 ="暫停次數:";
  currentLength5 = 0;
   currentLength6 = 0;
    obstacleX = 600;
  highObstacleX =600;
  backX=600;
  }
}

// 顯示遊戲結束畫面
void showGameOver() {
  // 將目前的座標矩陣壓入堆疊
  pushMatrix();

  gameOverKey = true;

  // 黑底背景
  background(0);

  // 移動畫布的中心
  translate(600/2, 600/2 - 50);

  // 設定填滿顏色為白色
  fill(255);

  // 設定文字的位置為居中
  // 居中是根據畫布的y軸居中了，所以我們上面 translate 了畫布向右一半的寬度
  textAlign(CENTER);

  // 設定文字的大小
  textSize(84);

  // 設定文字內容
  text(score + " / " + bestScore, 0, 0);

  fill(120);
  textSize(18);
  text("score / best", 0, 230);
  text("Game over, press 'R' to restart.", 0, 260);

  // 恢復這個矩陣
  // translate 失效，畫布的起點又回到左上角
  popMatrix();
}
