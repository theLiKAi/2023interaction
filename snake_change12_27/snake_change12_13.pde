// 因為音樂所以啟動很慢大概啟動時間30秒
import gifAnimation.*;

int a=255,b=255,c=255;
int startTime;  // 計時器開始時間
int elapsedTime;  // 過去的時間
int Time;//計算現在
int rego=6;//可暫停次數
//場景
int stage=0;
//挑戰模式
int chanllege_mode=0;
//結局
int TheEND=0;
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
int itemX=510;
int itemY=285;
boolean eatItem = false;


//字體
PFont chineseFont;

//圖片
PImage chanllege;
PImage btn1;
PImage btn2;
PImage btn3;
PImage btn4;
PImage btn5;
PImage back;
PImage reset1;
PImage timeS1;
PImage timeS2;
PImage timeS3;
PImage timeS4;
PImage timeS5;
PImage satoru;
PImage jumpBACK;
PImage beta1;
PImage beta2;
//GIF
Gif start;
Gif reset;
Gif Time5;
Gif stun;
Gif bugtext;
Gif chanllege1;
Gif chanllege2;
Gif chanllege3;
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
//btn3
int btn3X = 157; // 按鈕的X座標
int btn3Y = 192; // 按鈕的Y座標
int btn3W = 287; // 按鈕的寬度
int btn3H = 81; // 按鈕的高度
//btn4
int btn4X = 152; // 按鈕的X座標
int btn4Y = 383; // 按鈕的Y座標
int btn4W = 287; // 按鈕的寬度
int btn4H = 81; // 按鈕的高度
//btn5
int btn5X = 152; // 按鈕的X座標
int btn5Y = 574; // 按鈕的Y座標
int btn5W = 287; // 按鈕的寬度
int btn5H = 81; // 按鈕的高度
//back
int btn6X = 26; // 按鈕的X座標
int btn6Y = 739; // 按鈕的Y座標
int btn6W = 120; // 按鈕的寬度
int btn6H = 42; // 按鈕的高度

boolean S1_button=false;
boolean S2_button=false;
boolean S3_button=false;
boolean S4_button=false;
boolean S5_button=false;
boolean S6_button=false;
//眼睛
PVector Eye;
 
//stage9
String message = "the EXIT is a lie";
int currentLength1 = 0;
String error1 ="kg:";
int currentLength2 = 0;
String error2 ="difficulty:";
int currentLength3 = 0;
String error3 ="暫停時間:";
int currentLength4 = 0;
String error4 ="暫停次數:";
int currentLength5 = 0;
int currentLength6 = 0;

//jump Game.stage13
int groundLevel; // 地面高度
float snakeX, snakeY; // 蛇的座標
float snakeSpeedY; // 蛇的垂直速度
boolean jumping = false; // 是否在跳躍

int obstacleX; // 普通障礙物的X座標
int obstacleWidth = 20; // 普通障礙物的寬度
int obstacleHeight = 30; // 普通障礙物的高度
boolean obstaclePassed = false; // 是否通過了普通障礙物
int obstacleSpeed = 4;
int obstaclePassed1 = 0;

int highObstacleX; // 更高障礙物的X座標
int highObstacleWidth = 20; // 更高障礙物的寬度
int highObstacleHeight = 50; // 更高障礙物的高度
boolean highObstaclePassed = false; // 是否通過了更高障礙物
int highObstaclePassed1 = 0;
int highObstacleSpeed =5; 

int appleX, appleY; // 食物的座標
int appleSize = 20; // 食物的大小
float appleSpeed = 5; // 食物的移動速度


int[] snakeBodyX = new int[100]; // 蛇身體每節的X座標
int[] snakeBodyY = new int[100]; // 蛇身體每節的Y座標

int backX=600;
int beta1X=0;
int beta2X=2600;
//看不到
  int  unseen=0;
  int  canseen=255;
  
//stage16
int check1=0;
int check2=0; 
int check3=0;
int check4=0;
 
