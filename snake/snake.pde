SnakeClass Snake;

void setup(){
  background(0);
  frameRate(120);
  fullScreen();
  rectMode(CENTER);
  
  Snake = new SnakeClass(width/20, height/20);
  
  Snake.initialisationSnake();
}


void draw(){
  Snake.DrawSnake();
}


private class SnakeClass{
  int sizeCase = 20;
  
  private int nombreCasesX;
  private int nombreCasesY;
  private int[][] SnakePosition;
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY)
  {
    nombreCasesX = _nombreCasesX;
    nombreCasesY = _nombreCasesY;
    SnakePosition = new int[nombreCasesX][nombreCasesY];
  }
  
  
  void DrawSnake(){
  for (int i = 0; i < nombreCasesX; i++){ //<>//
    for (int j = 0; j < nombreCasesY; j++){        
        
      if(SnakePosition[i][j] == 1){ //<>//
        stroke(1);
        strokeWeight(0);
        fill(0, 120, 255);
        square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase); //<>//
        }
      }
    }
  }
  
  
  
  void initialisationSnake(){
    for(int i = 1; i < nombreCasesX-1; i++){
      for(int j = 1; j < nombreCasesY-1; j++){
        SnakePosition[i][j] = 0;
      }
    }
    
    background(0);
    SnakePosition[(int)random(1, nombreCasesX-1)][(int)random(1, nombreCasesY-1)] = 1;
  }
}



void snakeMovement(){
  
}



void keyPressed(){
  if(key == 'r' || key == 'R')
  {
    Snake.initialisationSnake();
  }
  
  if(key == 'w' || key == 'W'){
    
  }
  
  if(key == 's' || key == 'S'){
    
  }
  
  if(key == 'a' || key == 'A'){
    
  }
  
  if(key == 'd' || key == 'D'){
    
  }
}
