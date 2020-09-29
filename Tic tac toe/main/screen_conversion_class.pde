public class ScreenConvertor{
  //mode corner (LEFT, TOP)
  int gamePosX;
  int gamePosY;
  int gameSize;
  
  //game information
  float caseSize;
  int sizeBoard;
  
  CaseInformation[][] caseInformation;
  
  ScreenConvertor(int tmp_gamePosX, int tmp_gamePosY, int tmp_gameSize, int tmp_sizeBoard){
    gamePosX = tmp_gamePosX;
    gamePosY = tmp_gamePosY;
    gameSize = tmp_gameSize;
    
    sizeBoard = tmp_sizeBoard;
    
    caseSize = (gameSize / sizeBoard);
    
    caseInformation = new CaseInformation[sizeBoard][sizeBoard];
    for (int i = 0; i < sizeBoard; i++){
      for (int j = 0; j < sizeBoard; j++){
        caseInformation[i][j] = new CaseInformation();
      }
    }
  }
  
  
  
  void drawGame(CaseInformation[][] tmp_caseInformation) {
    caseInformation = tmp_caseInformation;
    
    for (int i = 0; i < sizeBoard; i++){
      for (int j = 0; j < sizeBoard; j++){
        
        drawGridcase(i, j);
        CaseState statue = caseInformation[i][j].state;
        drawPieces(i, j, statue);
      }
    }
  }
  
  
  
  void drawGridcase(int x, int y) {
    stroke(0);
    strokeWeight((caseSize * 2) / 100);
    fill(0, 200, 0);
    rectMode(CENTER);
    
    square (gamePosX + ((x * caseSize) + caseSize/2), gamePosY + ((y * caseSize) + caseSize/2), caseSize);
  }
  
  
  
  void drawPieces(int x, int y, CaseState state){
    switch(state) {
      case EMPTY:{
        break;
      }
      case X:{
        fill(0);
        noStroke();
        textAlign(CENTER, CENTER);
        textSize((caseSize * 60) / 100);
        text("X", gamePosX + ((x * caseSize) + caseSize/2), gamePosY + ((y * caseSize) + caseSize/2));
        break;
      }
      case O:{
        noFill();
        stroke(0);
        strokeWeight((caseSize * 5) / 100);
        circle(gamePosX + ((x * caseSize) + caseSize/2), gamePosY + ((y * caseSize) + caseSize/2), ((caseSize * 60) / 100));
        break;
      }
      default:{
        println("exception drawPieces");
        break;
      }
    }
  }
}
