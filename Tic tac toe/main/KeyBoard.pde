void keyPressed(){
  if (key == 'r' || key == 'R' || keyCode == ' ') {
    for (int i = 0; i < nombreGame; i++) {
      for (int j = 0; j < game[i].sizeBoard; j++) {
        for (int k = 0; k < game[i].sizeBoard; k++) {
          game[i].caseInformation[j][k].state = CaseState.EMPTY;
          game[i].screenConvertor.drawGame(game[i].caseInformation, game[i].sizeBoard);
          game[i].gameOver = false;
          game[i].playeur = 1;
        }
      }
    }
  }
}
