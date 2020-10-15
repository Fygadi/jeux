private class Chest{
  State[][] board = new State[8][8];
  
  
  public Chest(){
    BoardInitialisation();
  }
  
  
  
  void BoardInitialisation(){
    //   0 1 2 3 4 5 6 7
    //
    //0  1 1 1 1 1 1 1 1
    //1  1 1 1 1 1 1 1 1
    //2  0 0 0 0 0 0 0 0
    //3  0 0 0 0 0 0 0 0
    //4  0 0 0 0 0 0 0 0
    //5  0 0 0 0 0 0 0 0
    //6  1 1 1 1 1 1 1 1
    //7  1 1 1 1 1 1 1 1
    
    board[0][0] = State.WHITE_ROOK;  board[1][0] = State.WHITE_KNIGHT;  board[2][0] = State.WHITE_BISHOP;  board[3][0] = State.WHITE_QUEEN;  board[4][0] = State.WHITE_KING;  board[5][0] = State.WHITE_BISHOP;  board[6][0] = State.WHITE_KNIGHT;  board[7][0] = State.WHITE_ROOK;
    board[0][1] = State.WHITE_PAWN;  board[1][1] = State.WHITE_PAWN;  board[2][1] = State.WHITE_PAWN;  board[3][1] = State.WHITE_PAWN;  board[4][1] = State.WHITE_PAWN;  board[5][1] = State.WHITE_PAWN;  board[6][1] = State.WHITE_PAWN;  board[7][1] = State.WHITE_PAWN;
    
    board[0][2] = State.EMPTY;  board[1][2] = State.EMPTY;  board[2][2] = State.EMPTY;  board[3][2] = State.EMPTY;  board[4][2] = State.EMPTY;  board[5][2] = State.EMPTY;  board[6][2] = State.EMPTY;  board[7][2] = State.EMPTY;
    board[0][3] = State.EMPTY;  board[1][3] = State.EMPTY;  board[2][3] = State.EMPTY;  board[3][3] = State.EMPTY;  board[4][3] = State.EMPTY;  board[5][3] = State.EMPTY;  board[6][3] = State.EMPTY;  board[7][3] = State.EMPTY;
    board[0][4] = State.EMPTY;  board[1][4] = State.EMPTY;  board[2][4] = State.EMPTY;  board[3][4] = State.EMPTY;  board[4][4] = State.EMPTY;  board[5][4] = State.EMPTY;  board[6][4] = State.EMPTY;  board[7][4] = State.EMPTY;
    board[0][5] = State.EMPTY;  board[1][5] = State.EMPTY;  board[2][5] = State.EMPTY;  board[3][5] = State.EMPTY;  board[4][5] = State.EMPTY;  board[5][5] = State.EMPTY;  board[6][5] = State.EMPTY;  board[7][5] = State.EMPTY;
    
    board[0][6] = State.BLACK_PAWN;  board[1][6] = State.BLACK_PAWN;  board[2][6] = State.BLACK_PAWN;  board[3][6] = State.BLACK_PAWN;  board[4][6] = State.BLACK_PAWN;  board[5][6] = State.BLACK_PAWN;  board[6][6] = State.BLACK_PAWN;  board[7][6] = State.BLACK_PAWN;
    board[0][7] = State.BLACK_ROOK;  board[1][7] = State.BLACK_KNIGHT;  board[2][7] = State.BLACK_BISHOP;  board[3][7] = State.BLACK_QUEEN;  board[4][7] = State.BLACK_KING;  board[5][7] = State.BLACK_BISHOP;  board[6][7] = State.BLACK_KNIGHT;  board[7][7] = State.BLACK_ROOK;
  }
}
