private class Maladi_simulateur{
  int pourcentage_de_vaccines;
  int nombre_de_malade;
  int mortalite_de_la_maladie;
  int contagiositer_de_la_maladie;
  int temps_avant_la_mort;
  int temps_avant_la_guerison;
  
  int nombreCasesX;
  int nombreCasesY;
  float sizeCaseX;
  float sizeCaseY;
  
  Cellules_types[][] CaseStats;
  
  
  public Maladi_simulateur(int tmp_pourcentage_de_vaccines, int tmp_nombre_de_malade, int tmp_mortalite_de_la_maladie, int tmp_contagiositer_de_la_maladie, int tmp_temps_avant_la_mort, int tmp_temps_avant_la_guerison, 
                           int tmp_nombreCasesX, int tmp_nombreCasesY, float tmp_sizeCaseX, float tmp_sizeCaseY){
    pourcentage_de_vaccines = tmp_pourcentage_de_vaccines;
    nombre_de_malade = tmp_nombre_de_malade;
    mortalite_de_la_maladie = tmp_mortalite_de_la_maladie;
    contagiositer_de_la_maladie = tmp_contagiositer_de_la_maladie;
    temps_avant_la_mort = tmp_temps_avant_la_mort;
    temps_avant_la_guerison = tmp_temps_avant_la_guerison;
    
    
    nombreCasesX = tmp_nombreCasesX-1;
    nombreCasesY = tmp_nombreCasesY-1;
    sizeCaseX = tmp_sizeCaseX;
    sizeCaseY = tmp_sizeCaseY;
    
    CaseStats = new Cellules_types[nombreCasesX][nombreCasesY];
  }
    
  
  void initialisation(){
    //set all case to vivant case
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        CaseStats[i][j] = Cellules_types.VIVANT;
      }
    }
    
    int nombre_de_vaccines = (((nombreCasesX * nombreCasesY) / 100) * pourcentage_de_vaccines);
    for (int i = 0; i < nombre_de_vaccines; i++){
      int randomX = int(random(0, nombreCasesX));
      int randomY = int(random(0, nombreCasesX));
      if (CaseStats[randomX][randomY] == Cellules_types.VIVANT){
        CaseStats[1][1] = Cellules_types.IMUNISER;
      }
    }
  }
}
