int vitesseX = 8;
int vitesseY = 8;
int posBallX;
int posBallY;
int directionX = -1;
int directionY = -1;

int grandeurBall =24;

boolean pause = true;


void setup()
{
  background(0);
  fullScreen();
  frameRate(60);
  
  
  posBallX = width/2;
  posBallY = height/2;
}



void draw()
{
  if (pause == true)
  {
    posBallX = posBallX + (vitesseX * directionX);
    posBallY = posBallY + (vitesseY * directionY);
  
    conditionBall();
    dessinBall();
  }
}



void dessinBall()
{
  
  couleurBall();
  ellipse(posBallX, posBallY, grandeurBall, grandeurBall);
}



void conditionBall()
{
  if (posBallX + (grandeurBall/2) >= width)
  {
    directionX = -1;
  }

  if (posBallX - (grandeurBall/2) <= 0)
  {
    directionX = +1;
  }

  if (posBallY + (grandeurBall/2) >= height)
  {
    directionY = -1;
  }
  
  if (posBallY - (grandeurBall/2) <= 0)
  {
    directionY = +1;
  }
}



void couleurBall()
{  
  stroke (0);
  fill (posBallX % 256, 100, posBallY % 256, 256);
}



void keyPressed()
{
  if (key == 'r')
  {
    background(0);
  }
  
  if (key == 'p')
  {
    if (pause == true)
    {
      pause = false;
    }
    else
    {
      pause = true;
    }
  }
}
