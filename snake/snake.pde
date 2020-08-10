SnakeClass Snake;

boolean gameOver = false;

void setup(){
  fullScreen();
  background(0);
  frameRate(22);
  rectMode(CENTER);
  
  Snake = new SnakeClass(width/30, height/30);
  
  Snake.InitialisationVariable();
}


void draw(){ 
  if(gameOver == false){
    Snake.DrawClassSnake();
    Snake.SnakeMovement();
    Snake.SnakePosition();
  }
}



public class SnakeClass{
  //variable to draw snake
  private int sizeCase = 30;
  private int nombreCasesX;
  private int nombreCasesY;
  
  //The variable direction is change key is pressed
  private int[] direction = new int [2];
  //headPosition[0] is for X
  //headPosition[1] is for Y
  
  private int sizeCorp = 20;
  private int[] snakeX = new int[sizeCorp];
  private int[] snakeY = new int[sizeCorp];
  
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY){
    nombreCasesX = _nombreCasesX;
    nombreCasesY = _nombreCasesY;
  }
  
  
  
  void InitialisationVariable(){
    //snake spawn position
    snakeX[0] = (int) random(2, nombreCasesX-3);
    snakeY[0] = (int) random(2, nombreCasesY-3);
    Snake.direction[0] = 0;
    Snake.direction[1] = 0;
    
    //set all the value to te snake at the position of the head
    for(int i = 1; i < sizeCorp; i++){
    snakeX[i] = snakeX[0];
    snakeY[i] = snakeY[0];
    }
    
    background(0);
    Snake.DrawClassSnake();
    
    gameOver = false;
  }
  
  
  void DrawClassSnake(){
    for (int i = 0; i < sizeCorp; i++){
      if(i == 0){
        noStroke();
        fill(0, 120, 255);
        square((snakeX[i] * sizeCase) + (sizeCase/2), (snakeY[i] * sizeCase) + (sizeCase/2), sizeCase);
      }
      else{
        noStroke();
        fill(30, 150, 255);
        square((snakeX[i] * sizeCase) + (sizeCase/2), (snakeY[i] * sizeCase) + (sizeCase/2), sizeCase);
      }
    }
  }
  
  
  
  void SnakeMovement(){
    int nextPositonX = snakeX[0] + (1 * direction[0]);
    int nextPositonY = snakeY[0] + (1 * direction[1]);
    if(GameOver(nextPositonX, nextPositonY) == false){
    //[0] = X
    //[1] = Y
    snakeX[0] = nextPositonX;
    snakeY[0] = nextPositonY;
    }
  }
  
  
  
  void SnakePosition(){
    int[] TempCorpPosition = {snakeX[sizeCorp-1], snakeY[sizeCorp-1]};
    for(int i = sizeCorp-1; i > 0; i--){
      snakeX[i] = snakeX[i-1];
      snakeY[i] = snakeY[i-1];
    }
    
    noStroke();
    fill(0, 0, 0);
    square((TempCorpPosition[0] * sizeCase) + (sizeCase/2), (TempCorpPosition[1] * sizeCase) + (sizeCase/2), sizeCase);
  }
  
  
  
  void fonction_JSP(){
    //int[] tempHeadPosition = new int[2];
    
    //tempHeadPosition[0] = Snake.snakeX[0]+1 * Snake.direction[0];
    //tempHeadPosition[1] = Snake.snakeY[0]+1 * Snake.direction[1];
    //noStroke();
    //fill(255, 0, 0);
    //square((tempHeadPosition[0] * Snake.sizeCase) + (Snake.sizeCase/2), (tempHeadPosition[1] * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
  }
  
  
  
  boolean GameOver(int nextPositionX, int nextPositionY){
    boolean accepted = false;
    //check if the snake is going out of the screen
    if(nextPositionX < 0 || nextPositionX > nombreCasesX || 
    nextPositionY < 0 || nextPositionY > nombreCasesY){
      accepted = false;
      gameOver = true;
    }
    return accepted;
  }
}



//void Rules(){
  
//}



void keyPressed(){
  if(key == 'r' || key == 'R')
  {
    Snake.InitialisationVariable();
  }
  
  if(key == 'p' || key == 'P'){
    if(gameOver == false){
      gameOver = true;
    }
    else{
      gameOver = false;
    }
  }
  
  
  if(key == 'w' || key == 'W' || keyCode == UP){
    Snake.direction[1] = -1;
    Snake.direction[0] = 0;
    
    Snake.fonction_JSP();
}

  if(key == 'a' || key == 'A' || keyCode == LEFT){
    Snake.direction[0] = -1;
    Snake.direction[1] = 0;
    
    Snake.fonction_JSP();
  }
  
  if(key == 's' || key == 'S' || keyCode == DOWN){
    Snake.direction[1] = 1;
    Snake.direction[0] = 0;
    
    Snake.fonction_JSP();
  }
  
  if(key == 'd' || key == 'D' || keyCode == RIGHT){
    Snake.direction[0] = 1;
    Snake.direction[1] = 0;
    
    Snake.fonction_JSP();
  }
}
