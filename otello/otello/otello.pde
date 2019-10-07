boolean DEBUG = true;

int joueur = 2;
int nombreCases = 8;
int hauteurCase;

int[] dernierCoup = new int[2];

//0 == VIDE
//1 == NOIRE
//2 == BLANC
int[][] MatricePieces = new int[nombreCases][nombreCases];


void setup()
{
  hauteurCase = height/nombreCases;
  
  frameRate(60);
  fullScreen();
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  initialisation();
}



void draw()
{
  background(200);
  
  dessinCases();
  dessinPieces();
  dessinCursseur();
  dessinPiecesChaqueCouleur();
}



void initialisation()
{
  videplateau();
  
  MatricePieces[3][3] = 1;
  MatricePieces[4][4] = 1;
  MatricePieces[4][3] = 2;
  MatricePieces[3][4] = 2;
}



void videplateau()
{
  for (int i = 0; i < nombreCases; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      MatricePieces[i][j] = 0;
    }
  }
}



void dessinCases()
{
  stroke(0);
  for (int i = 0; i < nombreCases; i = i + 1)
  {
    for (int j = 0; j < nombreCases; j = j + 1)
    {
      {
        fill(0, 200, 0);
        rect (((i * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((j * hauteurCase) + (hauteurCase/2)), hauteurCase, hauteurCase);
      }
    }
  }
}



void dessinPieces()
{
  stroke(0);
  {
  for (int i = 0; i < nombreCases; i = i + 1)
  {
    for (int j = 0; j < nombreCases; j = j + 1)
    {
        if (MatricePieces[i][j] == 1)
        {
          fill(0);
          ellipse (((i * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((j * hauteurCase) + (hauteurCase/2)), hauteurCase - (height/30), hauteurCase - (height/30));
        }
        else if (MatricePieces[i][j] == 2)
        {
          fill(255);
          ellipse (((i * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((j * hauteurCase) + (hauteurCase/2)), hauteurCase - (height/30), hauteurCase - (height/30));
        }
      }
    }
  }
}



void ifCarreClicked()
{
  int sourisX = floor((mouseX - (width-height)/2)/hauteurCase);
  int sourisY = floor(mouseY/hauteurCase);
  
  if ((sourisX >= 0) && ( sourisX < nombreCases) && (sourisY >= 0) && (sourisY < hauteurCase))
  {
    VerifieFlipEnplacement(sourisX, sourisY, joueur);
  }
}




void dessinCursseur()
{
  int sourisX = floor((mouseX - (width-height)/2)/hauteurCase);
  int sourisY = floor(mouseY/hauteurCase);
  
  if ((sourisX >= 0) && ( sourisX < nombreCases) && (sourisY >= 0) && (sourisY < hauteurCase))
  {
    if (MatricePieces[sourisX][sourisY] == 0)
    {
        boolean coupAccepter = false;

        for (int dir=0; dir<8; dir++)
        {
          if (nombrePieceCapturer(sourisX,sourisY,joueur, dir) > 0)
          {
             coupAccepter = true;
             break;
          }
        }

      
      
      
      noStroke();
      if (coupAccepter == false)
      {
        //if coup refuser
        fill(255, 0, 0);
      }
      else
      {
        //if coup accepter
        if (joueur == 2)
        {
          fill(255);
        }
        else fill(0);
      }
      ellipse (((sourisX * hauteurCase + ((width-height)/2)) + hauteurCase/2), ((sourisY * hauteurCase) + (hauteurCase/2)), hauteurCase - (height/30), hauteurCase - (height/30));
    }
  }
}


void mousePressed()
{
  if (mousePressed && (mouseButton == LEFT) || mouseButton == RIGHT)
  {
    ifCarreClicked();
  }
}



void keyPressed()
{
  
  if (key == 'r' || key == 'R')
  {
    initialisation();
  }
  
  if (key == 'n')
  {
    if (joueur == 1)
    {
      joueur = 2;
    }
    else joueur = 1;
  }
  
  if (DEBUG == true)
  {
    test();
  }
}





void VerifieFlipEnplacement(int x, int y, int couleur)
{
  if (MatricePieces[x][y] != 0)
  {
    return;
  }
  
  
  // Joueur doit captuer piece de l adversion si non il passe son tour.

  // Verifier que la case que le joueur a selectionner permet de touner au moin une piece de l adversaire.

  boolean coupAccepter = false;

  for (int dir=0; dir<8; dir++)
  { //<>//
    if (nombrePieceCapturer(x,y,couleur, dir) > 0)
    {       
       coupAccepter = true;
       break;
    }
  }

  if (coupAccepter == false)
  {
    return;
  }
  else
  {
    // Mettre la piece que le joueur a cliker dessus..
    MatricePieces[x][y] = couleur;
    dernierCoup[0] = x;
    dernierCoup[1] = y;
    
    if (joueur == 1)
    { 
      joueur = 2;
    }
    else 
    {
      joueur =1;
    }
    
    // FLIP LES PICES
    int nbPiece;
    for (int dir=0; dir<8; dir++)
    {
      nbPiece = nombrePieceCapturer(x,y,couleur, dir);
      flipPieces (x, y, couleur, dir, nbPiece);
    }
  }
}



// INT: x : Position X de la piece que le joueur veux jouer.
// INT: y : Position Y de la piece que le joueur veux jouer.
//     couleur:         Couleur de la piece du joueur
//     dir:             1 des 8 Direction possible
// OUT Retourne le nombre de piece capturer
//
int nombrePieceCapturer(int x, int y, int couleur, int direction)
{

//  Notation pour les 8 direction possible
//
//        7     0     1
//         ╲    │    ╱
//          ╲   │   ╱
//           ╲  │  ╱
//            ━━━━━
//  6 <────── ┃ X | ──────> 2
//            ━━━━━
//           ╱  │  ╲
//          ╱   │   ╲
//         ╱    │    ╲
//         5    4     3


  // Trouve nombre  piece capturer
  int nbPiece = 0;


  switch (direction)
  {

    case 0: // Direction: 0
    {
      for (int j=y-1; j>= 0; j--)
      {
        if (MatricePieces[x][j] == couleur)
        {
          nbPiece = y-j-1 ;
          break;
        }
        else if (MatricePieces[x][j] == 0)
        {
          break;
        }
      }
    }
    break;

    case 1: // Direction: 1
    {
      for (int i=x+1, j=y-1; i < nombreCases && j>=0; i++, j--)
      {
        if (MatricePieces[i][j] == couleur)
        {
          nbPiece = y-j-1;
          break;
        }
        else if (MatricePieces[i][j] == 0)
        {
          break;
        }
      }
    }
    break;

    case 2: // Direction: 2
    {
      for (int i=x+1; i<nombreCases; i++)
      {
        if (MatricePieces[i][y] == couleur)
        {
          // Au moin un piece de capturer
          nbPiece = i-x-1;
          break;
        }
        else if (MatricePieces[i][y] == 0)
        {
          break;
        }
      }
    }
    break;

    case 3: // Direction: 3
    {
      for (int i=x+1, j=y+1; i < nombreCases && j<nombreCases; i++, j++)
      {
        if (MatricePieces[i][j] == couleur)
        {
          nbPiece = j-y-1;
          break;
        }
        else if (MatricePieces[i][j] == 0)
        {
          break;
        }
      }
    }
    break;

    case 4: // Direction: 4
    {
      for (int j=y+1; j<nombreCases; j++)
      {
        if (MatricePieces[x][j] == couleur)
        {
          nbPiece = j-y-1;
          break;
        }
        else if (MatricePieces[x][j] == 0)
        {
          break;
        }
      }
    }
    break;

    case 5: // Direction: 5
    {
      for (int i=x-1, j=y+1; i >= 0 && j<nombreCases; i--, j++)
      {
        if (MatricePieces[i][j] == couleur)
        {
          nbPiece = j-y-1;
          break;
        }
        else if (MatricePieces[i][j] == 0)
        {
          break;
        }
      }
    }
    break;

    case 6: // Direction: 6
    {
      for (int i=x-1; i>= 0; i--)
      {
        if (MatricePieces[i][y] == couleur)
        {
          nbPiece = x-i-1;
          break;
        }
        else if (MatricePieces[i][y] == 0)
        {
          break;
        }
      }
    }
    break;

    case 7: // Direction: 7
    {
      for (int i=x-1, j=y-1; i >= 0 && j>=0; i--, j--)
      {
        if (MatricePieces[i][j] == couleur)
        {
          nbPiece = y-j-1;
          break;
        }
        else if (MatricePieces[i][j] == 0)
        {
          break;
        }
      }
    }
    break;

    default:
  }

  return (nbPiece);
}



// IN: x :              Position X de la piece que le joueur joue.
//     y :              Position Y de la piece que le joueur joue.
//     couleur:         Couleur de la piece du joueur
//     dir:             1 des 8 Direction possible
//     nombrePieceFlip: Nombre de piece a flipper
void flipPieces (int x, int y, int couleur, int dir, int nombrePieceFlip)
{

  //  Notation pour les 8 direction possible
  //
  //        7     0     1
  //         ╲    │    ╱
  //          ╲   │   ╱
  //           ╲  │  ╱
  //            ━━━━━
  //  6 <────── ┃ X | ──────> 2
  //            ━━━━━
  //           ╱  │  ╲
  //          ╱   │   ╲
  //         ╱    │    ╲
  //         5    4     3

  int i, j;
  int idx;

  switch (dir)
  {

    case 0: // Direction: 0
    {
      j=y-1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[x][j] = couleur;
        j--;
      }
    }
    break;

    case 1: // Direction: 1
    {
      i=x+1;
      j=y-1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][j] = couleur;
        i++;
        j--;
      }
    }
    break;

    case 2: // Direction: 2
    {
      i=x+1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][y] = couleur;
        i++;
      }
    }
    break;

    case 3: // Direction: 3
    {
      i=x+1;
      j=y+1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][j] = couleur;
        i++;
        j++;
      }
    }
    break;

    case 4: // Direction: 4
    {
      j=y+1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[x][j] = couleur;
        j++;
      }
    }
    break;

    case 5: // Direction: 5
    {
      i=x-1;
      j=y+1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][j] = couleur;
        i--;
        j++;
      }
    }
    break;

    case 6: // Direction: 6
    {
      i=x-1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][y] = couleur;
        i--;
      }
    }
    break;

    case 7: // Direction: 7
    {
      i=x-1;
      j=y-1;
      for (idx=0; idx<nombrePieceFlip;idx++)
      {
        MatricePieces[i][j] = couleur;
        i--;
        j--;
      }
    }
    break;

    default:
  }
}


  //        7     0     1
  //         ╲    │    ╱
  //          ╲   │   ╱
  //           ╲  │  ╱
  //            ━━━━━
  //  6 <────── ┃ X | ──────> 2
  //            ━━━━━
  //           ╱  │  ╲
  //          ╱   │   ╲
  //         ╱    │    ╲
  //         5    4     3


