import java.util.ArrayList;

import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.nio.file.Paths;

//Create class
SnakeClass Snake;
PersistantVariable simultaneKey = new PersistantVariable();
EasterEgg Egg = new EasterEgg();
 JsonFile File = new JsonFile();

enum GameState {
  LOAD_SPLASH_SCREEN,
  SPLASH_SCREEN,
  LOAD_IN_GAME,
  IN_GAME,
  LOAD_GAME_OVER,
  GAME_OVER
}
GameState gameState = GameState.LOAD_SPLASH_SCREEN;


//parametre
//Screen
boolean fullScreen_G = true;
int screenSizeX_G = 800;
int screenSizeY_G = 800;

//Auther
int sizeCases_G = (int)((1920/100)*1.6);

//Snake
boolean SpawnSnakeAtRandomPosition = false;
int SnakeSpeed_G = 20;
int SnakeMagnificationSpeed_G = 1;

//Control
char up_G = 'w';
char left_G = 'a';
char down_G = 's';
char right_G = 'd';



void settings(){
  File.JsonOption();
  if(fullScreen_G == true){
    fullScreen(1);
  }
  else{
    size(screenSizeX_G, screenSizeY_G);
  }
}



void setup(){
  frameRate(120);
  
  background(0);
  rectMode(CENTER);
  
  //set the size of the case and the number of the cases.
 int nombresCasesX = ((int)width/sizeCases_G);
  float sizeCaseX = ((float)width / nombresCasesX);

  int nombresCasesY = ((int)height/sizeCases_G);
  float sizeCaseY = ((float)height / nombresCasesY);

  Snake = new SnakeClass(nombresCasesX, nombresCasesY, sizeCaseX, sizeCaseY);
  Snake.gameOver = false;
}



void draw(){
  switch (gameState){
    case LOAD_SPLASH_SCREEN:{
      DrawSplashScreen();
      gameState = GameState.SPLASH_SCREEN;
      break;
    }
    case SPLASH_SCREEN:{
      cursor();
      if(keyPressed == true || mousePressed == true){
        Snake.InitialisationVariable();
        gameState = GameState.LOAD_IN_GAME;
        }
        break;
      }
      case LOAD_IN_GAME:{
        if(Snake.directionX !=0 || Snake.directionY != 0){
        Snake.gameTime = millis();
        gameState = GameState.IN_GAME;
        
        frameRate(SnakeSpeed_G);
        noCursor();
      }
      break;
    }
    case IN_GAME:{
      if(Snake.gameOver == false){
        Snake.SnakeMovement();
         Snake.DrawScore(true, false);
        Snake.DrawSnake();
        
        //check if snake eat food
        if(Snake.snakeX.get(0) == Snake.foodPositionX && 
           Snake.snakeY.get(0) == Snake.foodPositionY){
          Snake.numberFoodEat = ++Snake.numberFoodEat;
          Snake.SpawnFood(true, true); 
          Snake.Alonger();
        }
      }
      
      if(simultaneKey.EASTER_EGG_KEY_ALT == true && 
         simultaneKey.EASTER_EGG_KEY_V == true){
        Egg.CreateurName();
        simultaneKey.EASTER_EGG_KEY_ALT = false;
        simultaneKey.EASTER_EGG_KEY_V = false;
      }
      break;
    }
    case LOAD_GAME_OVER:{
      cursor();
      //scoreboardImage();
      GameOver();
      Snake.DrawScore(false, true);
      Snake.SpawnFood(false, true);
      Snake.DrawSnake();
      File.jsonGameNumber();
      File.txtScore();
      gameState = GameState.GAME_OVER;      
      break;
    }
    case GAME_OVER:{
      
      break;
    }
  }
}



