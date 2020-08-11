import java.util.ArrayList  ;

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
    Snake.SnakeMovement();
    
    //for(int i = 0; i< Snake.nombreCasesX; i++){
    //  for(int j = 0; j< Snake.nombreCasesY; j++){
    //    noFill();
    //    stroke(255);
    //////    square((i * Snake.sizeCase) + (Snake.sizeCase/2), (j * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
    ////  }
    //}
  }
}



public class SnakeClass{
  //variable to draw snake
  private int sizeCase = 30;
  private int nombreCasesX;
  private int nombreCasesY;
  
  //Variable direction is change fi key pressed
  private int directionX;
  private int directionY;
  
  private boolean alonger = false;
  private ArrayList<Integer> snakeX = new ArrayList<Integer>();
  private ArrayList<Integer> snakeY = new ArrayList<Integer>();
  
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
    
    gameOver = false;
  }
  
  
  
  void DrawSnake(){
    for (int i = 0; i < snakeX.size(); i++){
      if(i == 0){
        //Draw the head of the snake
        noStroke();
        fill(90, 170, 255);
        square((snakeX.get(i) * sizeCase) + (sizeCase/2), (snakeY.get(i) * sizeCase) + (sizeCase/2), sizeCase);
      }
      else{
        //Draw the Corp of the snake
        noStroke();
        fill(0, 0, 75);
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
    int headPositionX;
    int headPositionY;
    
    headPositionX = Snake.snakeX.get(0)+1 * Snake.directionX;
    headPositionY = Snake.snakeY.get(0)+1 * Snake.directionY;
    noStroke();
    fill(255, 0, 0);
    square((headPositionX * Snake.sizeCase) + (Snake.sizeCase/2), (headPositionY * Snake.sizeCase) + (Snake.sizeCase/2), Snake.sizeCase);
  }
  
  
  
  void SpawnFood(){
    
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
  
  //Control
  if(key == 'w' || key == 'W' || keyCode == UP){
    Snake.directionX = 0;
    Snake.directionY = -1;
    
    Snake.fonction_JSP();
  }
  if(key == 'a' || key == 'A' || keyCode == LEFT){
    Snake.directionX = -1;
    Snake.directionY = 0;
    
    Snake.fonction_JSP();
  }
  if(key == 's' || key == 'S' || keyCode == DOWN){
    Snake.directionX = 0;
    Snake.directionY = 1;
    
    Snake.fonction_JSP();
  }
  if(key == 'd' || key == 'D' || keyCode == RIGHT){
    Snake.directionX = 1;
    Snake.directionY = 0;
    
    Snake.fonction_JSP();
  }
  
  if(key == 'q' || key == 'Q'){
    if (Snake.snakeX.size() >= 1){
      Snake.snakeX.remove(Snake.snakeX.size()-1);
      Snake.snakeY.remove(Snake.snakeY.size()-1);
    }
  }
  if(key == 'e' || key == 'E'){
    Snake.alonger = true;
  }
}
