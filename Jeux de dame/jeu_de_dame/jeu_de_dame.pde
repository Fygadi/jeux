int nombreCases = 8;
int hauteurCase;


boolean[][] pieces = new boolean[nombreCases][nombreCases];


void setup()
{
  
  fullScreen();
  frameRate(60);
  rectMode(CENTER);
  hauteurCase = height/nombreCases;
  
  initialisation();
}

void draw()
{
  background(0);
  dessinCases();
  dessinpieces();
}



void dessinCases()
{
  for (int i = 0; i < nombreCases; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      if ((i+j) %2 == 0)
      {
        fill(255);
      }
      else
      {
        fill(0);
      }
      rect(i* height/nombreCases + width/2-height/2 + height/nombreCases/2, j* height/nombreCases + height/nombreCases/2, height/nombreCases, height/nombreCases);
    }
  }
}



void dessinpieces()
{
  for (int i = 0; i < nombreCases; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      if ((i+j) %2 == 0)
      {
        fill(0);
      }
      else
      {
        fill(255);
      }
      if (pieces [i][j] == false)
      {
        ellipse(i* hauteurCase + width/2-height/2 + hauteurCase/2, j* hauteurCase + hauteurCase/2, height/(nombreCases+4), height/(nombreCases+4));
      }
    }
  }
}



void mouseClicked()
{
  int piecesY = floor(mouseY/hauteurCase);
  int piecesX = floor((mouseX - (width-height)/2)/hauteurCase);
  
  if ((piecesX >= 0) && ( piecesX < nombreCases) && (piecesY >= 0) && (piecesY < nombreCases))
  {
    if (pieces[piecesX][piecesY] == true)
    {
      pieces[piecesX][piecesY] = false;
    }
    else
    {
      pieces[piecesX][piecesY] = true;
    }
  }
}



void initialisation()
{
    for (int i = 3; i < 5; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      pieces[i][j] = true;
    }
  } 
}
