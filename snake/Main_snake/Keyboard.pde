void keyPressed(){
  boolean changeDirection = false;
  int tempDirectionX = 0;
  int tempDirectionY = 0;
  
  //Control snake
  if(key == up_G || key == Character.toString(up_G).toUpperCase().toCharArray()[0] || key == CODED &&  keyCode == UP){
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
  else if(key == left_G || key == Character.toString(left_G).toUpperCase().toCharArray()[0] || key == CODED && keyCode == LEFT){
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
  }else if(key == down_G || key == Character.toString(down_G).toUpperCase().toCharArray()[0] || key == CODED && keyCode == DOWN){
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
  }else if(key == right_G || key == Character.toString(right_G).toUpperCase().toCharArray()[0] || key == CODED && keyCode == RIGHT){
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
  }else if(key == 'r' || key == 'R'){
    if(gameState == GameState.IN_GAME || gameState == GameState.GAME_OVER){
      Snake.InitialisationVariable();
      gameState = GameState.LOAD_IN_GAME;
    }
  }else if(key == 'p' || key == 'P'){
    if(Snake.gameOver == false){
      Snake.gameOver = true;
    }
    else{
      Snake.gameOver = false;
    }
  }else if(key == 'q' || key == 'Q'){
    if (Snake.snakeX.size() > 1){
      Snake.snakeX.remove(Snake.snakeX.size()-1);
      Snake.snakeY.remove(Snake.snakeY.size()-1);
      Snake.numberFoodEat = --Snake.numberFoodEat;
    }
  }else if(key == 'e' || key == 'E'){
    Snake.snakeX.add(Snake.snakeX.size(), -1);
    Snake.snakeY.add(Snake.snakeY.size(), -1);
    Snake.numberFoodEat = ++Snake.numberFoodEat;
  }else if(keyCode == ALT){
    simultaneKey.EASTER_EGG_KEY_ALT = true;
  }else if(key == 'v'){
    simultaneKey.EASTER_EGG_KEY_V = true;
  }
}



void keyReleased(){
  if(keyCode == ALT){
    simultaneKey.EASTER_EGG_KEY_ALT = false;
  }else if(key == 'v'){
    simultaneKey.EASTER_EGG_KEY_V = false;
  }
}
