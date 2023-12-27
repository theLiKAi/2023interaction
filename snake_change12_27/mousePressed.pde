void mousePressed() {
  // 檢查滑鼠是否點擊了按鈕 
  if(stage==13||chanllege_mode==4)
  {
    jump();
  }
  //挑戰
  if(chanllege_mode==1)
  {
    if (S_button3( btn3X, btn3Y, btn3W, btn3H)) {
      chanllege_mode=2;
      noCursor();
      stage=1;
      if (!gameStarted) {
        gameStarted = true;
    }
    }
    if (S_button4( btn4X, btn4Y, btn4W, btn4H)) {
      chanllege_mode=3;
      noCursor();
      if (!gameStarted) {
        gameStarted = true;
    }
      stage=1;
      startTime = millis();
      snakeHeadX=0;
      snakeHeadY=285;
      eatItem=true;
      rego=999;
    }
    if (S_button5( btn5X, btn5Y, btn5W, btn5H)) {
      if (!gameStarted) {
        gameStarted = true;
    }
      chanllege_mode=4;
      startTime = millis();
      noCursor();
      stage=1;
    }
    if (S_button6( btn6X, btn6Y, btn6W, btn6H)) {
      chanllege_mode=0;
      stage=0;
    }
  }
  //劇情
   if (stage==0&& chanllege_mode==0)
  {
    if (S_button1( btn1X, btn1Y, btn1W, btn1H)) {
      stage=-2;
      noCursor();
      snakeHeadX = 300;
      snakeHeadY = 300;
      startTime = millis();
    }
    if (S_button2( btn2X, btn2Y, btn2W, btn2H)) {
      chanllege_mode=1;
      stage=1;
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
boolean S_button3(int btn3X, int btn3Y, int btn3W, int btn3H)
{
  if (mouseX > btn3X && mouseX < btn3X + btn3W &&
    mouseY > btn3Y && mouseY < btn3Y + btn3H) {
    return true;
  } else {
    return false;
  }
}
boolean S_button4(int btn4X, int btn4Y, int btn4W, int btn4H)
{
  if (mouseX > btn4X && mouseX < btn4X + btn4W &&
    mouseY > btn4Y && mouseY < btn4Y + btn4H) {
    return true;
  } else {
    return false;
  }
}
boolean S_button5(int btn5X, int btn5Y, int btn5W, int btn5H)
{
  if (mouseX > btn5X && mouseX < btn5X + btn5W &&
    mouseY > btn5Y && mouseY < btn5Y + btn5H) {
    return true;
  } else {
    return false;
  }
}
boolean S_button6(int btn6X, int btn6Y, int btn6W, int btn6H)
{
  if (mouseX > btn6X && mouseX < btn6X + btn6W &&
    mouseY > btn6Y && mouseY < btn6Y + btn6H) {
    return true;
  } else {
    return false;
  }
}
