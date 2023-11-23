int state=0; //0:white, 1:red,2;blue
void setup()
{
  size(400,400);
  textSize(50);
}

void draw(){
  if(state==0){ //第0關,白色
    background(255);
    fill(0); text("Click to Start",80,200);
  }
  else if(state==1){ //第1關,紅色
    background(255,0,0);
  }
  else if(state==2){
    background(0,0,255);//第2關,藍色
  }
}
void mousePressed(){
  if(state==0) state=1;
}
