public class TicTacToe {
  int sizeBoard = 3;
  int playeur = 1;
  boolean gameOver = false;
  CaseInformation[][] caseInformation = new CaseInformation[sizeBoard][sizeBoard];
  
  GameRules gameRules = new GameRules(sizeBoard);
  ScreenConvertor screenConvertor;
  
  TicTacToe(int screenGamePosX, int screenGamePosY, int screenGameSize) {
    screenConvertor = new ScreenConvertor(screenGamePosX, screenGamePosY, screenGameSize, sizeBoard);
    
    for (int i = 0; i < sizeBoard; i++) {
      for (int j = 0; j < sizeBoard; j++) {
        caseInformation[i][j] = new CaseInformation();
      }
    }
  }
  
  
  
  void initialisation() {
    
  }
  
  
  
  void restart() {
    for (int i = 0; i < sizeBoard; i++) {
      for (int j = 0; j < sizeBoard; j++) {
        caseInformation[i][j] = new CaseInformation();
      }
    }
  }
}
