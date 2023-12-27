
 void eye1(int EyeX,int EyeY,float ScaleX,float ScaleY)
 {
     // 設定外框線的顏色
  stroke(0);  // 黑色
  
  // 設定外框線的寬度
  strokeWeight(1.5);
   
 PVector eyeVector = new PVector(snakeHeadX, snakeHeadY);
      Eye = new PVector(EyeX, EyeY);
      PVector Pupil = Eye.copy().add(eyeVector.copy().sub(Eye).setMag(ScaleX*12));
      
      fill(#FFFCF2);
      ellipse(EyeX, EyeY, ScaleX*50, ScaleY*50);

      fill(#CBA87B);
      ellipse(Pupil.x, Pupil.y,ScaleX* 26, ScaleY*26);
      fill(0);
      ellipse(Pupil.x, Pupil.y, ScaleX*18, ScaleY*18);
      fill(255);
      ellipse(Pupil.x*1.005, Pupil.y*1.005, ScaleX*5, ScaleY*5);
 }
  void eye2(int EyeX,int EyeY,float ScaleX,float ScaleY)
 {
     // 設定外框線的顏色
  stroke(0);  // 黑色
  
  // 設定外框線的寬度
  strokeWeight(1);
   
 PVector eyeVector = new PVector(snakeX, snakeY);
      Eye = new PVector(EyeX, EyeY);
      PVector Pupil = Eye.copy().add(eyeVector.copy().sub(Eye).setMag(ScaleX*12));
      
      fill(#FFFCF2);
      ellipse(EyeX, EyeY, ScaleX*50, ScaleY*50);

      fill(#CBA87B);
      ellipse(Pupil.x, Pupil.y,ScaleX* 26, ScaleY*26);
      fill(0);
      ellipse(Pupil.x, Pupil.y, ScaleX*18, ScaleY*18);
      fill(255);
      ellipse(Pupil.x*1.005, Pupil.y*1.005, ScaleX*5, ScaleY*5);
 }
 
 
void eyestage()
 {
   if ( snakeHeadX > 300 && snakeHeadX< 330 && snakeHeadY > 0 && snakeHeadY <150 ) {
         check1=1;
         }
          if ( snakeHeadX > 450 && snakeHeadX< 600 && snakeHeadY > 300 && snakeHeadY <330 ) {
         check2=1;
         }
          if ( snakeHeadX > 0 && snakeHeadX< 150 && snakeHeadY > 300 && snakeHeadY <330 ) {
         check3=1;
         }
          if ( snakeHeadX >300 && snakeHeadX< 330 && snakeHeadY > 450 && snakeHeadY <600 ) {
         check4=1;
         }
         if(check1==1&&check2==1&&check3==1&&check4==1)
         {
            fill(#FFFCF2);
              ellipse(300, 300, 6*50, 6*50);
              image(stun, 0,-30);
              stun.play();
           stage12Clear();
         }
       else
           {
              stage11Clear();
              }
        }
        
