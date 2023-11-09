PImage img;
int [][] pos={{83,457},{117,456},{151,456},{186,456},{221,457},{254,456},{288,457},{323,457},{356,458},{390,456},{93,491},{128,491},{161,490},{195,490},{230,489},{264,489},{298,491},{332,490},{368,490},{110,523},{144,524},{178,525},{210,525},{245,525},{280,525},{314,524}};

void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img,0,600-266);
  fill(255,0,0,128);
  rect(mouseX,mouseY,28,30,6);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
}
boolean [] pressed =new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z') pressed[key='a']=true;
}
void keyPressed(){
  if(key>='a'&&key<='z') pressed[key='a']=false;
}
void mousePressed(){
  println(mouseX,mouseY);
}
