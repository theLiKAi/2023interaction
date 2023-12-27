void state()
{
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
}
void state2()
{
   fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);
      //打字
      fill(0);
      textSize(45);
      //要打的字
      text(typing, 300, 100);
      fill(0);
      text(typed, 300, 400);
      //下面數值
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("kg:"+stage, 90, 650);
      text("difficulty:"+ID, 125, 725);
      textSize(20);
      image(Time5,250 , 625);
      text("剩餘暫停時間", 410, 650);
      text("暫停次數", 400, 725);
      timeStop();
}
void state3()
{
   // 繪製地面
  fill(200);
  rect(0, groundLevel, width, 10);
  
  // 繪製普通障礙物
  fill(255);
  rect(obstacleX, groundLevel - obstacleHeight, obstacleWidth, obstacleHeight);
  
  // 繪製更高障礙物
  fill(#F59F00);
  rect(highObstacleX, groundLevel - highObstacleHeight, highObstacleWidth, highObstacleHeight);
  
  // 繪製食物
  fill(255, 0, 0); // 食物使用紅色
  ellipse(appleX, appleY, appleSize, appleSize);
  
   fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //下面數值
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("score:"+score, 90, 650);
      textSize(30);
      text("可用滑鼠、空白鍵、上鍵來跳躍", 275, 725);
      textSize(30);
      text("時間:"+Time, 410, 650);
}
void timeStop()
{
  if(rego>=6)
  {
    image(timeS5, 250, 700);
  }
  if(rego==5)
  {
    image(timeS4, 250, 700);
  }
  if(rego==4)
  {
    image(timeS3, 250, 700);
  }
  if(rego==3)
  {
    image(timeS2, 250, 700);
  }
  if(rego==2)
  {
    image(timeS1, 250, 700);
  }

}
void state4()
{
   fill(0); // 設置填充顏色為黑色
      rect(-10, 600, 700, 600);
      //箱子
      fill(#3379F0);
      rect(-10, 0, 700, 285);
      rect(-10, 315, 700, 285);
      //打字
      fill(0);
      textSize(45);
      //要打的字
      text(typing, 300, 100);
      fill(0);
      text(typed, 300, 400);
      //下面數值
      fill(255);
      textSize(48);
      textAlign(CENTER, CENTER);
      text("kg:"+unseen, 90, 650);

      text("difficulty:"+Time, 125, 725);
      textSize(20);
      image(Time5,250 , 625);
      text("剩餘暫停時間", 410, 650);
      text("暫停次數", 400, 725);
      timeStop();
      fill(0,0,0,canseen);
      rect(0, 0,600, 600);
      canseen-=5;
}
