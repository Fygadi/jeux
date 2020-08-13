import java.util.ArrayList  ;

SnakeClass Snake;

//he is set to true when the game is over
boolean gameOver = false;


void setup(){
  fullScreen();
  background(0);
  frameRate(25);
  rectMode(CENTER);
  
  Snake = new SnakeClass(width/30, height/30);
  
  Snake.InitialisationVariable();
}

    
void draw(){ 
  if(gameOver == false){
    Snake.SnakeMovement();
    
    if(Snake.snakeX.get(0) == Snake.foodPositionX &&
       Snake.snakeY.get(0) == Snake.foodPositionY){
         Snake.SpawnFood(); 
         Snake.alonger = true;
    }
  }
}



public class SnakeClass{
  //variable to draw snake
  private int sizeCase = 30;
  private int nombreCasesX;
  private int nombreCasesY;
  
  //This variables contain the position of the snake
  private ArrayList<Integer> snakeX = new ArrayList<Integer>();
  private ArrayList<Integer> snakeY = new ArrayList<Integer>();
  
  //This variables is change if key pressed and it's use when the fonction SnakeMovement() is call
  private int directionX;
  private int directionY;
  
  //This is the variable contain the coordone of the food/yellow point
  private int foodPositionX;
  private int foodPositionY;
  
