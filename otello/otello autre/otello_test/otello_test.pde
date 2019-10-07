int joueur = 1;
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
}



void dessinCases()
{
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



void initialisation()
{
    for (int i = 0; i < nombreCases; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      MatricePieces[i][j] = 0;
    }
  }
}




void reglement(int in_X, int in_Y, int in_couleur)
{
  //up
  int i;
  int j;
  boolean ok = false;
  for (j = in_Y+1; j < nombreCases; j = j+1)
  {
    if (MatricePieces[in_X][j] == 0)
    {
      break;
    }
    
    if (MatricePieces[in_X][j] == in_couleur)
    {
      ok = true;
      break;
    }
  }
  
  //trouver
  if (ok == true)
  {
    for (j = in_Y+1; j < nombreCases; j = j+1)
    {
    
      if (MatricePieces[in_X][j] == in_couleur)
      {
        break;
      }
      
      MatricePieces[in_X][j] = in_couleur;
    }
  }
  
  
  //down
  ok = false;
  j = 0;
  for (j = in_Y-1; j > nombreCases; j = j-1)
  {
    if (MatricePieces[in_X][j] == 0)
    {
      break;
    }
    
    if (MatricePieces[in_X][j] == in_couleur)
    {
      ok = true;
      break;
    }
  }
  
  //trouver
  if (ok == true)
  {
    for (j = in_Y-1; j < nombreCases; j = j-1)
    {
    
      if (MatricePieces[in_Y][j] == in_couleur)
      {
        break;
      }
      
      MatricePieces[in_Y][j] = in_couleur;
    }
  }
  
  
  //left
  i = 0;
  ok = false;
  for (i = in_X-1; i > nombreCases; i = i-1)
  {
    if (MatricePieces[i][in_Y] == 0)
    {
      break;
    }
    
    if (MatricePieces[i][in_Y] == in_couleur)
    {
      ok = true;
      break;
    }
  }
  
  //trouver
  if (ok == true)
  {
    for (i = in_X-1; i > nombreCases; i = i-1)
    {
    
      if (MatricePieces[i][in_Y] == in_couleur)
      {
        break;
      }
      
      MatricePieces[i][in_Y] = in_couleur;
    }
  }
  
  
  
  //right
  ok = false;
  i = 0;
  for (i = in_X+1; i < nombreCases; i = i+1)
  {
    if (MatricePieces[i][in_Y] == 0)
    {
      break;
    }
    
    if (MatricePieces[i][in_Y] == in_couleur)
    {
      ok = true;
      break;
    }
  }
  
  //trouver
  if (ok == true)
  {
    for (i = in_X+1; i < nombreCases; i = i+1)
    {
    
      if (MatricePieces[i][in_Y] == in_couleur)
      {
        break;
      }
      
      MatricePieces[i][in_Y] = in_couleur;
    }
  }
  
  
  
  //right
  ok = false;
  i = 0;
  for (i = in_X-1; j > nombreCases; i = i-1)
  {
    if (MatricePieces[i][in_Y] == 0)
    {
      break;
    }
    
    if (MatricePieces[i][in_Y] == in_couleur)
    {
      ok = true;
      break;
    }
  }
  
  //trouver
  if (ok == true)
  {
    for (i = in_X-1; i > nombreCases; i = i-1)
    {
    
      if (MatricePieces[i][in_Y] == in_couleur)
      {
        break;
      }
      
      MatricePieces[i][in_Y] = in_couleur;
    }
  }
}



void ifCarreClicked()
{
  int sourisY = floor(mouseY/hauteurCase);
  int sourisX = floor((mouseX - (width-height)/2)/hauteurCase);
  
  if ((sourisX >= 0) && ( sourisX < nombreCases) && (sourisY >= 0) && (sourisY < hauteurCase))
  {
    if (MatricePieces[sourisX][sourisY] == 0)
    {
      if (joueur == 1)
      {
        MatricePieces[sourisX][sourisY] = 2;
        dernierCoup[0] = sourisX;
        dernierCoup[1] = sourisY;
        joueur = 2;
      }
      else
      {
        MatricePieces[sourisX][sourisY] = 1;
        dernierCoup[0] = sourisX;
        dernierCoup[1] = sourisY;
        joueur = 1;
      }
    }
    reglement(sourisX, sourisY, MatricePieces[sourisX][sourisY]);
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
  if (key == keyCode)
  {
    if (keyCode == BACKSPACE)
    {
      MatricePieces[dernierCoup[0]][dernierCoup[1]] = 0;
      if (joueur == 1)
      {
        joueur = 2;
      }
      else
      {
        joueur = 1;
      }
    }
  }
}