void test0()
{
  MatricePieces[0][0] = 2;
  MatricePieces[0][1] = 1;
  MatricePieces[0][2] = 1;
  MatricePieces[0][3] = 1; 
}



void test1()
{
  MatricePieces[0][7] = 0;
  MatricePieces[1][6] = 1;
  MatricePieces[2][5] = 1;
  MatricePieces[3][4] = 2; 
}

void test2()
{
  MatricePieces[0][0] = 0;
  MatricePieces[1][0] = 1;
  MatricePieces[2][0] = 1;
  MatricePieces[3][0] = 2; 
}


void test3()
{
  MatricePieces[0][0] = 0;
  MatricePieces[1][1] = 1;
  MatricePieces[2][2] = 1;
  MatricePieces[3][3] = 2; 
}


void test4()
{
  MatricePieces[0][0] = 0;
  MatricePieces[0][1] = 1;
  MatricePieces[0][2] = 1;
  MatricePieces[0][3] = 2; 
}


void test5()
{
  MatricePieces[0][7] = 2;
  MatricePieces[1][6] = 1;
  MatricePieces[2][5] = 1;
  MatricePieces[3][4] = 0; 
}


void test6()
{
  MatricePieces[0][0] = 2;
  MatricePieces[1][0] = 1;
  MatricePieces[2][0] = 1;
  MatricePieces[3][0] = 1; 
}


