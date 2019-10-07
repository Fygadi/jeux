void setup()  {
  fullScreen();
  background(0);
}
void draw()
{
  {
    if(keyPressed == true)
    background(0);
  }
 
  if (mousePressed && (mouseButton == RIGHT))
  {
     color c1 = color(0 , mouseY, mouseX, 155);
     fill(c1);
    stroke(mouseY, 130, mouseX);
    rect (mouseX-30, mouseY-40, 70, 100);
  }
  
  if (mousePressed && (mouseButton == LEFT))
  {
     color c1 = color(0 , mouseY/2, 300, mouseX/3);
     fill(c1);
     stroke(mouseX*3, 220, mouseY/4);
     ellipse (mouseX, mouseY, 70, 70);
  }
     
     // if (mousePressed && (mouseButton == RIGHT))
  {
   // triangle (mouseX, mouseY, mouseX/2, mouseY/2, mouseY-100, mouseX+100);
   // stroke(0, 0, 0, 0);
  }
}
