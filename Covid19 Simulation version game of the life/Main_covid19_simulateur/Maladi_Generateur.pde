private class Maladi_simulateur{
  int pourcentage_de_vaccines;
  int nombre_de_malade;
  int mortalite_de_la_maladie;
  int contagiositer_de_la_maladie;
  int temps_avant_la_mort;
  int temps_avant_la_guerison;
  
  int nombresCasesX;
  int nombresCasesY;
  float sizeCaseX;
  float sizeCaseY;
  
  
  CellValue[][] CaseStats;
  
  
  public Maladi_simulateur(int tmp_pourcentage_de_vaccines, int tmp_nombre_de_malade, int tmp_mortalite_de_la_maladie, int tmp_contagiositer_de_la_maladie, int tmp_temps_avant_la_mort, int tmp_temps_avant_la_guerison, 
                           int tmp_nombreCasesX, int tmp_nombreCasesY, float tmp_sizeCaseX, float tmp_sizeCaseY){
    pourcentage_de_vaccines = tmp_pourcentage_de_vaccines;
    nombre_de_malade = tmp_nombre_de_malade;
    mortalite_de_la_maladie = tmp_mortalite_de_la_maladie;
    contagiositer_de_la_maladie = tmp_contagiositer_de_la_maladie;
    temps_avant_la_mort = tmp_temps_avant_la_mort;
    temps_avant_la_guerison = tmp_temps_avant_la_guerison;
    
    
    nombresCasesX = tmp_nombreCasesX;
    nombresCasesY = tmp_nombreCasesY;
    sizeCaseX = tmp_sizeCaseX;
    sizeCaseY = tmp_sizeCaseY;
 //<>//
    CaseStats = new CellValue[nombresCasesX][nombresCasesY]; //<>//
    for (int i = 0; i < nombresCasesX; i++){
      for (int j = 0; j < nombresCasesY; j++){
        CaseStats[i][j] = new CellValue();
      }
    }
  }
  
  
  
  void Population_initialisation(){
    //set every cell to VIVANT
    for (int i = 0; i < nombresCasesX; i++){
      for (int j = 0; j < nombresCasesY; j++){
        CaseStats[i][j].case_state = Cellules_types.VIVANT;
      }
    }
    
    //set the vacciner
    for (int i = 0; i < nombresCasesX; i++){
      for (int j = 0; j < nombresCasesY; j++){
        if (int(random(1, 100)) <= pourcentage_de_vaccines){
          CaseStats[i][j].case_state = Cellules_types.IMUNISER;
        }
      }
    }
    
    //set the nomber of malade
    int i = 0;
    while (i < nombre_de_malade){
      int x = int(random(0, nombresCasesX));
      int y = int(random(0, nombresCasesY));
      if (CaseStats[x][y].case_state != Cellules_types.MALADE){
        CaseStats[x][y].case_state = Cellules_types.MALADE;
        i++;
      }
    }
  }
  
  
  
  void rules(int x, int y){
    
  }
  
  
  
  void Draw_cases(){
    for (int i = 0; i < nombresCasesX; i++){
      for (int j = 0; j < nombresCasesY; j++){
        switch (CaseStats[i][j].case_state){
          case VIVANT:{
            fill(#00FF00);
            stroke(#00FF00);
            break;
          }
          case IMUNISER:{
            fill(#00A8FF);
            stroke(#00A8FF);
            break;
          }
          case MALADE:{
            fill(#FF0000);
            stroke(#FF0000);
            break;
          }
          case MORT:{
            fill(#000000);
            stroke(#000000);
            break;
          }
        }
        rect(((i * sizeCaseX) + sizeCaseX/2), ((j * sizeCaseY) + (sizeCaseY/2)), sizeCaseX, sizeCaseY);
      }
    }
  }
}
