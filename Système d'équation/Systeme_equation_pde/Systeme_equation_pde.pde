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
  float y0 = calculateLinearFonction(0);
  float y1 = calculateLinearFonction(5);
  stroke(255, 0, 0);
  strokeWeight(2.5);
  line(width/2, sizeC*4y0+height/2, 887, sizeC*y1+height/2);
}



float calculateLinearFonction(float x){
  float a1 = -2, a2 = 4/5, b1 = -4, b2 = -4;
  float y;
  
  y = ((a1 * x) + b1);
  x = ((b1-b2)/(a2-a1));
  println("x == " + x);
  println("y == " + y);
  return y;
}



//int position(int position){
//  return position;
//}



void mousePressed(){
  println(mouseY);
}
