void setup()
{
  fullScreen();
  frameRate(1);
  

}

void draw()
{

  background(0);
  
  textSize(70);
  fill(255);
  crash(0);
}




void crash(int points)
{
  
  points = points+1;
  
  if (points == 9999)
  {
    return;
  }
  

  text (points, width/2-35,150);
  
    crash(points);
}
