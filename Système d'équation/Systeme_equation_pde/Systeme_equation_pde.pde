int s;
int Nc = 10;

float a, float x, float b;
float x;
float b;

void setup(){
  size(900, 600);
  s = height/Nc;
  clean();
}



void draw(){

}



void clean(){
  background(0);
  int axes = color(250);
  int lignes = color(60);
  for(int i = 0; i < ((float)width/s)/2;i++){
    stroke(lignes);
    line(width/2 + i*s, 0,width/2 + i*s, height);
    line(width/2 - i*s, 0,width/2 - i*s, height);
  }
  for(int i = 0; i < ((float)height/s)/2;i++){
    stroke(lignes);
    line(0, height/2 + i*s, width, height/2 + i*s);
    line(0, height/2 - i*s, width, height/2 - i*s);
  }
  //dessine l'axe orizontal et vertical
  strokeWeight(2);
  stroke(axes);
  //ligne orizontal 
  line(0, height/2, width, height/2);
  //ligne vertical
  line(width/2, 0, width/2, height);
}



void fonction_lineaire(){
  float y;
  //dessin une fonction lineaire
  y = a * x + b;
}
