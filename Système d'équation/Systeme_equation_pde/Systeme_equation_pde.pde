int Nc = 13;
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
  println("Nombre de cases == " + Nc);
  println("La taille d'une Cases == " + sizeC);
  println("width == " + width);
  println("height ==" + height);
  println("Nombre de cases en X == " + width/sizeC);
  println("Nombre de cases en Y == " + Nc);
  println((float)(width/sizeC)-(int)(width/sizeC));
}



void draw(){
  drawBackground(); //<>//
  calculateLinearFonction();
  drawFonction();
} //<>//



void drawBackground(){
  float x = (float)(width/sizeC)-(int)(width/sizeC);
  println((float)(x*((int)width/sizeC)+(sizeC*(width/sizeC))));
  for(int i = 0; i < Nc; i++){
    //draw line dans l'axe horizontal
     stroke(60);
     strokeWeight(0);
     line(0, i*sizeC, width, i*sizeC);
  }
  for(int i = 0; i < (float)width/sizeC; i++){
    stroke(60);
    strokeWeight(0);
    line((i*sizeC)+x, 0, (i*sizeC)+x, height);
  }
  stroke(255);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  //line(width/2, 0, width/2, height);
}



//void drawBackground(){
//  for(int i = 0; i < ((float)width/sizeC)/2; i++){
//    stroke(60);
//    strokeWeight(0);
//    line(width/2 + i*sizeC, 0,width/2 + i*sizeC, height);
//    line(width/2 - i*sizeC, 0,width/2 - i*sizeC, height);
//  }
//  for(int i = 0; i < ((float)height/sizeC)/2; i++){
//    stroke(60);
//    strokeWeight(0);
//    line(0, height/2 + i*sizeC, width, height/2 + i*sizeC);
//    line(0, height/2 - i*sizeC, width, height/2 - i*sizeC);
//  }
//  stroke(255);
//  strokeWeight(2);
//  line(0, height/2, width, height/2);
//  line(width/2, 0, width/2, height);
//}



void drawFonction(){
  
}



float[] calculateLinearFonction(){
  float a1 = 2, a2 = -1/3, b1 = 6, b2 = 2;
  float x, y;
  x = ((b1-b2)/(a2-a1));
  y = a1 * x + b1;
  
  float[] value = {x, y};
  //println("value X == "+ value[0] + "        value Y == " + value[1]);
  
  return value;
}
