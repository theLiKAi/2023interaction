// 因為音樂所以啟動很慢大概啟動時間30秒
import gifAnimation.*;


int startTime;  // 計時器開始時間
int elapsedTime;  // 過去的時間
int Time;//計算現在
int rego=6;//可暫停五次
//場景
int stage=0;

// 蛇每個格子的寬高長度
int w = 15;
int h = 15;

// 蛇的初始身長
int snakeLength = 1;
int score = 0;
int frame= 12;
// 蛇頭的座標
int snakeHeadX;
int snakeHeadY;

// 蛇運動的方向。 預設向右
char snakeDirection ;

// 蛇最大身長。
int maxSnakeLength = 500;

// 提前申請蛇身上每一節座標的記憶體空間
int[] x = new int[maxSnakeLength];
int[] y = new int[maxSnakeLength];

// 食物是否被吃了的狀態碼
// 一開始就假設被吃了一個，是為了可以呼叫隨機產生食物的方法
boolean foodKey = true;
boolean gameStarted = false; // 用於追蹤遊戲是否已經開始
boolean snakeMoving = true;

// 食物座標
int foodX;
int foodY;
int Obstacles;

int starX;
int starY;
boolean starKey = true;
// 在 setup() 函數中加入以下行來初始化 starExists
boolean starExists = false;
int backgroundColor = 255;
boolean shouldConvertObstacleToFood = false;

// 儲存玩家最佳成績。 當然就是蛇的長度
int bestScore = 0;
int second=0;

// 判斷遊戲是否結束的狀態值。
boolean gameOverKey = false;
ArrayList<int[]> obstacles = new ArrayList<int[]>(); // 儲存障礙物座標的列表
int stone=1;

float kg=0.0;

//道具
int itemX=500;
int itemY=285;
boolean eatItem = false;

//按鈕
int rectX, rectY;
color rectColor, rectHighlight, baseColor;
color currentColor;
boolean rectOver = false;
//按鈕2
int rectXButton, rectYButton;

color rectColorButton, rectHighlightButton;
boolean rectOverButton = false;
//字體
PFont chineseFont;

//圖片
PImage btn1;
PImage btn2;

//GIF
Gif start;
//btn1
int btn1X = 156; // 按鈕的X座標
int btn1Y = 382; // 按鈕的Y座標
int btn1W = 287; // 按鈕的寬度
int btn1H = 90; // 按鈕的高度
//btn2
int btn2X = 156; // 按鈕的X座標
int btn2Y = 544; // 按鈕的Y座標
int btn2W = 287; // 按鈕的寬度
int btn2H = 90; // 按鈕的高度

boolean S1_button=false;
boolean S2_button=false;


// 初始化
void setup() {

  size(600, 800);
  chineseFont = createFont("微軟正黑體", 16, true);
  textFont(chineseFont);
  frameRate(60);
  // 禁止畫外邊線。 這樣畫長方形時，就不會描邊。
  noStroke();
  noSmooth();
  //圖片
  btn1 = loadImage("start_btn1.png");
  btn2 = loadImage("start_btn2.png");
  //蛇的初始位置
  snakeHeadX = int(random(1, 570 / w - 1)) * w;
  snakeHeadY = int(random(1, 570 / h - 1)) * h;
  //按鈕
  rectX = 182;
  rectY = 400;
  //按鈕2
  rectXButton = 182;
  rectYButton = 550;
  // 載入GIF文件
  start = new Gif(this, "start.gif");
  start.play();

  startTime = millis();  // 初始化計時器
}


