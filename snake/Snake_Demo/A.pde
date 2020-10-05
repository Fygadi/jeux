import java.util.ArrayList;

import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.nio.file.Paths;

PImage bg = new PImage();

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
    fullScreen();
  }
  else{
    size(screenSizeX_G, screenSizeY_G);
  }
}



void setup(){
  frameRate(120); //<>//
  selectInput("Select a image to process:", "fileSelected");
  background(0);
  
  //String value = selectInput("Select background image", "image");
  //background(0);
  rectMode(CENTER);
  
  //set the size of the case and the number of the cases.
  int nombresCasesX = ((int)width/sizeCases_G);
  float sizeCaseX = ((float)width / nombresCasesX);

  int nombresCasesY = ((int)height/sizeCases_G);
  float sizeCaseY = ((float)height / nombresCasesY);

  Snake = new SnakeClass(nombresCasesX, nombresCasesY, sizeCaseX, sizeCaseY);
  Snake.gameOver = false;
}



void fileSelected(File selected) {
  if (selected != null) {
    bg = loadImage("" + selected);
  }
  else {
    bg = loadImage(sketchPath() + "/data/Image/Background/Background.png");
  }
  bg.resize(width, height);
  image(bg, 0, 0);
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
        Snake.DrawSnake();
        Snake.DrawScore(true, false);
        
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
      
         Snake.directionX = 0;
         Snake.directionY = 0;
      // direction ou aller
       if (Snake.foodPositionX > Snake.snakeX.get(0)){
         Snake.directionX = 1;
       }
       else if (Snake.foodPositionX < Snake.snakeX.get(0)){
         Snake.directionX = -1;
       }
       else
       {
       
       if (Snake.foodPositionY > Snake.snakeY.get(0)){
         Snake.directionY = 1;
       }
       if (Snake.foodPositionY < Snake.snakeY.get(0)){
         Snake.directionY = -1;
       }
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







public class EasterEgg{
  void CreateurName(){
    PImage easter_egg = loadImage(sketchPath() + "/data/Image/EasterEgg/CreateurName.png");
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
