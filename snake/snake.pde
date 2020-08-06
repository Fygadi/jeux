SnakeClass Snake;

void setup(){
  background(0);
  frameRate(120);
  fullScreen();
  rectMode(CENTER);
  
  Snake = new SnakeClass(width/20, height/20);
  
  Snake.initialisationSnake();
  Snake.drawBackground();
}


void draw(){
  Snake.DrawSnake();
}


private class SnakeClass{
  int sizeCase = 20;
  
  private int nombreCasesX;
  private int nombreCasesY;
  private int[][] snakePosition;
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY)
  {
    nombreCasesX = _nombreCasesX;
    nombreCasesY = _nombreCasesY;
    snakePosition = new int[nombreCasesX][nombreCasesY];
  }
  
  
  void DrawSnake(){
    for (int i = 0; i < nombreCasesX; i++){ //<>//
      for (int j = 0; j < nombreCasesY; j++){
        
        if(snakePosition[i][j] == 1){ //<>//
          noStroke();
          fill(0, 120, 255);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase); //<>//
        }
      }
    }
  }
  
  
  
  void drawBackground(){
    for(int i = 0; i < nombreCasesX; i++){
      snakePosition[i][0] = 2;
      snakePosition[i][nombreCasesY-1] = 2;
    }
    for(int j = 0; j < nombreCasesY; j++){
      snakePosition[0][j] = 2;
      snakePosition[nombreCasesX-1][j] = 2;
    }
    
    for(int i = 0; i < nombreCasesX; i++){
      for(int j = 0; j < nombreCasesY; j++){
        if(snakePosition[i][j] == 2){
          noStroke();
          fill(255, 0, 0);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase);
        }
      }
    }
  }
  
  
  
  void initialisationSnake(){
    for(int i = 1; i < nombreCasesX-1; i++){
      for(int j = 1; j < nombreCasesY-1; j++){
        snakePosition[i][j] = 0;
      }
    }
    background(0);
    drawBackground();
    snakePosition[(int)random(1, nombreCasesX-1)][(int)random(1, nombreCasesY-1)] = 1;
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