//stage18  
int lastUpdateTime;
int updateInterval = 60;  // 每秒更新一次
boolean change = true; // 改變方向
ArrayList<SnakeNPC> snakeNPCs = new ArrayList<SnakeNPC>();
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
  chanllege = loadImage("chanllege.png");
  btn1 = loadImage("start_btn1.png");
  btn2 = loadImage("start_btn2.png");
  btn3 = loadImage("chanllege_btn1.png");
  btn4 = loadImage("chanllege_btn2.png");
  reset1 = loadImage("reset.png");
  timeS5 = loadImage("5.png");
  timeS4 = loadImage("4.png");
  timeS3 = loadImage("3.png");
  timeS2 = loadImage("2.png");
  timeS1 = loadImage("1.png");
  satoru = loadImage("satoru.png");
  jumpBACK = loadImage("jumpBACK.jpg");
  beta1 = loadImage("beta1.jpg");
  beta2 = loadImage("beta2.jpg");
  //蛇的初始位置
  snakeHeadX = int(random(1, 570 / w - 1)) * w;
  snakeHeadY = int(random(1, 570 / h - 1)) * h;
  // 載入GIF文件
  start = new Gif(this, "start.gif");
  start.play();
  reset = new Gif(this, "reset.gif");
  Time5 = new Gif(this, "time5.gif");
  stun = new Gif(this, "stun.gif");
  bugtext = new Gif(this, "Bugtext.gif");
  chanllege1 = new Gif(this, "chanllege1.gif");
  chanllege2 = new Gif(this, "chanllege2.gif");
  chanllege3 = new Gif(this, "chanllege3.gif");
   //眼睛位置
  Eye = new PVector(200, 200);
  startTime = millis();  // 初始化計時器
  
//jumpGame
groundLevel = height - 250;
  snakeX = 50;
  snakeY = groundLevel-30; // 蛇的初始Y座標設置在地面上
  obstacleX = width;
  highObstacleX = width + 100; // 更高障礙物的初始位置比普通障礙物更遠
  spawnapple();