void test7()
{
  MatricePieces[0][0] = 2;
  MatricePieces[1][1] = 1;
  MatricePieces[2][2] = 1;
  MatricePieces[3][3] = 1; 
}



void test()
{
  switch(key)
  {
    case '0':
      joueur = 2;
      videplateau();
      test0(); 
      break;
      
    case '1':
      joueur = 2;
      videplateau();
      test1();
      break;
      
    case '2':
      joueur = 2;
      videplateau();
      test2();
      break;
      
    case '3':
      joueur = 2;
      videplateau();
      test3();
      break;
      
    case '4':
      joueur = 2;
      videplateau();
      test4();
      break;
      
    case '5':
      joueur = 2;
      videplateau();
      test5();
      break;
      
    case '6':
      joueur = 2;
      videplateau();
      test6();
      break;
      
    case '7':
      joueur = 2;
      videplateau();
      test7();
      break;
      
      default:
  }
}


//dessin le texte du nombre de pieces de chaque couleur 
void dessinPiecesChaqueCouleur()
{
  textAlign(LEFT);
  textSize(35);
  fill(255, 0, 0);
  int[] x={0,0,0};

  x = nombrePiecesChaqueCouleur();
 
 text("nombre blanc = " + x[2], 30, height/8); //<>//
 text("nombre noire = " + x[1], 30, height/8 + 60);
 }

//calcule le nombre de pieces de chaque couleur
int[] nombrePiecesChaqueCouleur()
{
  int[] nombreChaqueCouleur={0,0,0};
  
  int nombrePiecesBlanche = 0;
  int nombrePiecesNoir = 0;
  int nombreCasesVide = 0;
  
  
  for (int i = 0; i < nombreCases; i++)
  {
    for (int j = 0; j < nombreCases; j++)
    {
      if (MatricePieces[i][j] == 2)
      {
        nombrePiecesBlanche = nombrePiecesBlanche + 1;
      }
      
      else if (MatricePieces[i][j] == 1)
      {
        nombrePiecesNoir = nombrePiecesNoir + 1;
      }
      else 
      {
        nombreCasesVide = nombreCasesVide + 1;
      }
    }
  }
  
  nombreChaqueCouleur[0] = nombreCasesVide;
  nombreChaqueCouleur[1] = nombrePiecesNoir;
  nombreChaqueCouleur[2] = nombrePiecesBlanche;
   //<>//
  return nombreChaqueCouleur;
}
