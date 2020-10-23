public class BoardData{
  int gamePosX = 0;
  int gamePosY = 0;
  int boardSize = height;
  int nbCase = 30;
  float caseSize = height/nbCase;
  
  
  BoardData(){
  
  }
  
  
  
void SetBoard(int tmp_gamePosX, int tmp_gamePosY, int tmp_boardSize, int tmp_nbCase){
    gamePosX = tmp_gamePosX;
    gamePosY = tmp_gamePosY;
    boardSize = tmp_boardSize;
    
    caseSize = ((float)boardSize / tmp_nbCase);
  }
}
