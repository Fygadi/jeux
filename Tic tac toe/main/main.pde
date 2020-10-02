enum CaseState {
  EMPTY,
  X,
  O
}

int nombreGame = 4;
TicTacToe[] game = new TicTacToe[nombreGame];


void setup() {
  frameRate(144);
  fullScreen(3);
  //size(800, 800);
  background(200);
  
  int value = (height / 2) - 10;
  //game[0] = new TicTacToe(((width - height) / 2), 0, int(height));
  game[0] = new TicTacToe(0, 0, value);
  game[1] = new TicTacToe(value + 10, 0, value);
  game[2] = new TicTacToe(0, value + 10, value);
  game[3] = new TicTacToe(value + 10, value + 10, value);
  initialisation();
}



void draw() {
  
}



void initialisation() {
  for (int i = 0; i < nombreGame; i++){
    game[i].screenConvertor.drawGame(game[i].caseInformation, game[i].sizeBoard);
  }
}



void mousePressed() {
  for (int i = 0; i < nombreGame; i++) {
    if (mouseX > (game[i].screenConvertor.gamePosX) && mouseX < (game[i].screenConvertor.gamePosX + game[i].screenConvertor.gameSize) && 
        mouseY > (game[i].screenConvertor.gamePosY) && mouseY < (game[i].screenConvertor.gamePosY + game[i].screenConvertor.gameSize)){
      int caseX = int((mouseX - game[i].screenConvertor.gamePosX) / (game[i].screenConvertor.caseSize));
      int caseY = int((mouseY - game[i].screenConvertor.gamePosY) / (game[i].screenConvertor.caseSize));      
      
      if (game[i].caseInformation[caseX][caseY].state == CaseState.EMPTY) {
        switch (game[i].playeur) {
          case 1: {
            game[i].caseInformation[caseX][caseY].state = CaseState.O;
            break;
          }
          case 2: {
            game[i].caseInformation[caseX][caseY].state = CaseState.X;
            break;
          }
        }
        game[i].screenConvertor.drawPieces(caseX, caseY, game[i].caseInformation[caseX][caseY].state);
        if (game[i].playeur == 1){
          game[i].playeur = 2;
        }
        else {
          game[i].playeur = 1;
        }
      }
      
      if (game[i].gameRules.rules() == true);
      game[i].gameOver = true;
      break;
    }
  }
}
