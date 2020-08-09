SnakeClass Snake;

boolean pause = true;

void setup(){
  background(0);
  fullScreen();
  rectMode(CENTER);
  frameRate(28);
  
  Snake = new SnakeClass(width/20, height/20);
  
  Snake.initialisationSnake();
}


void draw(){
  if(pause == false){
  Snake.GameOver();
  }
  
  if(pause == false){
  Snake.SnakeMovement();
  Snake.SnakeCorpPosition();
  Snake.DrawSnake();
  }
}



public class SnakeClass{
  //variable to draw snake
  private int sizeCase = 20;
  private int nombreCasesX;
  private int nombreCasesY;
  private int[][] CasesInformation;
  //variable use to move the head of the snake
  
  private int[] direction = new int [2];
  private int[] headPosition = new int[2];
  //headPosition[0] is for X
  //headPosition[1] is for Y
  
  //variable about the corp of the snake
  private int sizeSnakeCorp = 100;
  private int[] snakeCorpX = new int[sizeSnakeCorp];
  private int[] snakeCorpY = new int[sizeSnakeCorp];
  
  
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY)
  {
    nombreCasesX = _nombreCasesX;
    nombreCasesY = _nombreCasesY;
    CasesInformation = new int[nombreCasesX][nombreCasesY];
  }
  
  
  
    void initialisationSnake(){
    for(int i = 1; i < nombreCasesX-1; i++){
      for(int j = 1; j < nombreCasesY-1; j++){
        CasesInformation[i][j] = 0;
      }
    }
    //snake spawn position
    headPosition[0] = (int) random(2, nombreCasesX-3);
    headPosition[1] = (int) random(2, nombreCasesY-3);
    
    CasesInformation[headPosition[0]][headPosition[1]] = 1;
    Snake.direction[0] = 0;
    Snake.direction[1] = 0;
    
    //set te value to te snake at the position of the head
    for(int i = 0; i < sizeSnakeCorp-1; i++){
    snakeCorpX[i] = headPosition[0];
    snakeCorpY[i] = headPosition[1];
    }
    
    
    background(0);
    DrawBackground();
    Snake.DrawSnake();
    
    pause = true;
  }
  
  
  
  void DrawSnake(){
    for (int i = 0; i < nombreCasesX; i++){
      for (int j = 0; j < nombreCasesY; j++){
        if(CasesInformation[i][j] == 1){
          //Draw the head of the snake
          noStroke();
          fill(0, 120, 255);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase);
        }
        if(CasesInformation[i][j] == 2){
          //Draw the head of the snake
          noStroke();
          fill(35, 50, 135);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase);
        }
      }
    }
  }
  
  
  
  void DrawBackground(){
    //calcule le contour rouge de l'écrand
    for(int i = 0; i < nombreCasesX; i++){
      CasesInformation[i][0] = 3;
      CasesInformation[i][nombreCasesY-1] = 3;
    }
    for(int j = 0; j < nombreCasesY; j++){
      CasesInformation[0][j] = 3;
      CasesInformation[nombreCasesX-1][j] = 3;
    }
    
    for(int i = 0; i < nombreCasesX; i++){
      for(int j = 0; j < nombreCasesY; j++){
        if(CasesInformation[i][j] == 3){
          noStroke();
          fill(255, 0, 0);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase);
        }
      }
    }
    for(int i = 0; i < nombreCasesX; i++){
      for(int j = 0; j < nombreCasesY; j++){
        if(CasesInformation[i][j] == 3){
          noStroke();
          fill(255, 0, 0);
          square((i * sizeCase) + (sizeCase/2), (j * sizeCase) + (sizeCase/2), sizeCase);
        }
      }
    }
  }
  
  
  
  void SnakeMovement(){
    //[0] = X
    //[1] = Y
    headPosition[0] = headPosition[0]+1 * direction[0];
    headPosition[1] = headPosition[1]+1 * direction[1];
    CasesInformation[headPosition[0]][headPosition[1]] = 1;
  }
  
  
  
  void SnakeCorpPosition(){
    int[] TempCorpPosition = {snakeCorpX[sizeSnakeCorp-1], snakeCorpY[sizeSnakeCorp-1]};
    snakeCorpX[0] = headPosition[0];
    snakeCorpY[0] = headPosition[1];
    for(int i = sizeSnakeCorp-1; i > 0; i--){
      snakeCorpX[i] = snakeCorpX[i-1];
      snakeCorpY[i] = snakeCorpY[i-1];
    }
    
    for(int j = 2; j < sizeSnakeCorp; j++){
      CasesInformation[snakeCorpX[j]][snakeCorpY[j]] = 2;
    }
    CasesInformation[TempCorpPosition[0]][TempCorpPosition[1]] = 0;
    noStroke();
    fill(0, 0, 0);
    square((TempCorpPosition[0] * sizeCase) + (sizeCase/2), (TempCorpPosition[1] * sizeCase) + (sizeCase/2), sizeCase);
  }
  
  
  
  void fonction_JSP(){
    //int[] tempHeadPosition = new int[2];
    
    //tempHeadPosition[0] = Snake.headPosition[0]+1 * Snake.direction[0];
    //tempHeadPosition[1] = Snake.headPosition[1]+1 * Snake.direction[1];
    //noStroke();
    //fill(255, 0, 0);
    //square((tempHeadPosition[0] * Snake.sizeCase) + (Snake.sizeCase/2), (tempHeadPosition[1] * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
  }
  
  
  
   void GameOver(){
     if(Snake.headPosition[0] == 0|| Snake.headPosition[0] == Snake.nombreCasesX-1){
         pause = true;
       }
    if(Snake.headPosition[1] == 0 || Snake.headPosition[1] == Snake.nombreCasesY-1){
      pause = true;
    }
  }
}



void Rules(){
  
}



void keyPressed(){
  if(key == 'r' || key == 'R')
  {
    Snake.initialisationSnake();
  }
  
  if(key == 'p' || key == 'P'){
    if(pause == false){
      pause = true;
    }
    else{
      pause = false;
    }
  }
  
  
  if(key == 'w' || key == 'W' || keyCode == UP){
    Snake.direction[1] = -1;
    Snake.direction[0] = 0;
    
    Snake.fonction_JSP();
    
    if(pause == true){
      pause = false;
    }
}

  if(key == 'a' || key == 'A' || keyCode == LEFT){
    Snake.direction[0] = -1;
    Snake.direction[1] = 0;
    
    Snake.fonction_JSP();
    
    if(pause == true){
      pause = false;
    }
  }
  
  if(key == 's' || key == 'S' || keyCode == DOWN){
    Snake.direction[1] = 1;
    Snake.direction[0] = 0;
    
    Snake.fonction_JSP();
    
    if(pause == true){
      pause = false;
    }
  }
  
  if(key == 'd' || key == 'D' || keyCode == RIGHT){
    Snake.direction[0] = 1;
    Snake.direction[1] = 0;
    
    Snake.fonction_JSP();
    
    if(pause == true){
      pause = false;
    }
  }
}
