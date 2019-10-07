void setup()  
{
  fullScreen();
  background(0);

}
void draw()
{
    noFill();
    
    if (mousePressed == true) 
    {
  ellipse(mouseX, mouseY, 70, 70);
    }
}   

void keyPressed()
{
  if (keyCode == '1') 
  {
  stroke(0, 0, 0);
  fill(0, 0, 0);
  }
  
    if (keyCode == '2') 
  {
  stroke(255);
  }
  
    if (keyCode == '3') 
  {
  stroke(255, 0, 0);
  }
  
    if (keyCode == '4') 
  {
  stroke(0, 255, 0);
  }
 
    if (keyCode == '5') 
  {
  stroke(255, 255, 0);
  }
  
    if (keyCode == '6') 
  {
  stroke(0, 100, 0);
  }
  
    if (keyCode == '7') 
  {
  stroke(0, 0, 0);
  }
  
    if (keyCode == '8') 
  {
  stroke(0, 0, 0);
  }
  
      if (keyCode == '9') 
  {
  stroke(0, 0, 0);
  }
  
        if (keyCode == '0') 
  {
  background(0);
  }
}
