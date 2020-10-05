private class SnakeClass{
  boolean gameOver = false;
  int gameTime = 0;
  
  //variable to draw snake
  private float sizeCaseX;
  private float sizeCaseY;
  private int nombreCasesX;
  private int nombreCasesY;
  
  //This variables contain the actuel position of the snake
  private ArrayList<Integer> snakeX = new ArrayList<Integer>();
  private ArrayList<Integer> snakeY = new ArrayList<Integer>();
  
  //This variables is change if keyMove is pressed and it's use when the fonction SnakeMovement() is call
  private int directionX;
  private int directionY;
  
  //This is the variable contain the coordone of the food/yellow point
  private int foodPositionX;
  private int foodPositionY;
  private int numberFoodEat = 0;
  
  public SnakeClass(int _nombreCasesX, int _nombreCasesY, float _sizeCaseX, float _sizeCaseY){
    nombreCasesX = _nombreCasesX-1;
    nombreCasesY = _nombreCasesY-1;
    sizeCaseX = _sizeCaseX;
    sizeCaseY = _sizeCaseY;
  }
  
  
  void InitialisationVariable(){
    //Clear snake
    snakeX.clear();
    snakeY.clear();
    
    //snake spawn position
    //snakeX.add((int) random(2, nombreCasesX-3));
    //snakeY.add((int) random(2, nombreCasesY-3));
    snakeX.add(nombreCasesX/2);
    snakeY.add(nombreCasesY/2);
    
    Snake.directionX = 0;
    Snake.directionY = 0;
    
    numberFoodEat = 0;
    
    background(0);
    Snake.DrawSnake();
    Snake.SpawnFood(true, true);
    gameOver = false;
    gameState = GameState.LOAD_IN_GAME;
  }
  
  
  
  void DrawSnake(){
    for (int i = 0; i < snakeX.size(); i++){
      if(i == 0){
        //Draw the head of the snake
        noStroke();
        fill(255);
        rect((snakeX.get(i) * sizeCaseX) + (sizeCaseX/2), (snakeY.get(i) * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
      }
      else{
        //Draw the Corp of the snake
        noStroke();
        fill((i*30)%359, 255, (i*30*i)%99);
        rect((snakeX.get(i) * sizeCaseX) + (sizeCaseX/2), (snakeY.get(i) * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
      }
    }
  }
  
  
  
  void SnakeMovement(){
    int nextPositonX = CalculNextPosition(snakeX.get(0), directionX);
    int nextPositonY = CalculNextPosition(snakeY.get(0), directionY);;
    
    if(GameOver(nextPositonX, nextPositonY) == true){
      //if next position of the head is accepted
      //change the position of the head
      SnakePosition(nextPositonX, nextPositonY);
    }
    else{
      //if the next position of the head is not accepted
      //change the statue of the game
      gameState = GameState.LOAD_GAME_OVER;
    }
  }
  
  
  
  void SnakePosition(int newPositionX,int newPositionY){
    //save the last positon of the snake
    int LastPositionX = snakeX.get(snakeX.size()-1);
    int LastPositionY = snakeY.get(snakeX.size()-1);
    
    //shift the array
    // add the new position of the head at the begening and remove the last position of the snake
    snakeX.add(0, newPositionX);
    snakeY.add(0, newPositionY);
    
    snakeX.remove(snakeX.size()-1);
    snakeY.remove(snakeY.size()-1);
    
    //draw the case behind the snake in black to remove the trainer
    stroke(0);
    fill(0);
    rect((LastPositionX * sizeCaseX) + (sizeCaseX/2), (LastPositionY * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
  }
  
  
  
  void Alonger(){
    for(int i = 0; i < SnakeMagnificationSpeed_G; i++){
      Snake.snakeX.add(Snake.snakeX.size(), -1);
      Snake.snakeY.add(Snake.snakeY.size(), -1);
    }
  }
  
  
  
  void SpawnFood(boolean newFoodPosition, boolean drawFood){
    if(newFoodPosition == true){
      //set the position of the food
      foodPositionX = (int)random(0, nombreCasesX-1);
      foodPositionY = (int)random(0, nombreCasesY-1);
      for(int i = 0; i < snakeX.size(); i ++){
        if(foodPositionX == snakeX.get(i) && 
           foodPositionY == snakeY.get(i)){
          SpawnFood(true, false);
         }
         else{
           DrawScore(true, true);
         }
      }
    }
    
    if(drawFood == true){
      //drawfood
      noStroke();
      fill(255, 255, 0);
      rect((foodPositionX * Snake.sizeCaseX) + (Snake.sizeCaseX/2), (foodPositionY * Snake.sizeCaseY) + (Snake.sizeCaseY/2), Snake.sizeCaseX, sizeCaseY);
    }
  }
  
  
  
  void DrawScore(boolean writeText, boolean removeText){
    float size_text = width/30;
    //draw score
    textAlign(LEFT, TOP);
    
    if(removeText == true){
      if(numberFoodEat != 0){
        int digitsNumber = Integer.toString(numberFoodEat).length();
        fill(0);
        rect(0 + (size_text/2), 0 + (size_text/2), digitsNumber * size_text + (size_text/2), size_text + (size_text/2));
      }
    }
    if(writeText == true){
      fill(255);
      textSize(size_text);
      text(numberFoodEat, 0 + ((width/100) * 0.7), 0 + ((height/100) * 0.6));
    }
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
