import java.util.ArrayList;

SnakeClass Snake;
PersistantVariable simultaneKey = new PersistantVariable();
EasterEgg Egg = new EasterEgg();

enum GameState {
    SPLASH_SCREEN,
    IN_GAME,
    GAME_OVER
}
GameState gameState = GameState.SPLASH_SCREEN;


//parametre
boolean fullScreen_G = true;
int ScreenSizeX_G = 800;
int ScreenSizeY_G = 800;

int sizeCases_G = (int)((1920/100)*1.6);
int SnakeSpeed_G = 15;

//Control
char up_G = 'w';
char left_G = 'a';
char down_G = 's';
char right_G = 'd';



void settings(){
  JsonOptionFile();
  if(fullScreen_G == true){
    fullScreen(1);
  }
  else{
    size(ScreenSizeX_G, ScreenSizeY_G);
  }
}



void setup(){
  frameRate(SnakeSpeed_G);
  
  background(0);
  rectMode(CENTER);
  
  //set the size of the case and the number of the cases.
 int nombresCasesX = ((int)width/sizeCases_G);
  float sizeCaseX = ((float)width / nombresCasesX);

  int nombresCasesY = ((int)height/sizeCases_G);
  float sizeCaseY = ((float)height / nombresCasesY);

  Snake = new SnakeClass(nombresCasesX, nombresCasesY, sizeCaseX, sizeCaseY);
  
  //drawSplashScreen
  PImage splashScreen = loadImage("data/Image/SplashScreen/SplashScreen.png");
  splashScreen.resize(ScreenSizeY_G, ScreenSizeY_G);
  
  imageMode(CENTER);
  image(splashScreen, width/2, height/2);
  
  
  Snake.gameOver = false;
  
}



void draw(){
  switch (gameState){
    case SPLASH_SCREEN:{
      cursor();
      SplashScreen();
      break;
    }
    case IN_GAME:{
      if(Snake.gameOver == false){
        noCursor();
        Snake.SnakeMovement();
        
        //if snake eat food
        if(Snake.snakeX.get(0) == Snake.foodPositionX && Snake.snakeY.get(0) == Snake.foodPositionY){
          Snake.SpawnFood(); 
          Snake.alonger = true;
        }
      }
      if(simultaneKey.EASTER_EGG_KEY_ALT == true && simultaneKey.EASTER_EGG_KEY_V == true){
        Egg.CreateurName();
        simultaneKey.EASTER_EGG_KEY_ALT = false;
        simultaneKey.EASTER_EGG_KEY_V = false;
      }
      break;
    }
    case GAME_OVER:{
      GameOver();
      cursor();
      break;
    }
  }
}




void JsonOptionFile() {
  try{
  JSONObject json;
  json = loadJSONObject("optionSnake.json");

   JSONObject jsonScreen = new JSONObject();
   jsonScreen=json.getJSONObject("Screen");
   fullScreen_G = jsonScreen.getBoolean("FullScreen");
   ScreenSizeX_G = jsonScreen.getInt("SizeX");
   ScreenSizeX_G = jsonScreen.getInt("SizeY");
  
   JSONObject jsonKey = new JSONObject();
   jsonKey=json.getJSONObject("key");
   up_G = jsonKey.getString("up").toCharArray()[0];
   left_G = jsonKey.getString("left").toCharArray()[0];
   down_G = jsonKey.getString("down").toCharArray()[0];
   right_G = jsonKey.getString("right").toCharArray()[0];
   
   JSONObject jsonAuther = new JSONObject();
   jsonAuther=json.getJSONObject("Auther");
   SnakeSpeed_G = jsonAuther.getInt("SnakeSpeed", SnakeSpeed_G);
   sizeCases_G = jsonAuther.getInt("sizeCases", sizeCases_G);
}
  catch(Exception e){
    println("Ereur = " + e);
    JSONObject json = new JSONObject();

    JSONObject jsonScreen = new JSONObject();
    jsonScreen.setBoolean("FullScreen", fullScreen_G);
    jsonScreen.setInt("SizeX", ScreenSizeX_G);
    jsonScreen.setInt("SizeY", ScreenSizeY_G);
    json.setJSONObject("Screen", jsonScreen);

    JSONObject jsonKey = new JSONObject();
    jsonKey.setString("up", Character.toString(up_G));
    jsonKey.setString("left", Character.toString(left_G));
    jsonKey.setString("down", Character.toString(down_G));
    jsonKey.setString("right", Character.toString(right_G));
    json.setJSONObject("key", jsonKey);
    
    JSONObject jsonAuther = new JSONObject();
    jsonAuther.setInt("SnakeSpeed", SnakeSpeed_G);
    jsonAuther.setInt("sizeCases", sizeCases_G);
    json.setJSONObject("Auther", jsonAuther);
    
    saveJSONObject(json,"optionSnake.json");
  }
}



private class SnakeClass{
  //variable to draw snake
  boolean gameOver = false;
  private float sizeCaseX;
  private float sizeCaseY;
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
    
    background(0);
    Snake.DrawSnake();
    Snake.SpawnFood();
    gameOver = false;
    
