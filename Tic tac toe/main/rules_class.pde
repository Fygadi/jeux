public class GameRules {
  int sizeBoard;
  boolean gameOver = false;
  CaseInformation[][] caseInformation = new CaseInformation[sizeBoard][sizeBoard];
  
  
  void rules() {
    //rules 1
    gameOver = true;
    int x = 0, y = 0;
    while (x< sizeBoard && y < sizeBoard){
      if (caseInformation[x][y].state == CaseState.EMPTY) {
        gameOver = false;
        break;
      }
      x++;
      y++;
    }
    
    //rules 2
    gameOver = true;
    for (int i = 0; i < sizeBoard; i++){
      for (int j = 1; j < sizeBoard; j++){
        if (caseInformation[i][j].state != caseInformation[i][j-1].state){
          gameOver = false;
        }
      }
    }
  }
}