  private boolean alonger = false;
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY){
    nombreCasesX = _nombreCasesX;
    nombreCasesY = _nombreCasesY;
  }
  
  
  
  void InitialisationVariable(){
    snakeX.clear();
    snakeY.clear();
    
    //snake spawn position
    snakeX.add((int) random(2, nombreCasesX-3));
    snakeY.add((int) random(2, nombreCasesY-3));
    
    Snake.directionX = 0;
    Snake.directionY = 0;
    
    background(0);
    Snake.DrawSnake();
    Snake.SpawnFood(); 
    
    gameOver = false;
  }
  
  
  
  void DrawSnake(){
    for (int i = 0; i < snakeX.size(); i++){
      if(i == 0){
        //Draw the head of the snake
        noStroke();
        //fill(90, 170, 255);
        fill(255);
        square((snakeX.get(i) * sizeCase) + (sizeCase/2), (snakeY.get(i) * sizeCase) + (sizeCase/2), sizeCase);
      }
      else{
        //Draw the Corp of the snake
        //colorMode(HSB);
        noStroke();
        fill((i*30)%359, 255, (i*30*i)%99);
        square((snakeX.get(i) * sizeCase) + (sizeCase/2), (snakeY.get(i) * sizeCase) + (sizeCase/2), sizeCase);
      }
    }
  }
  
  
  
  void SnakeMovement(){
    int nextPositonX = snakeX.get(0) + (1 * directionX);
    int nextPositonY = snakeY.get(0) + (1 * directionY);
    
    // Si meme element que presedament fait rien
    if ((snakeX.size() > 0) && 
        (nextPositonX == snakeX.get(0)) && 
        (nextPositonY == snakeY.get(0)))
    {}
    else
    {
      if(GameOver(nextPositonX, nextPositonY) == true){
      }
      SnakePosition(nextPositonX, nextPositonY);
      Snake.DrawSnake();
    }
  }
  
  
  
  void SnakePosition(int newPositionX,int newPositionY){
    //shift the array list
    snakeX.add(0, newPositionX);
    snakeY.add(0, newPositionY);
    
   if (alonger == false)
   {
    int LastPositionX = snakeX.get(snakeX.size()-1);
    int LastPositionY = snakeY.get(snakeX.size()-1);

    snakeX.remove(snakeX.size()-1);
    snakeY.remove(snakeY.size()-1);
    
    //remove la trainer du snake
    noStroke();
    fill(0, 0, 0);
    square((LastPositionX * sizeCase) + (sizeCase/2), (LastPositionY * sizeCase) + (sizeCase/2), sizeCase);
   }
   alonger = false;
  }
  
  
  
  void fonction_JSP(){
    //int headPositionX;
    //int headPositionY;
    
    //headPositionX = Snake.snakeX.get(0)+1 * Snake.directionX;
    //headPositionY = Snake.snakeY.get(0)+1 * Snake.directionY;
    //noStroke();
    //fill(255, 0, 0);
    //square((headPositionX * Snake.sizeCase) + (Snake.sizeCase/2), (headPositionY * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
  }
  
  
  
  void SpawnFood(){
    foodPositionX = (int)random(0, nombreCasesX-1);
    foodPositionY = (int)random(0, nombreCasesY-1);
  
    noStroke();
    fill(255, 255, 0);
    square((foodPositionX * Snake.sizeCase) + (Snake.sizeCase/2), (foodPositionY * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
  }
  
  
  
  boolean GameOver(int nextPositionX, int nextPositionY){
    boolean accepted = true;
    //check if the snake is going out of the screen
    if(nextPositionX < 0 || nextPositionX > nombreCasesX || 
    nextPositionY < 0 || nextPositionY > nombreCasesY){
      accepted = false;
    }
    
    for(int i = 1; i < snakeX.size(); i++){
      if(nextPositionX == snakeX.get(i) && nextPositionY == snakeY.get(i)){
        accepted = false;
      }
    }
    if(accepted == false){
      gameOver = true;
    }
    return accepted;
  }
  
  
  
  int CalculNextPosition(int actualPosition, int direction){
    int nextPosition = actualPosition + (1 * direction);
    
    return nextPosition;
  }
}

//void Rules(){
  
//}


void keyPressed(){
  boolean changeDirection = false;
  int tempDirectionX = 0;
  int tempDirectionY = 0;
  
  //Control snake
  if(key == 'w' || key == 'W' || keyCode == UP){
    tempDirectionX = 0;
    tempDirectionY = -1;
    if(Snake.snakeX.size() > 1){
      if(Snake.CalculNextPosition(Snake.snakeY.get(0), tempDirectionY) != Snake.snakeY.get(1)){
        
        Snake.directionX = tempDirectionX;
        Snake.directionY = tempDirectionY;
        changeDirection = true;
      }
    }
    else{
      changeDirection = true;
    }
    if(changeDirection == true){
      Snake.directionX = tempDirectionX;
      Snake.directionY = tempDirectionY;
    }
  }
  
  if(key == 'a' || key == 'A' || keyCode == UP){
    tempDirectionX = -1;
    tempDirectionY = 0;
    if(Snake.snakeX.size() > 1){
      if(Snake.CalculNextPosition(Snake.snakeY.get(0), tempDirectionY) != Snake.snakeY.get(1)){
        
        Snake.directionX = tempDirectionX;
        Snake.directionY = tempDirectionY;
        changeDirection = true;
       }
     }
     else{
      changeDirection = true;
    }
    if(changeDirection == true){
      Snake.directionX = tempDirectionX;
      Snake.directionY = tempDirectionY;
    }
  }
  
  if(key == 's' || key == 'S' || keyCode == UP){
    tempDirectionX = 0;
    tempDirectionY = 1;
    if(Snake.snakeX.size() > 1){
      if(Snake.CalculNextPosition(Snake.snakeY.get(0), tempDirectionY) != Snake.snakeY.get(1)){
        
        Snake.directionX = tempDirectionX;
        Snake.directionY = tempDirectionY;
        changeDirection = true;
       }
     }
     else{
      changeDirection = true;
    }
    if(changeDirection == true){
      Snake.directionX = tempDirectionX;
      Snake.directionY = tempDirectionY;
    }
  }
  
  if(key == 'd' || key == 'D' || keyCode == UP){
    tempDirectionX = 1;
    tempDirectionY = 0;
    if(Snake.snakeX.size() > 1){
      if(Snake.CalculNextPosition(Snake.snakeY.get(0), tempDirectionY) != Snake.snakeY.get(1)){
        
        Snake.directionX = tempDirectionX;
        Snake.directionY = tempDirectionY;
        changeDirection = true;
       }
     }
     else{
      changeDirection = true;
    }
    if(changeDirection == true){
      Snake.directionX = tempDirectionX;
      Snake.directionY = tempDirectionY;
    }
  }
  
  
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
  
  if(key == 'q' || key == 'Q'){
    if (Snake.snakeX.size() > 1){
      Snake.snakeX.remove(Snake.snakeX.size()-1);
      Snake.snakeY.remove(Snake.snakeY.size()-1);
    }
  }
  if(key == 'e' || key == 'E'){
    Snake.alonger = true;
  }
}
