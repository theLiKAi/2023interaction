 //打字
  String typing="the snake";
  String typed="";
  int ID = 0;

  boolean [] pressed = new boolean[26];
  void keyPressed() {
    if(stage==13||chanllege_mode==4)
    {
       if (key == ' ' && !jumping) {
    jump();
  }
  if (keyPressed && key == CODED&&!jumping) {
          switch(keyCode) {
           case UP:
            jump();
            }
    }
    }
          if(stage<=12||stage==15||chanllege_mode==3)
      {
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

      if (key == CODED && keyCode == CONTROL) {
        // 在按下 Shift 鍵時觸發的事件
        Time5.play();
        noStroke();
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
    if(stage==15&&ID==20) startTime = millis(); 
    }
    if(stage==9)
    {
      if (key>='t'&&key<='t') {
         noStroke();
        startTime = millis();
        pressed[key-'a'] = true;
        typed+=key;
        ID++;
        snakeMoving = false;
        eatItem=false;
       fill(#B23434);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);
        for (int i = 0; i < snakeLength; i++) {
          if (i == 0) {
            fill(#AFAFAF);
          } else {
            fill(#C4BEBE);
          }
          rect(x[i], y[i], 100, 100);
        }
        Time5.stop();
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
      Time5.stop();
    }
  }
