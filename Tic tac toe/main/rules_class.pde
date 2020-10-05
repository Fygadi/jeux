public class GameRules {
  int sizeBoard;
  //CaseInformation[][] caseInformation = new CaseInformation[sizeBoard][sizeBoard];
  
  GameRules(int tmp_sizeBoard){
    sizeBoard = tmp_sizeBoard;
  
}
  
  
  
  
  boolean rules(CaseInformation[][] caseInformation) {
    //rules 0
    boolean gameOver0 = true;
    //all case is not EMPTY
    for (int i = 0; i < sizeBoard; i++) {
      for (int j = 0; j < sizeBoard; j++) {
        if (caseInformation[i][j].state == CaseState.EMPTY){
          gameOver0 = false;
        }
      }
    }
    
    
    
    //rules 1
    boolean gameOver1 = false;
    for (int i = 0; i < sizeBoard; i++){
      boolean lineOver = true;
      for (int j = 1; j < sizeBoard; j++){
        if (caseInformation[i][j].state == CaseState.EMPTY || caseInformation[i][j].state != caseInformation[i][j-1].state){
          lineOver = false;
          break;
        }
      }
      if(lineOver){
       gameOver1 = true; 
       break;
      }
    }
    
    for (int j = 0; j < sizeBoard; j++){
      boolean lineOver = true;
      for (int i = 1; i < sizeBoard; i++){
        if (caseInformation[i][j].state == CaseState.EMPTY || caseInformation[i][j].state != caseInformation[i-1][j].state){
          lineOver = false;
          break;
        }
      }
      if(lineOver){
       gameOver1 = true; 
       break;
      }
    }
    
    
    
    //rules 2
    boolean gameOver2 = false;
    boolean lineOver2 = true;
      for (int i = 1; i < sizeBoard; i++) {
        if (caseInformation[i][i].state == CaseState.EMPTY || caseInformation[i][i].state != caseInformation[i-1][i-1].state){
          lineOver2 = false;
          break;
        }
      }
      if(lineOver2){
       gameOver2 = true; 
      }
      
      lineOver2 = true;
      for (int i = sizeBoard-1; i > 0; i++) {
        for (int j = 1; i < sizeBoard; i++) {
          if (caseInformation[i][j].state == CaseState.EMPTY || caseInformation[i][j].state != caseInformation[i-1][j+1].state){
            lineOver2 = false;
            break;
          }
        }
      }
      if(lineOver2){
       gameOver2 = true; 
      }
      
    
    
    if (gameOver0 == true|| gameOver1 == true || gameOver2 == true){
      return true;
    }
    return false;
  }
}
