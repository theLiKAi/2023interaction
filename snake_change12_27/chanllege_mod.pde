  
  void chanllege_mod()
  {
      PImage C_btn3U = btn3.get(157, 192, 287, 81);
      PImage C_btn3M = btn3.get(152, 383, 287, 81);
      PImage C_btn3D = btn3.get(152, 574, 287, 81);
      PImage C_btn4U = btn4.get(157, 192, 287, 81);
      PImage C_btn4M = btn4.get(152, 383, 287, 81);
      PImage C_btn4D = btn4.get(152, 574, 287, 81);
      PImage C_btn3B = btn3.get(26, 739, 120, 42);
      PImage C_btn4B = btn4.get(26, 739, 120, 42);
    if (chanllege_mode==1)
  {
     image(chanllege, 0, 0);
    image(C_btn3U,157, 192);
    image(C_btn3M, 152, 383);
    image(C_btn3D, 152, 574);
    if (S_button3( btn3X, btn3Y, btn3W, btn3H)) {
      image(C_btn4U, 157, 192); // 滑鼠在按鈕範圍內，改變按鈕顏色
      image(chanllege1, 190,270);
      chanllege1.play();
    } else {
      image(C_btn3U, 157, 192);
    }
    if (S_button4( btn4X, btn4Y, btn4W, btn4H)) {
      image(C_btn4M, 152, 383); // 滑鼠在按鈕範圍內，改變按鈕顏色
      image(chanllege2, 205,350);
      chanllege2.play();
    } else {
      image(C_btn3M, 152, 383);
    }
    if (S_button5( btn5X, btn5Y, btn5W, btn5H)) {
      image(C_btn4D, 152, 574); // 滑鼠在按鈕範圍內，改變按鈕顏色
      image(chanllege3, 175,650);
      chanllege3.play();
    } else {
      image(C_btn3D, 152, 574);
    }
    if (S_button6( btn6X, btn6Y, btn6W, btn6H)) {
      image(C_btn4B, 26, 739); // 滑鼠在按鈕範圍內，改變按鈕顏色
    } else {
      image(C_btn3B, 26, 739);
    }
  } 
   if (chanllege_mode==2)
  {
    frameRate(12);
    listenGameOver();
    if (gameStarted) {
      


      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(backgroundColor);
        noStroke();
        snakemove();
      }

      fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(#DB6A28);
      rect(-10, 0, 700, 15);
      rect(-10, 585, 700, 15);
      rect(0, 0, 15, 600);
      rect(585, 0, 15, 600);
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("score:"+score, 90, 650);
      text("difficulty:"+stone, 125, 725);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      drawFood(570, 570);


      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      if ( snakeHeadX == foodX && snakeHeadY == foodY ) {
        snakeLength++;
        score++;
        frameRate(frame+(score/5));
        if (score > bestScore) {
          bestScore = score; // 更新史上最佳成績
        }
        foodKey = true;
        // 隨機產生障礙物
        generateRandomObstacles();

        if (score==7) {
          second=1;
          generateRandomStar();
          stone=99;
        }
        if (score>7) {
          generateRandomObstacles();
          stone=2;
        }
        if (score==20) {
          generateRandomStar();
        }
        if (score>20) {
          generateRandomObstacles();
          stone=3;
        }
        if (score==50) {
          generateRandomStar();
        }
        if (score>50) {
          generateRandomObstacles();
          stone=4;
        }
        if (score==70) {
          generateRandomStar();
        }
        if (score>70) {
          generateRandomObstacles();
          stone=5;
        }
        if (score==85) {
          generateRandomStar();
        }
        if (score==100) {
          generateRandomStar();
        }
      } else if (snakeHeadX == starX && snakeHeadY == starY) {
        // 吃到星星時，將障礙物變成食物
        convertObstacleToFood();
        starX=1000;
        starY=1000;
      }
    }
    if (second==1)
    {
      snakeMoving = false;
      generateRandomObstacles();
      frameRate(20);
      textSize(80);
      textAlign(CENTER, CENTER);
      text("EAT ORANGE!!", 300, 300);
    }
    if (Obstacles==90)
    {
      second++;
      snakeMoving = true;
      frameRate(frame+(score/5));
    }
  }
  
   else if (chanllege_mode==3)
  {
    frameRate(12);
    noStroke();
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(backgroundColor);
        
        // 當方向鍵被按下時
        snakemove();
        }
      

      state2();
      // 畫一個道具
      // @600, @600 是指畫布的寬高
     
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了道具
      eatItem();
      //障礙物
     generateS5Obstacles1();
      generateS5Obstacles2();
      //要打的字
      //打完字消除障礙物
      if (ID==9) {
        obstacles.clear();
        Obstacles=0;
      }
    }
  }
    else if (chanllege_mode==4)
  {
      background(0);
      frameRate(60);
   listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie3() ) {
        return;
      }
  image(beta1,beta1X,-500 );
  beta1X--;
  image(beta2,beta2X,-520 );
  beta2X--;
  if(beta1X<=-2000) beta1X=3000;
  if(beta2X<=-2000) beta2X=3000;
   state3();
  jumpGame();
  
  stroke(0);
  strokeWeight(2);
}
  }
  }
  
