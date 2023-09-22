void setup(){ //設定
  size(500,500);
  background(255); //改白色背景
}

void draw(){ //畫圈 每秒畫60次
  if(mousePressed) {
    line(mouseX,mouseY, pmouseX, pmouseY);
  }//畫線(滑鼠座標mouseX,mouseY, 到之前滑鼠座標pmouseX, pmouseY);
}

void keyPressed(){ //如果有按下keyborad的key
  if(key=='1') stroke(255, 0, 0);//如果按下數字1 就筆觸是紅色
  if(key=='2') stroke(0, 255, 0);//如果按下數字2 就筆觸是綠色
  if(key=='3') stroke(0, 0, 255);//如果按下數字3 就筆觸是藍色
  if(key=='s'||key=='S') save("output.png"); //如果按下s鍵,就存檔output.png
  if(key=='+') strokeWeight(10);
  if(key=='-') strokeWeight(1);
}
