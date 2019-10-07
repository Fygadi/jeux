int nombreCases = 3;
float hauteurCase;
int[][] MatricePieces = new int[nombreCases][nombreCases];



void setup()
{
  frameRate(60);
  fullScreen();
}



void draw()
{
  background(200);
  dessinCases();
  
  
  hauteurCase = height/nombreCases;
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
