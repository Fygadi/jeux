//Balle
int vitesseX = 22;
int vitesseY = 8;

int posBallX;
int posBallY;

int directionX = -1;
int directionY = -1;

int grandeurBall =32;


//Palletes
//Position palettes
int posPg;
int posPd;

//vitessePalettes
int vitesseP = 5;


//points
int pointG = 0;
int pointD = 0;


//clavier
boolean keyW = false;
boolean keyS = false;

boolean keyUp = false;
boolean keyDown = false;
void setup()
{
  background(0);
  fullScreen();
  frameRate(60);
  
  rectMode(CENTER);
  
  //Ball
  posBallX = width/2;
  posBallY = height/2;
  
  //Palletes
  
  //Position palettes
  posPg = height/2;
  posPd = height/2;
}



void draw()
{
  background(0);
  
  //ball
  posBallX = posBallX + (vitesseX * directionX);
  posBallY = posBallY + (vitesseY * directionY);

  conditionsBall();
  
  //palettes
  conditionPalettes();
  terrain();
}



void dessinBall()
{
  noStroke();
  fill (255, 0, 0);
  ellipse(posBallX, posBallY, grandeurBall, grandeurBall);
}



void conditionsBall()
{
  if (posBallX > width-76)
  {
    if ((posBallY > posPd-85) && (posBallY < posPd+85))
      {
        //if balle touche pallete droite
          posBallX = width-76;
          directionX = -1;
          
       if ((posBallY - posPd)> 0)
       {
          directionY = 1;
       }
       else
       {
          directionY = -1;
       }
       vitesseY = abs(posBallY - posPd)/10;
      }  
    else
    {
      //touche pas pallete droite
    
      posBallX = width/2;
      posBallY = height/2; 
      directionY = 0;
      pointD = pointD+1;
    }
  }
  
  //touche pallete gauche
 
  if (posBallX < 76)
  {
    if ((posBallY > posPg-85) && (posBallY < posPg+85))
    {
      posBallX = 76;
      directionX = 1;
      
       if ((posBallY - posPg)> 0)
       {
          directionY = 1;
       }
       else
       {
          directionY = -1;
       }
       vitesseY = abs(posBallY - posPg)/10;
       
    }
    else 
    {
      posBallX = width/2;
      posBallY = height/2;
      directionY = 0;
      pointG = pointG+1;
    }
  }
  
  
  //haut
  if (posBallY > height-16)
  {
    posBallY = height-16;
    directionY = -1;
  }
  
  //Bas
  if (posBallY < 0+16)
  {
    posBallY = 0+16;
    directionY = 1;
  }
}


void dessin_Palettes()
{
  noStroke();
  fill(255);
  //Palette gauche
  rect(60, posPg, 30, 170);
  
  //Palette Droite
  rect((width-60), posPd, 30, 170);
}



void conditionPalettes()
{
  if (keyUp == true) 
  {
    posPd = posPd-vitesseP;
  }
    
    
  if (keyDown == true) 
  {
    posPd = posPd+vitesseP;
  }
  
  if (keyW == true)
  {
    posPg = posPg-vitesseP;
  }
  
    if (keyS == true)
  {
    posPg = posPg+vitesseP;
  }
  
  
  if (posPg < 85){
   posPg = 85;
  }

  if (posPg > (height-85)){
    posPg = height-85;
  }

  
  if (posPd < 0+85){
   posPd = 0+85;
  }

  if (posPd > height-85){
    posPd = height-85;
  }
}



void points()
{  
  textSize(70);
  fill(255);
  text (pointG, width/2+100,150);
  text (pointD, width/2-135,150);  
  
  if((pointG > 30) || (pointD > 30))
  {    
  textSize(175);
  fill(255, 0, 0);
  text ("Game Over", width/2-500,height/2+50);
  return;
  }
}



void terrain()
{
  fillet();
  points();
  dessinBall();
  dessin_Palettes();
}



void fillet()
{
  noStroke();
  fill(255);
  for(int i = 0; i < height; i = i+1)
  {
    rect(width/2, i * 100, 15, 50);
  }
}



void keyPressed()
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      keyUp = true;
    }
    else if (keyCode == DOWN) 
    {
      keyDown = true;
    }
  }
  else if (key == 'w') 
  {
    keyW =true;
  }
  else if (key == 's') 
  {
    keyS =true;
  }
}



void keyReleased()
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      keyUp = false;
    }
    else if (keyCode == DOWN) 
    {
      keyDown = false;
    }
  }
  else if (key == 'w') 
  {
    keyW =false;
  }
  else if (key == 's') 
  {
    keyS =false;
  }  
}