//stage18
    for (int i = 0; i < 10; i++) {
    int initialX = int(random(200,600));
    int initialY = int(random(height));
    snakeNPCs.add(new SnakeNPC(initialX, initialY));
  }
  lastUpdateTime = millis();
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

     state();
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
      rect(-10, 315, 700, 285);
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
      if ( snakeHeadX >=485 && snakeHeadX <=600 && snakeHeadY >=285 && snakeHeadY <=300) {
        itemX=1000;
        itemY=1000;
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
      if (ID==9) {
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

      state2();
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
      if (ID==18) {
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

      state2();
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

      state2();
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
      if (ID==13) {
        obstacles.clear();
        Obstacles=0;
      }
      stage6Clear();
    }
  }
   else if (stage==9)
  {
    frameRate(20);    
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
  // 顯示部分文字

      fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(#D63A3A);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);
      //打字
      fill(255);
      textSize(45);
      //要打的字
      text(message, 300, 100);
      fill(255);
      text(typed, 300, 400);
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text(error1+stage, 90, 650);
      text(error2+ID, 125, 725);
      text(error3+Time, 400, 650);
      text(error4 +(rego-1), 400, 725);
      

      // 畫一個道具
      // @600, @600 是指畫布的寬高
      drawItem();
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      //障礙物
      generateS5Obstacles1();
      generateS5Obstacles2();
      //要打的字
      //打完字消除障礙物
    if(ID>=1)
    {
      message="the exitojd klxzijwo IS zoAjxcxlvoiwjLIE slakjcxlkzj oiwj aklwDON sklxzjlckjxGO lkxcmc lzjkjlj@!U(è¿äžªé¡µé¢äž»èŠçšæ¥è§å¯äžæ®µæå­åšçŒç éè¯¯æ¶çæŸç€ºæåµïŒç æŸç€ºãœæAU U)(@U )(!& *(**F*(YCXIJA{{JO COOPK{@"; 
      error1="kg:dajoiwjioauioxcz,lmwI@)(UCX&*@(*JDXLKC M>J@)$U))DSACU()S&*(&A*(@Y$(*(JDS$!@*(U(*SD*Y*(D*AYH UIOSADY&*@Y!&*!HYUI#$HJNKLLSDKAKLCMX>L:Jfjkldfhawuei0fyhdusifhlksajdlz";
      error2="difficulty:dioJWOAIJ@(zawarudo klxzu9812888ijdsklxcm.sdsaoiu2ijknxz,dklasjldMINGCHANGJIOFaasddèŸå¥çå­ç¬ŠïŒæèœåå«äœç äœäžäžèŽïŒïŒæä»¥äŒé æä¹±ç ãèjqlm.2!@$!@O$UYY*(S^&*DCcxklzm,. joiwwjfoxjlkfdl";
      error3="暫停時間:杩欎釜椤甸潰涓昏鐢ㄦ潵瑙傚療涓€娈垫枃瀛楀湪缂栫爜閿欒鏃剁殑鏄剧ず鎯呭喌锛屽師鐞嗘槸浠TF-8缂栫爜璇诲彇杈撳叆鐨勬枃瀛楋紝鐒跺悗浠ラ€夊畾鐨勭紪鐮佹樉绀恒€傚彲閫夌殑闄TF鍦板寲缂栫爜";
      error4="暫停次數:屽畠浠潎涓嶶TF-8缂栫爜涓嶅吋瀹癸紙涓嶅寘鍚緭鍏ョ殑瀛楃锛屾垨铏霑吩ｸｪ鬘ｵ髱｢荳ｻ隕∫畑譚･隗ょｯ滉ｸ谿ｵ譁�ｭ怜惠郛也��漠隸ｯ譌ｶ逧�仞遉ｺ諠���悟次逅�弍莉･UTF-8郛也�∬ｯｻ蜿锛屾墍绾嫳鏂囨椂锛屾棤璁洪€夋";
      typing="tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt";
      errortext();
      image(Time5,int(random(0,600)) , int(random(0,800)));
      image(Time5,int(random(0,600)) , int(random(0,800)));
      image(Time5,int(random(0,600)) , int(random(0,800)));
      image(Time5,int(random(0,600)) , int(random(0,800)));
    }

      if(Time==3)
      {
        stage=11;
      }
    }
  }
  else if (stage==10)
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

      state2();
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
      if (ID==13) {
        obstacles.clear();
        Obstacles=0;
      }
      stage7Clear();
    }
  }
  else if (stage==11)
  {
    frameRate(5); 
    
 fill(#35B0F0); 
     rect(-10, 0, 700, 800);
     fill(255);
      textSize(150);
      //要打的字
      text(":(", 300, 300);
      if(ID>0)
      {
       ID=0;
       startTime = millis();    
      }
      if(Time>6&&ID==0)
      {
        reset.play();
        image(reset, 0, 0);
      }
      if(Time>13&&ID==0)
      {
        image(reset1,0, 0);
      }
      if(Time>17&&ID==0)
      {
        stage=12;
        typing="so keep going";
      typed="";
      ID = 0;
      snakeDirection='A';
          snakeMoving=true;
          rego=2;
           eatItem=true;
      }
  }
       else if (stage==12)
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

      state2();
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
      /*generateS5Obstacles1();
      generateS5Obstacles2();*/
      //要打的字
      //打完字消除障礙物
      if (ID==13) {
        obstacles.clear();
        Obstacles=0;
      }
      stage8Clear();
    }
  }
  
  else if (stage==13)
  {
      background(0);
      frameRate(60);
   listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie3() ) {
        return;
      }
  image(jumpBACK,backX,-500 );
  backX--;
   state3();
  jumpGame();
  

 if(Time==60)
 {
   stage++;
 }
}
noStroke();
  }
  else if (stage==14)
  {
      background(0);
      frameRate(60);
   listenGameOver();
    if (gameStarted) {
    
      stage9Clear();
      noStroke();
  }
  }
  
   else if (stage==15)
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
      
      state4();
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
      
       
      if (ID==20) {
        obstacles.clear();
        Obstacles=0;
        snakeMoving=false;
        if(Time>10) snakeMoving=true;
        if(Time>3)
        {
        if(unseen>1) unseen-=4;        
        }
        if(unseen>=0)
        {    
         fill(#C61C44);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);
      //箱子
      fill(0,0,0,unseen);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);       
        }
        if(unseen==0) 
        {
          eye1(375,182,1,1);eye1(496,229,1,1);eye1(428,178,1,1);eye1(376,47,1,1);eye1(479,203,1,1);eye1(5,180,1,1);eye1(184,149,1,1);eye1(62,244,1,1);eye1(200,191,1,1);eye1(79,82,1,1);
          eye1(501,453,1,1);eye1(63,540,1,1);eye1(287,483,1,1);eye1(515,436,1,1);eye1(119,427,1,1);eye1(531,350,1,1);eye1(69,519,1,1);eye1(591,444,1,1);eye1(147,490,1,1);eye1(182,387,1,1); 
        }
         typing="death is almost there";
        typed="death is almost there";
       fill(255,0,0,125);
      textSize(45);
      //要打的字
      text(typing, int (random(296,300)),int (random(95,100)));
      fill(0,255,0,125);
      text(typing, int (random(297,303)),int (random(97,103)));
      fill(0,0,255,125);
      text(typing, int (random(302,304)),int (random(102,104)));
      fill(255,0,0,125);
      text(typed,  int (random(296,300)),int (random(393,400)));
      fill(0,255,0,125);
      text(typed,  int (random(297,303)),int (random(397,403)));
      fill(0,0,255,125);
      text(typed,  int (random(302,304)),int (random(402,404)));            
      }
      stage10Clear();
    }
  }
    else if (stage==16)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie4() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(0);
        snakemove();
        eye1(300,300,6,6);
        noStroke();
         
        }

     state();
     fill(255);
    rect(585, 285, 15, 30);
    rect(0, 285, 15, 30);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      eyestage();
      }
    }
  else if (stage==17)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie4() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(0);
        snakemove();
        eye1(300,300,6,6);
        noStroke();
      }

     state();
     fill(255);
    rect(585, 285, 15, 30);
    rect(0, 285, 15, 30);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      eyestage();
      }
    }
