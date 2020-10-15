public enum State{
  WHITE_ROOK,   //Tour blan
  WHITE_KNIGHT, //Cavalier blan
  WHITE_BISHOP, //Fou blan
  WHITE_KING,   //Roi blan
  WHITE_QUEEN,  //Dame blan
  WHITE_PAWN,   //Pion blan
  
  BLACK_ROOK,   //Tour noir
  BLACK_KNIGHT, //Cavalier noir
  BLACK_BISHOP, //Fou noir
  BLACK_KING,   //Roi noir
  BLACK_QUEEN,  //Dame noir
  BLACK_PAWN,   //Pion noir
  
  EMPTY   //Rien
}

//////////////////////////////
//Class Declaration

Chest chest = new Chest();


//////////////////////////////

void setup(){
  //print table of board
    for (int a = 0; a < 8; a++) {
      for (int b = 0; b < 8; b++) {
        //System.out.format("%3d ", chest.board[b][a]);
        print(chest.board[b][a] + "  ");
      }
      println();
    }
    println();
    println();
}



void draw(){
  
}
