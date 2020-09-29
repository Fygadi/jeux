String gridMode = "CORNER";

enum CouleurPieces
{
  VOID,
  WHITE,
  BLACK
}

Game game = new Game();



void setup()
{
  frameRate(90);
  fullScreen();
  
  
  game.videplateau();
}



void draw()
{
  background(200);
  game.drawGrid();
  game.drawPieces();
}



void GridMode(String str){
    switch (str){
      case "SQUARE":{
        gridMode = "SQUARE";
        break;
      }
      case "RECT":{
        gridMode = "RECT";
        break;
      }
      default:{
        println("GridMode exception string: " + str);
        break;
      }
    }
  }
