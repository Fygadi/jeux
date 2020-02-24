int Nc = 12;
float sizeC;


void settings() {
  //int sizeX = (displayWidth * 70 /100), sizeY = (displayHeight * 70 / 100);
  int size = (displayHeight * 80 / 100);
  
  size(size, size);
}

void setup() {
  background(0);
  sizeC = (float)height/Nc;
  //fullScreen();
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
  float x = 1;
  
  float y0 = calculateLinearFonction(0);
  float y1 = calculateLinearFonction(x);
  float x0 = (sizeC*0)+(width/2);
  float x1 = (sizeC*x)+(width/2);
  stroke(255, 0, 0);
  strokeWeight(2.5);
  line(x0, sizeC*-y0+height/2, x1, sizeC*-y1+height/2);
}



float calculateLinearFonction(float x){
  float a1 = 7, a2 = 0, b1 = -3, b2 = 0;
  float y;
  y = ((a1 * x) + b1);
  x = ((b1-b2)/(a2-a1));
   //println("x == " + x);
  //println("y == " + y);
  return y;
}
