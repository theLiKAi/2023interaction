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
    startTime = millis();
    stage=13;
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
    noStroke();
    startTime = millis();
    stage=6;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==9)
    {
      typing="want to go outside";
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

    if (ID==18)
    {
      typing="it went to exit";
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

    if (ID==15)
    {
      typing="and it did it";
      typed="";
      ID = 0;
    }
  }
  
}
void stage6Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=10;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;
    if (ID==13)
    {
      typing="so keep going";
      typed="";
      ID = 0;
    }
  }  
}

void stage7Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=9;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

    if (ID==13)
    {
      typing="so keep going";
      typed="";
      ID = 0;
    }
  }  
}
void stage8Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    startTime = millis();
    stage=13;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;
      eye2(100, 100, 0.8, 0.8);
    if (ID==13)
    {
      typing="so keep going";
      typed="";
      ID = 0;
    }
  }  
}
void stage9Clear()
{
     // 繪製地面
  fill(200);
  rect(0, groundLevel, width, 10);
  
     fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //下面數值
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      textSize(20);
      text("剩餘暫停時間:"+Time, 410, 650);
  
    // 移動蛇的身體
  for (int i = snakeLength - 1; i > 0; i--) {
    snakeBodyX[i] = snakeBodyX[i - 1];
    snakeBodyY[i] = snakeBodyY[i - 1];  
      
  }
   snakeX += 4;
  // 更新蛇頭的位置
  snakeBodyX[0] = int(snakeX);
  snakeBodyY[0] = int(snakeY);
  
  // 更新蛇身體的X座標
  for (int i = 1; i < snakeLength; i++) {
    snakeBodyX[i] -= 26; // 假設蛇是向右移動的
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
  

  if(snakeX>800) 
  {
    if(unseen<=255)   unseen+=2; 
      if(Time>60) eye2(int(random(0,300)), int(random(0,300)), 0.8, 0.8);
  fill(0,0,0, unseen); // 127 表示透明度 (0 為完全透明，255 為完全不透明)    
  rect(0, 0,600, 600);
  }
  if(snakeX>1500)
  {
    rego=2;
    stage=15;
    snakeHeadX=-800;
    snakeHeadY=300;
    typing="exit is almost there";
    typed="";
    ID = 0;
  }
}



void stage10Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=16;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;
  check1=0;check2=0;check3=0;check4=0;
  }  
}
void stage11Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=17;
    snakeHeadX=-15;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;
  check1=0;check2=0;check3=0;check4=0;
  }  
}
void stage12Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=18;
    snakeHeadX=30;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

  }  
}
void stage13Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=19;
    snakeHeadX=30;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

  }  
}

/*void stage14Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    stage=20;
    snakeHeadX=30;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

  }  
}*/

void stage15Clear()
{
  if (snakeHeadX>=590 && snakeHeadY>=275&&snakeHeadY<=315)
  {
    TheEND=1;
    snakeHeadX=30;
    if (snakeHeadY>=275&&snakeHeadY<300)
    {
      snakeHeadY=285;
    } else if (snakeHeadY>=300&&snakeHeadY<=315) snakeHeadY=300;

  }  
}