void draw() {
  //開始按鈕
  PImage P_btn1U = btn1.get(156, 382, 287, 90);
  PImage P_btn2U = btn2.get(156, 382, 287, 90);
  PImage P_btn1D = btn1.get(156, 544, 287, 90);
  PImage P_btn2D = btn2.get(156, 544, 287, 90);

  // 計算經過的時間
  elapsedTime = millis() - startTime;
  Time=elapsedTime/1000;
  if (stage==0)
  {
    image(start, 0, 0);
    image(P_btn1U, 156, 382);
    image(P_btn1D, 156, 544);
    if (S_button1( btn1X, btn1Y, btn1W, btn1H)) {
      image(P_btn2U, 156, 382); // 滑鼠在按鈕範圍內，改變按鈕顏色
    } else {
      image(P_btn1U, 156, 382);
    }
    if (S_button2( btn2X, btn2Y, btn2W, btn2H)) {
      image(P_btn2D, 156, 544); // 滑鼠在按鈕範圍內，改變按鈕顏色
    } else {
      image(P_btn1D, 156, 544);
    }
  } 
  
  else if ( stage==2)
  {

    image(P_btn2U, 156, 382);
    image(P_btn1D, 156, 544);
    stage=3;
    }
    
    else if (stage==3)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
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
      text("kg:"+kg, 90, 650);
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
        kg=kg+0.1000;
        kg = round(kg * 10) / 10.0; // 四捨五入到一位小數
        frameRate(12);
        if (score > bestScore) {
          bestScore = score; // 更新史上最佳成績
        }
        foodKey = true;
      }
      stage1Clear();
    }
}
   else if (stage==4)
  {

    frameRate(60);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
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
      fill(0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 280);
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("kg:"+kg, 90, 650);
      text("difficulty:"+stone, 125, 725);
      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了道具
      if ( snakeHeadX >=485 && snakeHeadX <=500 && snakeHeadY >=285 && snakeHeadY <=300) {
        itemX=1000;
        itemY=1000;
        kg=kg+0.1000;
        kg = round(kg * 10) / 10.0; // 四捨五入到一位小數
        eatItem =true;
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("暫停時間:"+Time, 400, 650);
      text("暫停次數:" +(rego-1), 400, 725);
      }
      stage2Clear();
    }
  }
 
  else if (stage==5)
  {
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(backgroundColor);
        noStroke();

        // 當方向鍵被按下時
        snakemove();
        }
      

      fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 280);
      //打字
      fill(0);
      textSize(30);
      //要打的字
      text(typing, 400, 100);

      /*fill(255,0,0);
       if(ID< typing.length()) text(typed+typing.charAt(ID),400,150);
       */
      fill(0);
      text(typed, 400, 150);
      //下面數值
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      text("暫停時間:"+Time, 400, 650);
      text("暫停次數:" +(rego-1), 400, 725);
      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
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
      if (ID==8) {
        obstacles.clear();
        Obstacles=0;
      }
      stage3Clear();
    }
  }
  else if (stage==6)
  {
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
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
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 280);
      //打字
      fill(0);
      textSize(30);
      //要打的字
      text(typing, 400, 100);

      /*fill(255,0,0);
       if(ID< typing.length()) text(typed+typing.charAt(ID),400,150);
       */
      fill(0);
      text(typed, 400, 150);
      //下面數值
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      text("暫停時間:"+Time, 400, 650);
      text("暫停次數:" +(rego-1), 400, 725);
      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
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
      if (ID==2) {
        obstacles.clear();
        Obstacles=0;
      }
      stage4Clear();
    }
  }
    else if (stage==7)
  {
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
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
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 280);
      //打字
      fill(0);
      textSize(30);
      //要打的字
      text(typing, 400, 100);

      /*fill(255,0,0);
       if(ID< typing.length()) text(typed+typing.charAt(ID),400,150);
       */
      fill(0);
      text(typed, 400, 150);
      //下面數值
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      text("暫停時間:"+Time, 400, 650);
      text("暫停次數:" +(rego-1), 400, 725);
      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
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
      if (ID==11) {
        obstacles.clear();
        Obstacles=0;
      }
      stage5Clear();
    }
  }
   else if (stage==8)
  {
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie2() ) {
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
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 280);
      //打字
      fill(0);
      textSize(30);
      //要打的字
      text(typing, 400, 100);

      /*fill(255,0,0);
       if(ID< typing.length()) text(typed+typing.charAt(ID),400,150);
       */
      fill(0);
      text(typed, 400, 150);
      //下面數值
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      text("暫停時間:"+Time, 400, 650);
      text("暫停次數:" +(rego-1), 400, 725);
      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
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
      if (ID==15) {
        obstacles.clear();
        Obstacles=0;
      }
      stage6Clear();
    }
  }
  // 繪製按鈕
  /*if (rectOver) {
   fill(rectHighlight);
   } else {
   fill(rectColor);
   }
   stroke(255);
   rect(rectX, rectY, 250, 90 );
   // 按鈕上的字
   fill(255);
   textAlign(CENTER, CENTER);
   textSize(48);
   text("劇情模式", rectX + 250/2, rectY + 90/2);
   //按鈕2
   if (rectOverButton) {
   fill(rectHighlightButton);
   } else {
   fill(rectColorButton);
   }
   rect(rectXButton, rectYButton, 250, 90);
   fill(255);
   textAlign(CENTER, CENTER);
   textSize(48);
   text("挑戰模式", rectXButton + 250/2, rectYButton + 90/2);
   }
   else if( stage==2)
   {
   fill(rectHighlight);
   stroke(255);
   rect(rectX, rectY, 250, 90 );
   // 按鈕上的字
   fill(255);
   textAlign(CENTER, CENTER);
   textSize(48);
   text("劇情模式", rectX + 250/2, rectY + 90/2);
   //按鈕2
   fill(rectColorButton);
   rect(rectXButton, rectYButton, 250, 90);
   // Button text for the square button
   fill(255);
   textAlign(CENTER, CENTER);
   textSize(48);
   text("挑戰模式", rectXButton + 250/2, rectYButton + 90/2);
   }
   */

//挑戰模式

  else if (stage==1)
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
}//end draw


void mousePressed() {
  // 檢查滑鼠是否點擊了按鈕
  if (stage==0)
  {
    if (S_button1( btn1X, btn1Y, btn1W, btn1H)) {
      currentColor = rectColor;
      stage=2;
      noCursor();
      snakeHeadX = 300;
      snakeHeadY = 300;
    }
    if (S_button2( btn2X, btn2Y, btn2W, btn2H)) {
      currentColor = rectColor;
      stage=1;
      if (stage==1) {
        gameStarted = true; // 遊戲開始
        // 初始化遊戲狀態，生成蛇和食物等
        noCursor();
      }
    }
  }
}

