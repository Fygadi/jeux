int Nc = 10;
float sizeC;
float[][] PositionX = new float[Nc][Nc];
float[][] PositionY = new float[Nc][Nc];



void settings() {
  //int sizeX = (displayWidth * 70 /100), sizeY = (displayHeight * 70 / 100);
  int size = (displayHeight * 80 / 100);
  

  size(size, size);
}

void setup() {
  background(0);
  
  sizeC = (float)height/Nc;
}



void draw(){
  draw_plan_cartesien(); //<>//
  calcule();
  draw_jsp();
} //<>//



void draw_plan_cartesien(){
  //dessine les cases dans le background
  for(int i = 0; i < Nc; i++){
    for(int j = 0; j < Nc; j++){
      
    }
    stroke(60);
    strokeWeight(0);
    line(0, sizeC*i, width, sizeC*i);
    line(sizeC*i, 0, sizeC*i, width);
  }
    //dessine la ligne de l'axe des X et des Y
    stroke(255);
    strokeWeight(2);
    line(0, height/2, width, height/2);
    line(height/2, 0, height/2, width);
}



void draw_jsp()
{
  for(int i = 0; i < Nc; i++){
    for(int j = 0; j < Nc; j++){
    
      color(255);
      ellipse(PositionX[i][j], PositionY[i][j], 10, 10);
    }
  }
}



void calcule(){
  for(int i = 0; i < Nc; i++){
    for(int j = 0; j < Nc; j++){
      PositionX[i][j] = sizeC*i;
      PositionY[i][j] = sizeC*j;
      //println("PositionX[i][j] = " + PositionX[i][j] + "PositionY[i][j] = " + PositionY[i][j]);
    }
  }
}
