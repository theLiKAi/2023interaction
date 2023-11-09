PImage img;
int [][] pos= {{93,489},{245,524},{179,525},{160,492},{195,490},{230,491},{264,488},
void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img,0,600-266);
  fill(255,0,0,128);
  for(int i=0;i<26;i++){
    rect(pos[i][0],pos[i][1],28,30,5);
  }
}
}
void mousePressed(){
  println(mouseX,mouseY);
}
