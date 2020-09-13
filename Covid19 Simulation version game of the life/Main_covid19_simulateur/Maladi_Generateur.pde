private class Maladi_simulateur{
  int pourcentage_de_vaccines;
  int nombre_de_malade;
  int pourcentage_de_mortalite_de_la_maladie;
  int contagiositer_de_la_maladie;
  int temps_avant_la_mort;
  int temps_avant_la_guerison;
  int imuniter_time_after_malade;
  
  int nombreCasesX;
  int nombreCasesY;
  float sizeCaseX;
  float sizeCaseY;
  
  
  CellValue[][] CaseStats;
  
  
  public Maladi_simulateur(int tmp_pourcentage_de_vaccines, int tmp_nombre_de_malade, int tmp_mortalite_de_la_maladie, int tmp_contagiositer_de_la_maladie, int tmp_temps_avant_la_mort, int tmp_temps_avant_la_guerison, int temp_imuniter_time_after_malade, 
                           int tmp_nombreCasesX, int tmp_nombreCasesY, float tmp_sizeCaseX, float tmp_sizeCaseY){
    pourcentage_de_vaccines = tmp_pourcentage_de_vaccines;
    nombre_de_malade = tmp_nombre_de_malade;
    pourcentage_de_mortalite_de_la_maladie = tmp_mortalite_de_la_maladie;
    contagiositer_de_la_maladie = tmp_contagiositer_de_la_maladie;
    temps_avant_la_mort = tmp_temps_avant_la_mort;
    temps_avant_la_guerison = tmp_temps_avant_la_guerison;
    imuniter_time_after_malade = temp_imuniter_time_after_malade;
    
    
    nombreCasesX = tmp_nombreCasesX;
    nombreCasesY = tmp_nombreCasesY;
    sizeCaseX = tmp_sizeCaseX;
    sizeCaseY = tmp_sizeCaseY;
 //<>//
    CaseStats = new CellValue[nombreCasesX][nombreCasesY]; //<>//
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        CaseStats[i][j] = new CellValue();
      }
    }
  }
  
  
  
  void Population_initialisation(){
    Population_set_vivant();
    
    Population_set_vacciner();
    
    Population_set_malade();
    
    Population_set_resistant();
    
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        CaseStats[i][j].infection_time = 0;
      }
    }
  }
  
  
  
  void Population_set_vivant(){
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        CaseStats[i][j].case_state = Cellules_types.VIVANT;
      }
    }
  }
  
  
  
  void Population_set_vacciner(){
    ArrayList< Pair<Integer,Integer> > vacciner_case = new ArrayList< Pair<Integer,Integer>>();
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        if (CaseStats[i][j].case_state == Cellules_types.VIVANT);
        vacciner_case.add(new Pair(i, j));
      }
    }
    
    int nombre_cell = (nombreCasesX * nombreCasesY);
    int nombre_vacciner = ((nombre_cell * pourcentage_de_vaccines) / 100);
    while (nombre_vacciner > 0){
      int randomCase = (int)random(0, vacciner_case.size()-1);
      
      int x = vacciner_case.get(randomCase).getKey();
      int y = vacciner_case.get(randomCase).getValue();
      vacciner_case.remove(randomCase);
      
      CaseStats[x][y].case_state = Cellules_types.VACCINER;
      nombre_vacciner--;
    }
  }
  
  
  
  void Population_set_malade(){
    ArrayList< Pair<Integer,Integer> > malade_case = new ArrayList< Pair<Integer,Integer>>();
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        if (CaseStats[i][j].case_state == Cellules_types.VIVANT);
        malade_case.add(new Pair(i, j));
      }
    }
    
    int nb_malade = nombre_de_malade;
    while (nb_malade > 0){
      int random_case = (int)random(0, malade_case.size()-1);
      
      int x = malade_case.get(random_case).getKey();
      int y = malade_case.get(random_case).getValue();
      malade_case.remove(random_case);
      
      CaseStats[x][y].case_state = Cellules_types.MALADE;
      nb_malade--;
    }
  }
  
  
  
  void Population_set_resistant(){
    ArrayList< Pair<Integer,Integer> > resistent_case = new ArrayList< Pair<Integer,Integer>>();
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        if (CaseStats[i][j].case_state == Cellules_types.VIVANT);
        resistent_case.add(new Pair(i, j));
      }
    }
    
    int nb_cell = (nombreCasesX * nombreCasesY);
    int nb_resistant = (nb_cell - ((nb_cell * pourcentage_de_mortalite_de_la_maladie) / 100));
    
    while (nb_resistant > 0){
      int randomCase = (int)random(0, resistent_case.size()-1);
      
      int x = resistent_case.get(randomCase).getKey();
      int y = resistent_case.get(randomCase).getValue();
      resistent_case.remove(randomCase);
      
      CaseStats[x][y].resistent = true;
      nb_resistant--;
    }
  }
  
  
  
  
  boolean position_legal(int x, int y){
    boolean accepted;
    if (x >= 0 && x < nombreCasesX && y >= 0 && y < nombreCasesY){
      accepted = true;
    }
    else{
      accepted = false;
    }
    return accepted;
  }
  
  
  
  void rules_all_case(){
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        rules_case(i, j);
      }
    }
  }
  
  
  
  void rules_case(int x, int y){
    switch (CaseStats[x][y].case_state){
      case VIVANT:{
        int nombre_voisin_malades = 0;
        
        for (int i = -1; i <= 1; i++){
          for (int j = -1; j <= 1; j++){
            if (position_legal(x+i, y+j) == true && CaseStats[x+i][y+j].case_state == Cellules_types.MALADE){
              nombre_voisin_malades++;
            }
          }
        }
              
        int probabiliter_de_devenir_malade = nombre_voisin_malades * contagiositer_de_la_maladie;
        if (probabiliter_de_devenir_malade > 0){
          if (int(random(1, 100)) <= probabiliter_de_devenir_malade){
            CaseStats[x][y].case_state = Cellules_types.MALADE;
          }
        }
        break;
      }
      case VACCINER:{
        //do nothing
        break;
      }
      case MALADE:{
        CaseStats[x][y].infection_time++;
        
        if (CaseStats[x][y].resistent == false && CaseStats[x][y].infection_time > temps_avant_la_mort){
          CaseStats[x][y].case_state = Cellules_types.MORT;
        }
        else if (CaseStats[x][y].resistent == true && CaseStats[x][y].infection_time > temps_avant_la_guerison){
          CaseStats[x][y].case_state = Cellules_types.GUERI;
          CaseStats[x][y].infection_time = 0;
        }
        break;
      }
      case MORT:{
        //do nothing
        break;
      }
      case GUERI:{
        CaseStats[x][y].imuniter_time_affter_guerison++;
        if (CaseStats[x][y].imuniter_time_affter_guerison > imuniter_time_after_malade){
          CaseStats[x][y].case_state = Cellules_types.VIVANT;
          CaseStats[x][y].imuniter_time_affter_guerison = 0;
        }
        break;
      }
    }
  }
  
  
  
  void Draw_all_population(){
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        Draw_population(i, j);
      }
    }
  }
  
  
  
  
  void Draw_population(int x, int y){
    switch (CaseStats[x][y].case_state){
      case VIVANT:{
        fill(#00FF00);
        stroke(#00FF00);
        break;
      }
      case VACCINER:{
        fill(#00A8FF);
        stroke(#00A8FF);
        break;
      }
      case MALADE:{
        fill(#FF0000);
        stroke(#FF0000);
        break;
      }
      case GUERI:{
        //fill(#D8FA00);
        //stroke(#D8FA00);
        fill(#166A00);
        stroke(#166A00);
        break;
      }
      case MORT:{
        fill(#000000);
        stroke(#000000);
        break;
      }
    }
    rect(((x * sizeCaseX) + sizeCaseX/2), ((y * sizeCaseY) + (sizeCaseY/2)), sizeCaseX, sizeCaseY);
  }
}
