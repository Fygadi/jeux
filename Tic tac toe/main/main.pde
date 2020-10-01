enum CaseState {
  EMPTY,
  X,
  O
}

int nombreGame = 2;
TicTacToe[] game = new TicTacToe[nombreGame];


void setup() {
  frameRate(144);
  fullScreen(3);
  //size(1200, 800);
  background(200);
  
  //game[0] = new TicTacToe(((width - height) / 2), 0, int(height));
  game[0] = new TicTacToe(0, 0, int(height / 2));
  game[1] = new TicTacToe(height / 2, height / 2, int(height / 2));
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
  for (int i = 0; i < nombreGame; i++){
    if (mouseX > game[i].screenConvertor.gamePosX && mouseX < game[i].screenConvertor.gamePosX + (game[i].screenConvertor.gamePosX + game[i].screenConvertor.gameSize) && 
        mouseY > game[i].screenConvertor.gamePosX && mouseY < game[i].screenConvertor.gamePosX + (game[i].screenConvertor.gamePosY + game[i].screenConvertor.gameSize)){
      println("Click on the game " + i);
      switch (game[i].playeur) {
        case 1: {
          game[i].caseInformation[2][2].state = CaseState.O;
          break;
        }
        case 2: {
          game[i].caseInformation[2][2].state = CaseState.X;
          break;
        }
      }
      break;
    }
  }
}
