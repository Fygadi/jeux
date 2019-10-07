int centreX;
///interface

//rectPlay
int rectPlayTailX;
int rectPlayTailY;
int rectPlayPosCouin;

//rectQuit
int rectQuitTailX;
int rectQuitTailY;
int rectQuitPoscouin;


void setup()
{  
  fullScreen();
  frameRate(60);
  centreX = (width/2);

  //rectPlay
  rectPlayTailX = width/4;
  rectPlayTailY = height/5;
  rectPlayPosCouin = centreX-(rectPlayTailX/2);
  
  //rectQuit
  rectQuitTailX = width/4;
  rectQuitTailY = height/5;
  rectQuitPoscouin = centreX-(rectQuitTailX/2);
}


void draw()
{
  background(0);

  dessinRectPlay();

  if (siRectPlayClick() == true)
  {
    background(0, 0, 100);    
  }
  
  dessinRectQuit();
  
  if (siRectQuitClick(rectQuitPoscouin, rectQuitTailX, rectPlayTailY) == true)
  {
   background(0, 100, 0);
  }
  
}


void dessinRectPlay()
{
  fill(255);
  rect(rectPlayPosCouin, height/17, rectPlayTailX, rectPlayTailY);
  
  fill(255, 0, 0);
  textSize(60);
  text ("Play", centreX-45, height/6);
}

boolean siRectPlayClick()
{
  boolean rcPlay = false;
  
    if ((mousePressed &&
       (mouseX > rectPlayPosCouin)) &&
       (mouseX < (rectPlayPosCouin + rectPlayTailX)) && 
       (mouseY >= height/17) && 
       (mouseY <= ((height/17)+rectPlayTailY)))
  {
    rcPlay = true;
  }
  return rcPlay;
}





void dessinRectQuit()
{
  fill(255);
  rect(rectQuitPoscouin, height/2, rectQuitTailX, rectQuitTailY);
  
  fill(255, 0, 0);
  textSize(60);
  text ("Quit", centreX-45, height/1.6);
}

boolean siRectQuitClick(int l_rectQuitPosCouin, int l_rectQuitX, int l_rectQuitY)
{
  boolean rcQuit = false;
  
    if ((mousePressed &&
       (mouseX > l_rectQuitPosCouin)) &&
       (mouseX < (l_rectQuitPosCouin + l_rectQuitX)) && 
       (mouseY >= height/17) && 
       (mouseY <= ((height/17)+l_rectQuitY)))
  {
    rcQuit = true;
  }
  return rcQuit;
}
