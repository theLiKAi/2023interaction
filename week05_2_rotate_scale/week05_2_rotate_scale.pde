void setup(){
  size(400,400,P3D);//processing的3D功能
}
void draw(){
  background(#FFFFF2);
  pushMatrix();
  translate(mouseX,mouseY);
  rotateY(radians(mouseX));
  fill(0,255,0);
  box(100);
  
  noFill();
  scale(2);
  box(100);
  popMatrix();
}
