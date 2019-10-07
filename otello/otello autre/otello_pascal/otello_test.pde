enum Piece {VIDE, NOIRE, BLANC};
enum Couleur {VERT, NOIRE, BLANC};

int numberSquares = 8;
int heightSquares;

int nombreCoup = 0;


Piece[][] squares = new Piece[numberSquares][numberSquares];

void couleur(Couleur c)
{
  switch(c)
  {
    case VERT:
      fill(0, 175, 0);
      break;

    case NOIRE:
      fill(0);
      break;
      
    case BLANC:
      fill(255);
      break;
      
    default:
      noFill();
  }
}


void setup()
{
  
  fullScreen();
  frameRate(60);
  rectMode(CENTER);
  heightSquares = height/numberSquares;
  
  initialisation();
}

void draw()
{
  background(255);
  drawSquares();
  drawPieces();
}



void drawSquares()
{
  for (int i = 0; i < numberSquares; i = i+1 )
  {
    for (int j = 0; j < numberSquares; j = j+1 )
    {
      couleur(Couleur.VERT);
      stroke(0);
      strokeWeight(5);
      rect(i* height/numberSquares + width/2-height/2 + height/numberSquares/2, j* height/numberSquares + height/numberSquares/2, height/numberSquares, height/numberSquares);
    }
  }
}



void drawPieces()
{
  for (int i = 0; i < numberSquares; i = i+1 )
  {
    for (int j = 0; j < numberSquares; j = j+1 )
    {
      switch (squares [i][j])
      {
//        case VIDE:
//          couleur(Couleur.VERT);
//          break;
          
        case NOIRE:
          couleur(Couleur.NOIRE);
          ellipse(i* heightSquares + width/2-height/2 + heightSquares/2, j* heightSquares + heightSquares/2, height/(numberSquares+4), height/(numberSquares+4));
          break;
          
        case BLANC:
          couleur(Couleur.BLANC);
          ellipse(i* heightSquares + width/2-height/2 + heightSquares/2, j* heightSquares + heightSquares/2, height/(numberSquares+4), height/(numberSquares+4));
          break;
          
        default:
          break;
      }
    }
  }
}



void mousePressed()
{
  int squaresY = floor(mouseY/heightSquares);
  int squaresX = floor((mouseX - (width-height)/2)/heightSquares);
  
  if ((squaresX >= 0) && ( squaresX < numberSquares) && (squaresY >= 0) && (squaresY < numberSquares))
  {
    switch (squares[squaresX][squaresY]) 
    {
      case VIDE:
        nombreCoup += 1;
        if (nombreCoup%2 == 0)
        {
          squares[squaresX][squaresY] = Piece.NOIRE;
        }
        else
        {
          squares[squaresX][squaresY] = Piece.BLANC;
        }
        break;
        
      case NOIRE:
        break;
        
      case BLANC:
        break;
        
      default:
        squares[squaresX][squaresY] = Piece.VIDE;    
        break;
    }
  }
}



void initialisation()
{
    for (int i = 0; i < numberSquares; i = i+1 )
  {
    for (int j = 0; j < numberSquares; j = j+1 )
    {
      squares[i][j] = Piece.VIDE;
    }
  }
  
    for (int i = 3; i < 5; i = i+1 )
  {
    for (int j = 3; j < 5; j = j+1 )
    {
      squares[i][j] = Piece.VIDE;
    }
  } 
}



















































//int[] indexConverter(int X, int Y)
//{
//  int x;
//  int y;
//  y = height/8;
//  x = (width/2)-(height/2)+y*X;
//  y *= Y;
//  int[] index = {x, y};
//  return index;
//}
