int sizeC;
int Nc = 10;

float a, x, b;


void settings() {
  int sizeX = (displayWidth * 70 /100);
  int sizeY = (displayHeight * 70 / 100);

  size(sizeX, sizeY);
}

void setup() {
  background(0);
  sizeC = height/Nc;
  clean();
}



void draw(){

}


void clean(){
  background(0); //<>//
  int axes = color(250);
  int lignes = color(60);
  for(int i = 0; i < ((float)width/sizeC)/2;i++){
    stroke(lignes);
    line(width/2 + i*sizeC, 0,width/2 + i*sizeC, height);
    line(width/2 - i*sizeC, 0,width/2 - i*sizeC, height);
  }
  for(int i = 0; i < ((float)height/sizeC)/2;i++){
    stroke(lignes);
    line(0, height/2 + i*sizeC, width, height/2 + i*sizeC);
    line(0, height/2 - i*sizeC, width, height/2 - i*sizeC);
  }
  //dessine l'axe orizontal et vertical
  strokeWeight(2);
  stroke(axes);
  //ligne orizontal 
  line(0, height/2, width, height/2);
  //ligne vertical
  line(width/2, 0, width/2, height);
} //<>//



void fonction_lineaire(){
  float y;
  //dessin une fonction lineaire
  y = a * x + b;
}
