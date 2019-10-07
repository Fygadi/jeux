int grandeurJoueur = 50;

void setup(){
fullScreen();
frameRate(60);
}
void draw(){

  terrain();
  
  joueur();
}


void joueur()
{
  fill(255);
  stroke(255);
 ellipse(175, height-height/10-(grandeurJoueur/2), grandeurJoueur, grandeurJoueur);
}


void terrain()
{
  background(0,0,200);

fill(0,240,0);
stroke(0,240,0);
rect(0,height-height/10,width, height);
}
