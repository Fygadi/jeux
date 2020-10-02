public class GameRules {
  int sizeBoard;
  CaseInformation[][] caseInformation = new CaseInformation[sizeBoard][sizeBoard];
  
  
  boolean rules() {
    boolean gameOver = true;
    //rules 1
    //all case is not EMPTY
    for (int i = 0; i < sizeBoard; i++) {
      for (int j = 0; j < sizeBoard; j++) {
        if (caseInformation[i][j].state == CaseState.EMPTY){
          gameOver = false;
          println("rule 2 GameOver == " + gameOver);
        }
      }
    }
    
    
    //rules 2
    for (int i = 0; i < sizeBoard; i++){
      for (int j = 1; j < sizeBoard + 1; j++){
        if (caseInformation[i][j].state != caseInformation[i][j-1].state){
          gameOver = false;
          println("rule 2 GameOver == " + gameOver);
        }
      }
    }
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    text("Game over", width / 2, height / 2);
    
    return gameOver;
  }
}