private class JsonFile{
  void JsonOption() {
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/optionSnake.json");
      
      JSONObject jsonScreen = new JSONObject();
      jsonScreen = json.getJSONObject("Screen");
      fullScreen_G = jsonScreen.getBoolean("FullScreen");
      screenSizeX_G = Math.abs(jsonScreen.getInt("SizeX"));
      screenSizeY_G = Math.abs(jsonScreen.getInt("SizeY"));
      
      JSONObject jsonKey = new JSONObject();
      jsonKey = json.getJSONObject("key");
      up_G = jsonKey.getString("up").toLowerCase().toCharArray()[0];
      left_G = jsonKey.getString("left").toLowerCase().toCharArray()[0];
      down_G = jsonKey.getString("down").toLowerCase().toCharArray()[0];
      right_G = jsonKey.getString("right").toLowerCase().toCharArray()[0];
      
      JSONObject jsonAuther = new JSONObject();
      jsonAuther = json.getJSONObject("Auther");
      sizeCases_G = Math.abs(jsonAuther.getInt("sizeCases", sizeCases_G));
      
      JSONObject jsonSnake = new JSONObject();
      jsonSnake = json.getJSONObject("Snake");
      SnakeSpeed_G = Math.abs(jsonAuther.getInt("Speed", SnakeSpeed_G));
      SnakeMagnificationSpeed_G = Math.abs(jsonSnake.getInt("speed magnification", SnakeMagnificationSpeed_G));
    }
    catch(Exception e){
      JSONObject json = new JSONObject();
      
      JSONObject jsonScreen = new JSONObject();
      jsonScreen.setBoolean("FullScreen", fullScreen_G);
      jsonScreen.setInt("SizeX", Math.abs(screenSizeX_G));
      jsonScreen.setInt("SizeY", Math.abs(screenSizeY_G));
      json.setJSONObject("Screen", jsonScreen);
      
      JSONObject jsonKey = new JSONObject();
      jsonKey.setString("up", Character.toString(up_G).toLowerCase());
      jsonKey.setString("left", Character.toString(left_G).toLowerCase());
      jsonKey.setString("down", Character.toString(down_G).toLowerCase());
      jsonKey.setString("right", Character.toString(right_G).toLowerCase());
      json.setJSONObject("key", jsonKey);
      
      JSONObject jsonAuther = new JSONObject();
      jsonAuther.setInt("sizeCases", Math.abs(sizeCases_G));
      json.setJSONObject("Auther", jsonAuther);
      
      JSONObject jsonSnake = new JSONObject();
      jsonSnake.setInt("Speed", Math.abs(SnakeSpeed_G));
      jsonSnake.setInt("speed magnification", Math.abs(SnakeMagnificationSpeed_G));
      json.setJSONObject("Snake", jsonSnake);
      
      saveJSONObject(json, sketchPath() + "/optionSnake.json");
    }
  }
  
  
  
  void jsonGameNumber(){
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/data/GameNumber.json");
      
      
      int tempGameNumber = json.getInt("/GameNumber");
      
      json.setInt("GameNumber: ", (tempGameNumber + 1));
      saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
    } catch(Exception e){
      try{
        JSONObject json = new JSONObject();
        json.setInt("GameNumber", 1);
        saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
      } catch(Exception i){
        
      }
    }
  }
  


  void txtScore(){
    try{
      Files.createFile(Paths.get(sketchPath() + "/ScoreBoard.txt"));
      
      //set the value of the game nuber to 0
      JSONObject json = new JSONObject();
      json.setInt("GameNumber", 1);
      saveJSONObject(json, sketchPath() + "/data/GameNumber.json");
    } catch (IOException e) {
      
    }
    
    try{
      JSONObject json;
      json = loadJSONObject(sketchPath() + "/data/GameNumber.json");
      
      String tempTxt = "        Game " + json.getInt("GameNumber") + "\n\nFood eats: " + Snake.numberFoodEat + "\nTime play: " + Snake.snakeX.size()  +" Secondes" + "\n--------------------------\n";
      //String tmpText = "\nPoint = " + Snake.numberFoodEat + "\n";
      Files.write(Paths.get(sketchPath() + "/ScoreBoard.txt"), tempTxt.getBytes(),  StandardOpenOption.APPEND);
    } catch (IOException e) {
      
    } //<>//
  }
}



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



public class EasterEgg{
  void CreateurName(){
    PImage easter_egg = loadImage("/data/Image/EasterEgg/CreateurName.png");
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



public class PersistantVariable{
  public boolean EASTER_EGG_KEY_ALT = false;
  public boolean EASTER_EGG_KEY_V = false;
}



void DrawSplashScreen(){
  //drawSplashScreen
  PImage splashScreen = loadImage(sketchPath() + "/data/Image/SplashScreen/SplashScreen.png");
  if(width > height){
    splashScreen.resize((height/4)*3, (height/4)*3);
  }
  else{
  splashScreen.resize((width/4)*3, (width/4)*3);
  }
  imageMode(CENTER);
  image(splashScreen, width/2, height/2);
}



void GameOver(){
  textAlign(CENTER);
  textSize(height/6);
  fill(255, 0, 0);  
  text("Game over\n", width/2, height/2 - height/12);
  fill(255);
  textSize(height/16);
  text("Time play: " + ((int)(millis() - Snake.gameTime)/1000) + " Secondes" + "\nScore: " + Snake.numberFoodEat, width/2, height/2 + height/32);
}



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
