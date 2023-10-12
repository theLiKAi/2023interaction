void setup(){
  size(400,400,P3D);
}
void draw(){
  background(#FFFFF2);
  pushMatrix();
  translate(mouseX,mouseY);
  box(100);
  popMatrix();
}
