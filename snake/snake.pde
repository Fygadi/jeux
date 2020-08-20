import java.util.ArrayList;

//import java.io.File;
//import java.io.FileWriter;
//import java.io.IOException;
//import java.util.Scanner;
//import java.io.FileNotFoundException;
import java.io.*;
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
  IN_GAME,
  GAME_OVER,
  SCOREBOARD
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
int SnakeSpeed_G = 22;
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
  frameRate(SnakeSpeed_G);
  
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
    }
    case SPLASH_SCREEN:{
      cursor();
      if(keyPressed == true || mousePressed == true){
        Snake.InitialisationVariable();
        gameState = GameState.IN_GAME;
  }
      break;
    }
    case IN_GAME:{
      if(Snake.gameOver == false){
        noCursor();
        Snake.SnakeMovement();
        Snake.DrawSnake();
        
        //check if snake eat food
        if(Snake.snakeX.get(0) == Snake.foodPositionX && 
           Snake.snakeY.get(0) == Snake.foodPositionY){
          Snake.numberFoodEat = ++Snake.numberFoodEat;
          Snake.SpawnFood(); 
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
    case GAME_OVER:{
      cursor();
      //GameOver();
      scoreboardImage();
      File.jsonGameNumber();
      File.txtScore();
      gameState = GameState.SCOREBOARD;
      
      break;
    }
    case SCOREBOARD:{
      break;
    }
  }
}



private class JsonFile{
  void JsonOption() {
    try{
      JSONObject json;
      json = loadJSONObject("optionSnake.json");
      
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
      SnakeSpeed_G = Math.abs(jsonAuther.getInt("Snake Speed", SnakeSpeed_G));
      SnakeMagnificationSpeed_G = Math.abs(jsonSnake.getInt("Snake speed magnification", SnakeMagnificationSpeed_G));
    }
    catch(Exception e){
      println("Ereur = " + e);
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
      jsonSnake.setInt("Snake Speed", Math.abs(SnakeSpeed_G));
      jsonSnake.setInt("Snake speed magnification", Math.abs(SnakeMagnificationSpeed_G));
      json.setJSONObject("Snake", jsonSnake);
      
      saveJSONObject(json,"optionSnake.json");
    }
  }
  
  
  
  void jsonGameNumber(){
    try{
      JSONObject json;
      json = loadJSONObject("data/GameNumber.json");
      
      int tempGameNumber = json.getInt("GameNumber");
      
      json.setInt("GameNumber", ++tempGameNumber);
      saveJSONObject(json,"data/GameNumber.json");
    } catch(Exception e){
      try{
        JSONObject json = new JSONObject();
        json.setInt("GameNumber", 1);
        saveJSONObject(json,"data/GameNumber.json");
      } catch(Exception i){
        
      }
    }
  }
  


  void txtScore(){
    try{
      Files.createFile(Paths.get("C:/Users/victor/Documents/GitHub/jeux/snake/Scoreboard.txt"));
      
      //set the value of the game nuber to 0
      JSONObject json = new JSONObject();
      json.setInt("GameNumber", 1);
      saveJSONObject(json,"data/GameNumber.json");
    } catch (IOException e) {
      
    }
    
    try{
      JSONObject json;
      json = loadJSONObject("data/GameNumber.json");
      
      String tempTxt = "        Game " + json.getInt("GameNumber") + "\n\nFood eats = " + Snake.numberFoodEat + "\nSnake size = " + Snake.snakeX.size() + "\n--------------------------\n";
      //String tmpText = "\nPoint = " + Snake.numberFoodEat + "\n";
      Files.write(Paths.get("C:/Users/victor/Documents/GitHub/jeux/snake/Scoreboard.txt"), tempTxt.getBytes(),  StandardOpenOption.APPEND);
    } catch (IOException e) {
      
    } //<>// //<>// //<>//
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
    }
    else{
      gameState = GameState.GAME_OVER;
    }
  }
  
  
  
  void SnakePosition(int newPositionX,int newPositionY){
    //shift the array list
    snakeX.add(0, newPositionX);
    snakeY.add(0, newPositionY);
    
    int LastPositionX = snakeX.get(snakeX.size()-1);
    int LastPositionY = snakeY.get(snakeX.size()-1);

    snakeX.remove(snakeX.size()-1);
    snakeY.remove(snakeY.size()-1);
    
    //remove la trainer du snake
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



public class EasterEgg{
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



public class PersistantVariable{
  public boolean EASTER_EGG_KEY_ALT = false;
  public boolean EASTER_EGG_KEY_V = false;
}



void DrawSplashScreen(){
  //drawSplashScreen
  PImage splashScreen = loadImage("data/Image/SplashScreen/SplashScreen.png");
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
  text("Game over", width/2, height/2);
}



void scoreboardImage(){
  PImage Scoreboard = loadImage("data/Image/ScorBoard/Scorboard test.png");
  if(width > height){
    Scoreboard.resize((height/4)*3, (height/4)*3);
  }
  else{
  Scoreboard.resize((width/4)*3, (width/4)*3);
  }
  background(0);
  imageMode(CENTER);
  image(Scoreboard, width/2, height/2);
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
    if(gameState == GameState.IN_GAME || gameState == GameState.SCOREBOARD){
      Snake.InitialisationVariable();
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
    }
  }else if(key == 'e' || key == 'E'){
    Snake.snakeX.add(Snake.snakeX.size(), -1);
    Snake.snakeY.add(Snake.snakeY.size(), -1);
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




//void mousePressed(){
//  println("Position mouse = " + mouseX + ", " + mouseY);
//}
