import java.util.ArrayList;
import java.util.Collections;

ArrayList<Integer > score = new ArrayList < Integer >();


boolean rectGreen = false;

boolean pause = false;

int timeWaitGreen = (int) random(3000, 7000);
int grandeurRect = 250;

int timeClicked = 0;
int resultat = 0;
int restart = 0;

void setup()
{
  fullScreen();
  frameRate(60);
}



void draw()
{
  background(0);

  vert();
  dessinRect();
  
  dessinPoints();
  desisnScore();
  dessinMoyen();
}



void dessinRect()
{
   rect(width/2-(grandeurRect/2), height/2-(grandeurRect/2), grandeurRect, grandeurRect ); 
}



void vert()
{
  if (millis() >= timeWaitGreen)
  {
    rectGreen = true;
  }
  
    if (rectGreen == true)
  {
    fill(0, 255, 0);
  }
  else
  {
    fill(255, 0, 0);
  }
}



void mousePressedRect()
{
  if ((rectGreen == true) &&
      mouseX >= (width/2)-(grandeurRect/2) &&
      mouseX <= (width/2)+(grandeurRect/2) &&
      mouseY >= (height/2)-(grandeurRect/2) &&
      mouseY <= (height/2)+(grandeurRect/2))
  {
    background(255, 189, 0);
    
    pause = true;
    timeClicked = millis();
    resultat = (timeClicked-timeWaitGreen);
    score.add(resultat);
    Collections.sort(score);
  }
}



void restart()
{
  restart = millis();
  timeWaitGreen = (int) random(3000, 7000) + restart;
  
  rectGreen =false;
  pause = false;
  resultat = 0;
}



void dessinPoints()
{
  fill(255);
  textAlign(CENTER, TOP);
  textSize(70);
  text(resultat, (width/2), 150);
}



void desisnScore()
{
  textAlign(RIGHT, TOP);
  for (int i = 0; i < score.size(); i = i+1)
  {    
    text (score.get(i), width - width/30, i * (height/10));
  }
}



void dessinMoyen()
{
  int total = 0;
  for(int i = 0; i < score.size(); i = i + 1)
  {
    total = total + score.get(i);
  }
  
  if (score.size() != 0)
  {
    textAlign(CENTER, CENTER);
    textSize(70);
    text(total/score.size(), width/2, (height/2) +250);
  }
}



void mousePressed()
{
  if (pause == false)
  {
    mousePressedRect();
  }
}



void keyPressed()
{
    if ((key == 'r') || (key == 'R'))
  {
    restart();
  }
}
