 //Balle
float vitesseX = 6;
float vitesseY = 0;
float vitesse = 999999;

int ballPosX;
int ballPosY;

int directionX = 1;
int directionY = 1;

//points
int pointG = 0;
int pointD = 0;


//palletes
int vitesseP = 2;

//Pallete gauche
int Pg;
int Pd;

//clavier
boolean keyW;
boolean keyS;

boolean keyUp;
boolean keyDown;

void setup(){
  fullScreen();
//size(1366, 768);
frameRate(60);

//clavier
keyW = false;
keyS = false;

keyUp = false;
keyDown = false;

//Pallette
Pg = (height/2);
Pd = (height/2);
//balle
ballPosX = width/2;
ballPosY = height/2;
}

void draw()
{
  vitesseX = sqrt((vitesse * vitesse) - (vitesseY * vitesseY));
  
  if((pointG > 99999) || (pointD > 99999))
  {
    textSize(175);
  fill(255, 0, 0);
  text ("Game Over", width/2-500,height/2+50);
  return;
  }
  background(0);

  textSize(70);
  fill(255);
  text (pointD, width/2-135,150);
  text (pointG, width/2+100,150);


  //Balle

  ballPosX = (int)(ballPosX+(directionX * vitesseX));
  ballPosY = (int)(ballPosY+(directionY * vitesseY));

//balle conditions
  // Cote Droit
 
  if (ballPosX > width-76)
  {
    if ((ballPosY > Pd-85) && (ballPosY < Pd+85))
      {
        //if balle touche pallete droite
          ballPosX = width-76;
          directionX = -1;
          
       if ((ballPosY - Pd)> 0)
       {
          directionY = 1;
       }
       else
       {
          directionY = -1;
       }
       vitesseY = abs(ballPosY - Pd)/3;
      }  
    else
    {
      //touche pas pallete droite
    
      ballPosX = width/2;
      ballPosY = height/2; 
      directionY = 0;
      pointD = pointD+1;
    }
  }
  
  //touche pallete gauche
 
  if (ballPosX < 76)
  {
    if ((ballPosY > Pg-85) && (ballPosY < Pg+85))
    {
      ballPosX = 76;
      directionX = 1;
      
       if ((ballPosY - Pg)> 0)
       {
          directionY = 1;
       }
       else
       {
          directionY = -1;
       }
       vitesseY = abs(ballPosY - Pg)/10;
       
    }
    else 
    {
      ballPosX = width/2;
      ballPosY = height/2;
      directionY = 0;
      pointG = pointG+1;
    }
  }
  
  
  //haut
  if (ballPosY > height-16)
  {
    ballPosY = height-16;
    directionY = -1;
  }
  
  //Bas
  if (ballPosY < 0+16)
  {
    ballPosY = 0+16;
    directionY = 1;
  }
 
  

  //Palletes
  if (keyUp == true) {
        Pg = Pg-vitesseP;
  }
    
    
  if (keyDown == true) 
  {
    Pg = Pg+vitesseP;
  }
  
  
  if (Pd > ballPosY){
    Pd = Pd-vitesseP;
  }
  
    if (Pd < ballPosY){
    Pd = Pd+vitesseP;
  }
  
  
//palletes condition
  //Pallete
  if (Pg < 85){
   Pg = 85;
  }

  if (Pg > (height-85)){
    Pg = height-85;
  }

  //Pallete
  
  if (Pd < 0+85){
   Pd = 0+85;
  }

  if (Pd > height-85){
    Pd = height-85;
  }
  

  //le terrain
  
    stroke(255);
  fill(255);
  
    //filet
  for(int i = 0; i < height; i = i+1){
     rect(width/2, i * 100, 15, 50);
  }
  
  
//Pallete gauche
rect(30, Pg-85, 30, 170);
  
//Pallete droit
rect(width-60, Pd-85, 30, 170);
  
//balle
fill(255, 0, 0);
stroke(255, 0, 0);
ellipse(ballPosX, ballPosY, 32, 32);
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
}