    gameState = GameState.IN_GAME;
  }
  
  
  
  void DrawSnake(){
    for (int i = 0; i < snakeX.size(); i++){
      if(i == 0){
        //Draw the head of the snake
        noStroke();
        //fill(90, 170, 255);
        fill(255);
        rect((snakeX.get(i) * sizeCaseX) + (sizeCaseX/2), (snakeY.get(i) * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
      }
      else{
        //Draw the Corp of the snake
        //colorMode(HSB);
        noStroke();
        fill((i*30)%359, 255, (i*30*i)%99);
        rect((snakeX.get(i) * sizeCaseX) + (sizeCaseX/2), (snakeY.get(i) * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
      }
    }
  }
  
  
  
  void SnakeMovement(){
    int nextPositonX = CalculNextPosition(snakeX.get(0), directionX);
    int nextPositonY = CalculNextPosition(snakeY.get(0), directionY);;
    
    if ((snakeX.size() > 0) && 
    (nextPositonX == snakeX.get(0)) && 
    (nextPositonY == snakeY.get(0))){
          

    }
    if(GameOver(nextPositonX, nextPositonY) == true){
      SnakePosition(nextPositonX, nextPositonY);
      Snake.DrawSnake();
    }
    else{
      gameState = GameState.GAME_OVER;
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
    stroke(0);
    fill(0);
    rect((LastPositionX * sizeCaseX) + (sizeCaseX/2), (LastPositionY * sizeCaseY) + (sizeCaseY/2), sizeCaseX, sizeCaseY);
   }
   alonger = false;
  }
  
  
  
  void SpawnFood(){
    //set the position of the food
    foodPositionX = (int)random(0, nombreCasesX-1);
    foodPositionY = (int)random(0, nombreCasesY-1);
    for(int i = 0; i < snakeX.size(); i ++){
      if(foodPositionX == snakeX.get(i) && 
         foodPositionY == snakeY.get(i)){
           SpawnFood();
      }
    }
    //drawfood
    noStroke();
    fill(255, 255, 0);
    rect((foodPositionX * Snake.sizeCaseX) + (Snake.sizeCaseX/2), (foodPositionY * Snake.sizeCaseY) + (Snake.sizeCaseY/2), Snake.sizeCaseX, sizeCaseY);
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



public class PersistantVariable{
  public boolean EASTER_EGG_KEY_ALT = false;
  public boolean EASTER_EGG_KEY_V = false;
}



void SplashScreen(){
  if(keyPressed == true || mousePressed == true){
    Snake.InitialisationVariable();
    gameState = GameState.IN_GAME;
  }
}



void GameOver(){
  textAlign(CENTER);
  textSize(height/6);
  fill(255, 0, 0);
  text("Game over", width/2, height/2);
}


private class EasterEgg{
  void CreateurName(){
    PImage easter_egg = loadImage("data/Image/EasterEgg/CreateurName.png");
    if(width > height){
      easter_egg.resize(width/8, (int)((width/8) / 2.4));
    }
    else{
      easter_egg.resize(height/8, (int)((height/8) / 2.4));
    }
    imageMode(CORNER);
    image(easter_egg, 0, 0);
  }
}



void keyPressed(){
  boolean changeDirection = false;
  int tempDirectionX = 0;
  int tempDirectionY = 0;
  
  
  //Control snake
  if(key == up_G || keyCode == UP){
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
  
  if(key == left_G || keyCode == LEFT){
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
  
  if(key == down_G || keyCode == DOWN){
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
  
  if(key == right_G || keyCode == RIGHT){
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
    if(gameState == GameState.IN_GAME || gameState == GameState.GAME_OVER){
      Snake.InitialisationVariable();
    }
  }
  
  if(key == 'p' || key == 'P'){
    if(Snake.gameOver == false){
      Snake.gameOver = true;
    }
    else{
      Snake.gameOver = false;
    }
  }
  
  if(key == 'q' || key == 'Q'){
    if (Snake.snakeX.size() > 1){
      Snake.snakeX.remove(Snake.snakeX.size()-1);
      Snake.snakeY.remove(Snake.snakeY.size()-1);
    }
  }
  
  if(key == 'e' || key == 'E'){
    Snake.snakeX.add(Snake.snakeX.size(), -1);
    Snake.snakeY.add(Snake.snakeY.size(), -1);
  }
  
  if(keyCode == ALT){
    simultaneKey.EASTER_EGG_KEY_ALT = true; //<>//
  }
  
  if(key == 'v'){
    simultaneKey.EASTER_EGG_KEY_V = true; //<>//
    println("key v = " + simultaneKey.EASTER_EGG_KEY_V);
  }
}



void keyReleased(){
  if(keyCode == ALT){
    simultaneKey.EASTER_EGG_KEY_ALT = false;
    println("key alt = " + simultaneKey.EASTER_EGG_KEY_ALT);
  }
  
  if(key == 'v'){
    simultaneKey.EASTER_EGG_KEY_V = false;
    println("key v = " + simultaneKey.EASTER_EGG_KEY_V);
  }
}
