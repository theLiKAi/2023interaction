void setup()
{
  size(600, 400);
  myShuffle();
}
void myShuffle()
{
  for(int i=0; i<8; i++)
  {
    for(int j=0; j<11; j++)
    {
      cardN[i*11+j] = j;
      cardC[i*11+j] = C[i%4];
    }
  }
  for(int i=0; i<1000; i++)
  {
    int a = int(random(88)), b = int(random(88));
    int temp = cardN[a];
    cardN[a] = cardN[b];
    cardN[b] = temp;
    temp = cardC[a];
    cardC[a] = cardC[b];
    cardC[b] = temp;
  }
}
//int [][] card = new int [8][11];
int [] cardN = new int [88]; // card number
int [] cardC = new int [88]; // card color
color []  C = {#FF5555, #FFAA00, #55AA55, #5555FF};
void draw()
{
  background(255);
  for(int i=0; i<8; i++)
  {
    for(int j=0; j<11; j++)
    {
      //drawCard(j*32, i*50, C[i%4], j);
      drawCard(j*32, i*50, cardC[i*11+j], cardN[i*11+j], 32);
    }
  }
  drawCard(450, 50, cardC[7], cardN[77], 128);
}
void drawCard(int x, int y, color c, int n, int w)
{
  float s = w/32.0; //scale size
  stroke(128);
  fill(255);
  rect(x, y, 32*s, 50*s, 7*s); //7是弧度。
  noStroke();
  fill(c);
  rect(x+2.5*s, y+2.5*s, 32*s-5*s, 50*s-5*s, 5*s); //4是弧度。
  
  pushMatrix();
  fill(255);
  translate(x+16*s, y+25*s);
  rotate(radians(50));
  ellipse(0, 0, 20*s, 30*s);
  popMatrix();
  
  textSize(9*s);
  textAlign(CENTER, CENTER);
  text(""+n, x+7*s, y+6*s);
  
  textSize(20*s);
  fill(c);
  text(""+n, x+16*s, y+22*s);
}
