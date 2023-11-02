//碰撞偵測
//牛頓力學(1)靜者恆靜、動者恆動,(2) f=m*a 位置、速度、加速度
void setup(){
  size(400,400);
}
float marioX=50,marioY=250,vx=0,vy=0;
void draw(){
  background(108,137,255);
  marioX +=vx;
  marioY +=vy;
   fill(255,0,0);   ellipse(marioX,marioY,15,25);
   fill(220,119,42); rect(0,260,400,150);
}
void keyPressed(){
   if(keyCode==RIGHT)vx=2;
   if(keyCode==LEFT)vx=-2;
   if(keyCode==UP) vy=-20;
 }
 void keyReleased(){
   if(keyCode==LEFT|| keyCode==RIGHT)vx=0;
   }