else if (stage==18)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie5() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(0);
        snakemove();
        noStroke();
      }

     state();
     fill(255);
    rect(585, 285, 15, 30);
    rect(0, 285, 15, 30);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      
 // 判斷是否到達更新時間
  if (millis() - lastUpdateTime > 10000 / updateInterval) {
    // 更新每个 SnakeNPC 的方向
    for (SnakeNPC currentSnake : snakeNPCs) {
      currentSnake.changeRandomDirection();
    }

    // 重置更新時間
    lastUpdateTime = millis();
  }

  for (SnakeNPC currentSnake : snakeNPCs) {
    currentSnake.update();
    currentSnake.checkCollision();
    fill(255);
    textSize(40);
    image(bugtext, currentSnake.x, currentSnake.y);
    bugtext.play();
  }
    stage13Clear();
   }
    }
    
    
/*    //exit is a lie
    else if (stage==19)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie6() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(0);
        snakemove();
        noStroke();
      }

      fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("kg:"+kg, 90, 650);
      text("difficulty:"+stone, 125, 725);
     fill(255);
    rect(585, 285, 15, 30);
    rect(0, 285, 15, 30);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      stage14Clear();
      }
    } */
    
    //2exit
    else if (stage==20)
  {

    if (!gameStarted) {
      gameStarted = true; // 遊戲開始
      // 初始化遊戲狀態，生成蛇和食物等
    }
    frameRate(12);
    listenGameOver();
    if (gameStarted) {

      // 每一幀都要判斷：蛇是不是掛了？
      if ( isSnakeDie6() ) {
        return;
      }
      if (snakeMoving) {
        // 填滿畫布背景顏色
        background(0);
        snakemove();
        noStroke();
      }

     state();
     fill(255);
    rect(585, 285, 15, 30);
    rect(0, 285, 15, 30);
      // 畫一個食物
      // @600, @600 是指畫布的寬高
      // 繪製障礙物
      drawObstacles();
      // 繪製消除障礙物
      drawStar();
      // 如果蛇吃了食物
      stage15Clear();
      }
    }    
 
   else if (stage==80)
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
        image(satoru, 0, 0);
        snakemove();
      }

     
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
      /*generateS5Obstacles1();
      generateS5Obstacles2();*/
      //要打的字
      //打完字消除障礙物
     
  }
  }
  else if(TheEND==1)
  {
    
    
  }
  
  else if(stage==-2)
  { 
      background(0);
      
      if(Time>=1)
      {
        startTime = millis();
         a=int (random(0,255));
         b=int (random(0,255));
         c=int (random(0,255));     
      }
      fill(a,b,c);
      textSize(80);
      textAlign(CENTER, CENTER);
      text("製作中...",300,400);
  }
    


//挑戰模式

chanllege_mod();

}//end draw


 
