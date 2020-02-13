int Nc = 15;
float sizeC;


//void settings() {
//  //int sizeX = (displayWidth * 70 /100), sizeY = (displayHeight * 70 / 100);
//  int size = (displayHeight * 80 / 100);
  
 
//  size(size, size);
//}

void setup() {
  background(0);
  sizeC = (float)height/Nc;
  fullScreen();
}



void draw(){
  drawBackground(); //<>//
  drawFonction();
} //<>//



void drawBackground(){
  background(0);
  for(int i = 0; i < ((float)width/sizeC)/2; i++){
    stroke(60);
    strokeWeight(1.5);
    line(width/2 + i*sizeC, 0,width/2 + i*sizeC, height);
    line(width/2 - i*sizeC, 0,width/2 - i*sizeC, height);
  }
  for(int i = 0; i < ((float)height/sizeC)/2; i++){
    stroke(60);
    strokeWeight(1.5);
    line(0, height/2 + i*sizeC, width, height/2 + i*sizeC);
    line(0, height/2 - i*sizeC, width, height/2 - i*sizeC);
  }
  stroke(255);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}



void drawFonction(){
  stroke(255, 0, 0);
  strokeWeight(2.5);
  float valueP1[] = calculateLinearFonction(0);
  float valueP2[] = calculateLinearFonction(3);
  line(valueP1[0], valueP1[1], valueP2[0], valueP2[1]);
  //println("valueP1[0]" + valueP1[0]);
  //println("valueP1[1]" + valueP1[1]);
  //println("valueP2[0]" + valueP2[0]);
  //println("valueP2[1]" + valueP2[1]);
}



float[] calculateLinearFonction(float x){
  println("x == " + x);
  float a1 = -1, a2 = 4/5, b1 = -4, b2 = -4;
  float y;
  x = ((b1-b2)/(a2-a1));
  y = ((a1 * x) + b1);
  
  float[] value = {x, y};
  //println("value X == "+ value[0] + "        value Y == " + value[1]);
  //println(((a1*x + b1)));
  
  return value;
}
