int nombreCases = 3;
float hauteurCase;
int[][] MatricePieces = new int[nombreCases][nombreCases];



void setup()
{
  frameRate(90);
  fullScreen();
  
  hauteurCase = (float) height/nombreCases;
  
  videplateau();
}



enum CouleurPieces
{
  Vide,
  Blanc,
  Noir
}



void draw()
{
  background(200);
  dessinCases();
  dessinPieces();
}



void dessinCases()
{
  rectMode(CENTER);
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
  noStroke();
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



void videplateau()
{
  for (int i = 0; i < nombreCases; i = i+1 )
  {
    for (int j = 0; j < nombreCases; j = j+1 )
    {
      MatricePieces[i][j] = CouleurPieces.Vide;
    }
  }
}



void mousePressed()
{
  if (mousePressed && (mouseButton == LEFT) || mouseButton == RIGHT)
  {
    
  }
}
