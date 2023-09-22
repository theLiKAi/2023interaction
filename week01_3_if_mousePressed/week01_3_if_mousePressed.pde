void setup(){ //設定
  size(500,500);
  background(255); //改白色背景
}

void draw(){ //畫圈 每秒畫60次
  if(mousePressed) {
    line(mouseX,mouseY, pmouseX, pmouseY);
  }//畫線(滑鼠座標mouseX,mouseY, 到之前滑鼠座標pmouseX, pmouseY);
}
