int nombreCase = 150;
int generations = 0;
int hauteurCase;
int ips = 5;

boolean pause = false;

boolean[][] cases = new boolean[nombreCase][nombreCase];

boolean[][] tmp_cases = new boolean[nombreCase][nombreCase];

void setup()
{
  fullScreen();
  hauteurCase = height/nombreCase;
  initialisation();
}

void draw()
{
  frameRate(ips);
  background(0);
  dessinCases();
  dessinText();

  if (pause == false)
  {
    regles();
    generations = generations +1;
  }


}



void initialisation()
{
   
   for (int i = 0; i < nombreCase; i = i+1)
  {
    for (int j = 0; j < nombreCase; j = j+1)
    {
      if (random (0, 4) < 1)
      {
        cases[i][j] = true;
      }
      else
      {
        cases[i][j] = false; 
      }
    }
  }
}





void dessinCases()
{
  for (int i = 0; i < nombreCase; i = i+1 )
  {
    for (int j = 0; j < nombreCase; j = j+1 )
    {
      if (cases[i][j] == true)
      {
        fill(255, 0, 0);

      }
      else
      {
        fill(255);
      }
      rect(i* hauteurCase + width/2-height/2, j* hauteurCase, hauteurCase, hauteurCase);
    }
  }
}


int totalVoisin(int x, int y)
{
  int voisin = 0;

  //voisin diagonal
  for (int indexX = -1; indexX < 2; indexX = indexX+1)
  {
    for (int indexY = -1; indexY < 2; indexY = indexY+1)
    {
      if (cases[x+indexX][y+indexY] == true)
      {
        voisin = voisin+1;
      }
    }
  }
  if (cases[x][y] == true)
  {
    voisin = voisin-1;
  }

  
  return voisin;
}



void regles()
{
  for (int i = 1; i < (nombreCase-1); i = i+1 )
  {
    for (int j = 1; j < (nombreCase-1); j = j+1 )
    {
      int voisin = totalVoisin(i, j);
      
      
      if ((cases[i][j] == false) && (voisin == 3))
      {
        //Naissances
        tmp_cases[i][j] = true;
      } 
      else if ((cases[i][j] == true) && 
               ((voisin == 2) || (voisin == 3)))
      {
        // survivant
        tmp_cases[i][j] = true;
      }
      else
      { 
        //Mort
        tmp_cases[i][j] = false;
      }
    }
  }
  

  for (int i = 0; i < nombreCase; i = i+1 )
  {
    for (int j = 0; j < nombreCase; j = j+1 )
    {
        cases[i][j] = tmp_cases[i][j];
    }
  }
}





void dessinText()
{
  textSize(50);
  fill(255, 0, 0);
  
  text ("generations: \n"+generations, 0, 40);
  
  text ("created by: \n Victor \n Benoit", 0, height-160);  
  
  text(ips, width-100, 100); 
}





void mousePressed()
{
  if (mousePressed == true) 
  {
    int caseY = mouseY/hauteurCase;
    int caseX = (mouseX-((width-height)/2))/hauteurCase;
    
    if ((caseX >= 0) && ( caseX < nombreCase) && (caseY >= 0) && ( caseY < nombreCase))
    {
      if (cases[caseX][caseY] == true)
      {
        cases[caseX][caseY] = false;
      }
      else
      {
        cases[caseX][caseY] = true;
      }
    }
  }
}




void keyPressed() 
{
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
  
  if (key == 'r')
  {
    initialisation();
    generations = 1;
  }
  if (key == 'q')
  {
    exit();
  }
  
  if (key == 'z')
  {
    if (ips > 1)
    {
    ips = ips-1;
    }
  }
  
  if (key == 'x')
  {
    ips = ips+1;
  }
}
