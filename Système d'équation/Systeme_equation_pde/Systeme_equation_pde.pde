int Nc = 10;
float sizeC;


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
} //<>//



void draw_plan_cartesien(){
  //dessine les cases dans le background
  for(int i = 0; i<= Nc; i++){
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



void calcule(){
  ; 
}
