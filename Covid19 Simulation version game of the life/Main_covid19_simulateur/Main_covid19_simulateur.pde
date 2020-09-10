Maladi_simulateur maladi;

//parameter
int g_fps = 256;

int g_sizeCases = 32;


int g_pourcentage_de_vaccines = 2;
int g_nombre_de_malade = 2;
int g_mortalite_de_la_maladie = 20;
int g_contagiositer_de_la_maladie = 15;
int g_temps_avant_la_mort = 256;
int g_temps_avant_la_guerison = 128;

enum Cellules_types{
  VIVANT,
  IMUNISER,
  MALADE,
  MORT
}

void setup(){
  frameRate(g_fps);
  fullScreen();
  
  background(0);
  rectMode(CENTER);
  
  //set the size of the case and the number of the cases.
  int nombresCasesX = ((int)width/g_sizeCases);
  float sizeCaseX = ((float)width / nombresCasesX);

  int nombresCasesY = ((int)height/g_sizeCases);
  float sizeCaseY = ((float)height / nombresCasesY);
  
  maladi = new Maladi_simulateur(g_pourcentage_de_vaccines, g_nombre_de_malade, g_mortalite_de_la_maladie, g_contagiositer_de_la_maladie, g_temps_avant_la_mort, g_temps_avant_la_guerison, 
                                 nombresCasesX, nombresCasesY, sizeCaseX, sizeCaseY);
  
  maladi.Population_initialisation();
  maladi.Draw_cases();
}



void draw(){
  
}



void keyPressed(){
  if (key == 'r' || key == 'R'){
    maladi.Population_initialisation();
    maladi.Draw_cases();
  }
}