boolean S_button1(int btn1X, int btn1Y, int btn1W, int btn1H)
{
  if (mouseX > btn1X && mouseX < btn1X + btn1W &&
    mouseY > btn1Y && mouseY < btn1Y + btn1H) {
    return true;
  } else {
    return false;
  }
}
boolean S_button2(int btn2X, int btn2Y, int btn2W, int btn2H)
{
  if (mouseX > btn2X && mouseX < btn2X + btn2W &&
    mouseY > btn2Y && mouseY < btn2Y + btn2H) {
    return true;
  } else {
    return false;
  }
}


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

// 畫個食物
void drawFood(int maxWidth, int maxHeight) {
  // 食物的顏色
  fill(#ED1818);

  // 如果被吃了，就再隨機生產一個
  if (foodKey) {
    // 產生隨機座標，直到它不在障礙物、星星和蛇的身體上
    do {
      foodX = int(random(2, maxWidth / w - 3)) * w;
      foodY = int(random(2, maxHeight / h - 3)) * h;
    } while (checkCollision(foodX, foodY));
  }

  rect(foodX, foodY, w, h);
  foodKey = false;
}

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


void drawItem()
{
  // 食物的顏色
  fill(#0DD86D);

  // 如果被吃了，就再隨機生產一個
  if (foodKey) {
    // 產生隨機座標，直到它不在障礙物、星星和蛇的身體上
  }

  rect(itemX, itemY, w, 30);
  foodKey = false;
}




// 出現遊戲結束後的畫面，要監聽處理的事情
void listenGameOver() {
  if ( gameOverKey && keyPressed && (key == 'r' || key == 'R') ) {
    gameStarted=false;
    stage=0;
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



void stage1Clear()
{
  if (kg>=0.1)
  {
    if (snakeHeadX>=570 && snakeHeadY>=275&&snakeHeadY<310)
    {
      stage=4;
      snakeHeadX=-15;
      if (snakeHeadY>=275&&snakeHeadY<300)
      {
        snakeHeadY=285;
      } else if (snakeHeadY>=300&&snakeHeadY<310) snakeHeadY=300;
    }
    //item
    fill(255);
    rect(585, 285, 15, 30);
  }
}

void stage2Clear()
{
  if (snakeHeadX>=600 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=5;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;
  }
}

void stage3Clear()
{
  if (snakeHeadX>=600 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=6;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==8)
    {
      typing="me";
      typed="";
      ID = 0;
    }
  }
  
}
void stage4Clear()
{
  if (snakeHeadX>=600 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=7;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==2)
    {
      typing="you are gay";
      typed="";
      ID = 0;
    }
  }
  
}
void stage5Clear()
{
  if (snakeHeadX>=600 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=8;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==11)
    {
      typing="a beautiful day";
      typed="";
      ID = 0;
    }
  }
  
}
void stage6Clear()
{
  if (snakeHeadX>=600 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=9;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==15)
    {
      typing="nothing";
      typed="";
      ID = 0;
    }
  }
  
}

  //打字
  String typing="go snake";
  String typed="";
  int ID = 0;
  boolean [] pressed = new boolean[26];
  void keyPressed() {
    if (ID< typing.length()  &&  key==typing.charAt(ID)) {
      if (key>='a'&&key<='z') {
        pressed[key-'a'] = true;
        typed+=key;
        ID++;
      } else if (key==' ') {
        typed+=key;
        ID++;
      } else {
        background(255, 0, 0);
      }
    }


    if (eatItem)
    {
      if (key == CODED && keyCode == SHIFT) {
        // 在按下 Shift 鍵時觸發的事件
        startTime = millis();
        snakeMoving = false;
        eatItem=false;
        rego--;
        for (int i = 0; i < snakeLength; i++) {
          if (i == 0) {
            fill(#AFAFAF);
          } else {
            fill(#C4BEBE);
          }
          rect(x[i], y[i], w, h);
        }
      }
    }
  }
  void keyReleased() {
    if (key>='a'&&key<='z') pressed[key-'a'] = false;
  }

  void eatItem()
  {
    if (Time==5)
    {
      snakeMoving=true;
      eatItem=true;
    }
  }




  boolean isSnakeDie() {
    // 撞墙了
    if ( snakeHeadX < 15 || snakeHeadX >= 585 || snakeHeadY < 30 || snakeHeadY >= 570) {
      showGameOver();
      return true;
    }

    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }

    return false;
  }

  // 蛇死了麼？
  boolean isSnakeDie2() {
    // 撞墙了
    if ( snakeHeadX <-15 || snakeHeadX >= 600 || snakeHeadY <270 || snakeHeadY > 315) {
      showGameOver();
      return true;
    }

    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }
    return false;
  }
