PImage photo;

void setup()
{
  frameRate(60);
  fullScreen();
  background(0);
  
  dessin_buton();
}



void dessin_buton()
{
  button_parametre();
}



void button_parametre()
{
  photo = loadImage("parametre.png");
}



void mouseClicked()
{
  
}
