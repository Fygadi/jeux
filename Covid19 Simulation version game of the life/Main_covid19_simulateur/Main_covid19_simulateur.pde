import java.util.ArrayList;
import javafx.util.Pair;

//bug 1
//utiliser une autre matrix a chaque iteration et recopier a la fin d'ans la matrix original

Maladi_simulateur maladi;

//parameter interface
int g_fps = 244;
int g_sizeCases = 20;

//parametre maladi
int g_pourcentage_de_vaccines =0; //covid_19 43%
int g_nombre_de_malade = 1;
int g_pourcentage_de_mortalite_de_la_maladie = 3; //covid_19 3%
int g_contagiositer_de_la_maladie = 6;
int g_temps_avant_la_mort = 14;
int g_temps_avant_la_guerison = 10;
int g_imuniter_time_after_malade = 0;

enum Cellules_types{
  VIVANT,
  VACCINER,
  MALADE,
  MORT,
  GUERI,
}
int iteration = 0;

void setup(){
  frameRate(g_fps);
  fullScreen();
  //size(3840, 2160);
  //size(5440, 1920);
  background(0);
  rectMode(CENTER);
  
  //set the size of the case and the number of the cases.
  int nombreCasesX = ((int)width/g_sizeCases);
  float sizeCaseX = ((float)width / nombreCasesX);

  int nombreCasesY = ((int)height/g_sizeCases);
  float sizeCaseY = ((float)height / nombreCasesY);
  
  maladi = new Maladi_simulateur(g_pourcentage_de_vaccines, g_nombre_de_malade, g_pourcentage_de_mortalite_de_la_maladie, g_contagiositer_de_la_maladie, g_temps_avant_la_mort, g_temps_avant_la_guerison, g_imuniter_time_after_malade,
                                 nombreCasesX, nombreCasesY, sizeCaseX, sizeCaseY);
  
  maladi.Population_initialisation();
  maladi.Draw_all_population();
}



void draw(){
  //saveFrame("data/iteration_" + iteration++ + ".png");
  maladi.rules_all_case();
  maladi.Draw_all_population();
}



void keyPressed(){
  if (key == 'r' || key == 'R'){
    maladi.Population_initialisation();
    maladi.Draw_all_population();
  }
}
