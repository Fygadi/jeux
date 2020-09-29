public class tic_tac_toe{  
  int sizeBoardX = 3;
  int sizeBoardY = 3;
  
  float caseSizeX;
  float caseSizeY;
  
  
  int screenPosX1, screenPosY1;
  int screenPosX2, screenPosY2;
  
  int screenBoardSizeX;
  int screenBoardSizeY;
  
  CouleurPieces[][] MatricePieces = new CouleurPieces[sizeBoardX][sizeBoardY];
  
  Game(int tmp_screenPosX1, int tmp_screenPosY1, int tmp_screenPosX2, int tmp_screenPosY2){
    screenPosX1 = tmp_screenPosX1;
    screenPosY1 = tmp_screenPosY1;
    screenPosX2 = tmp_screenPosX2;
    screenPosY2 = tmp_screenPosY2;
    
    if (screenPosX1 >= screenPosX2){
      screenBoardSizeX = screenPosX1 - screenPosX2;
    }
  }
  
  
  void drawGrid(){
  rectMode(CENTER);
  stroke(0);
  fill(0, 200, 0);
  for (int i = 0; i < sizeBoardX; i = i + 1)
  {
    for (int j = 0; j < sizeBoardY; j = j + 1)
    {
      {
        rect (screenPosX1, screenPosY1, screenPosX2, screenPosY2);
      }
    }
  }
}



  void drawPieces(){
    noStroke();
    {
    for (int i = 0; i < sizeBoardX; i = i + 1)
    {
      for (int j = 0; j < sizeBoardY; j = j + 1)
      {
          if (MatricePieces[i][j] == CouleurPieces.BLACK)
          {
            fill(0);
            ellipse (((i * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((j * hauteurCase) + (hauteurCase/2)), hauteurCase - (height/30), hauteurCase - (height/30));
          }
          else if (MatricePieces[i][j] == CouleurPieces.WHITE)
          {
            fill(255);
            ellipse (((i * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((j * hauteurCase) + (hauteurCase/2)), hauteurCase - (height/30), hauteurCase - (height/30));
          }
        }
      }
    }
  }



  void videplateau(){
    for (int i = 0; i < nombreCases; i = i+1 )
    {
      for (int j = 0; j < nombreCases; j = j+1 )
      {
        MatricePieces[i][j] = CouleurPieces.VOID;
      }
    }
  }
}
