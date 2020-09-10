import java.util.Arrays; //<>//
import java.util.ArrayList;
import javafx.util.Pair; 

Maze maze;
Persistant_variable variable = new Persistant_variable();


enum GameState {
  GENERATE,
  FINISH,
  FINISH_NEXT
}
GameState gameState = GameState.GENERATE;

//the global variable i is temporaire.
boolean complex_G = true;
int mazeSize_G = 41;

//variable use to save image
int nb_G = 1;



void settings(){
  int nombreCases = mazeSize_G;
  int sizeCase = (displayHeight * 1)/mazeSize_G;
  //size((nombreCases * sizeCase), (nombreCases * sizeCase));
  fullScreen();
}




void setup(){
  frameRate(120);
  background(#282828);
  
  rectMode(CENTER);
  maze = new Maze();
}


void draw(){
  switch(gameState){
    case GENERATE:{
      if (key != 'r' || key != 'R'){
        maze.CreateGrid();
        maze.Generateur();
        gameState = GameState.FINISH;
      }
    }
    case FINISH:{
      maze.DrawMaze();
      saveFrame("maze_" + nb_G++ + ".png");
      gameState = GameState.FINISH_NEXT;
      break;
    }
    case FINISH_NEXT:{
      break;
    }
  }
}



public class Maze {
  public Maze() {
    sizeCase = height/mazeSize;
  }
  int path_nb = 0;
  int wall_nb = -1;
  int enter_nb = -2;
  int exit_nb = -3;
  int solution_nb = -4;

  boolean complex = complex_G;
  int mazeSize = mazeSize_G;
  int sizeCase;
  
  //solution == -2
  //-1 == wall
  //0 == path
  int[][] maze = new int[mazeSize][mazeSize];
  ArrayList< Pair<Integer,Integer> > wall = new ArrayList< Pair<Integer,Integer>>();



  void CreateGrid() {
    //create grid
    for (int i = 0; i < mazeSize; i++) {
      for (int j = 0; j < mazeSize; j++) {
        if (i%2 == 0) {
          maze[i][j] = wall_nb;
        }
        else if (i%2 == 1) {
          if (j%2 == 0) {
            maze[i][j] = wall_nb;
          }
          else if (j%2 == 1) {
            maze[i][j] = path_nb;
          }
        }
      }
    }
    
    
    //place the coordone (x, y) in array for wall can be break
    for (int i = 1; i < mazeSize-1; i++)
    {
      for (int j = 1; j < mazeSize-1; j += 2)
      {
        if ((i % 2) == 0){
          wall.add(new Pair(i,j));
        }
        else if (j > 1){
          wall.add(new Pair(i, j - 1));
        }
      }
    }
    
    
    //set every cell with a different number
    int number = 1;
    for (int i = 1; i < mazeSize; i += 2) {
      for (int j = 1; j < mazeSize; j += 2) {

        if (maze[i][j] == path_nb) {
          maze[i][j] = number;
          number++;
        }
      }
    }
    maze[0][1] = enter_nb;
    maze[mazeSize -1][mazeSize -2] = number;
  }


  void Generateur() {
    while (GenerationFinish() == false) {
      //wall is an array, he contain wall can be break
      //select random wall in the array wall
      int randomWall = (int)random(0, wall.size()-1);
      
      int x = wall.get(randomWall).getKey(); //<>//
      int y = wall.get(randomWall).getValue();
      wall.remove(randomWall);
      
      
      int cell_1; //<>//
      int cell_2;
      
      //check if x-1 is == to wall
      if (maze[x-1][y] == wall_nb) {
        cell_1 = maze[x][y-1];
        cell_2 = maze[x][y+1];
      }
      else {
        cell_1 = maze[x-1][y];
        cell_2 = maze[x+1][y];
      }
      
      //check if all case 
      //if case == cell_2
      //case = cell_1
      if (cell_2 != cell_1) {
        for (int i = 1; i < mazeSize-1; i++) {
          for (int j = 1; j < mazeSize-1; j++) {
            if (maze[i][j] == cell_2)
              maze[i][j] = cell_1;
          }
        }
        
        if (maze[x-1][y] == wall_nb){
          cell_1 = maze[x][y-1];
        }
        else {
          cell_1 = maze[x-1][y];
        }
        
        //break the wall and replace by cell
        maze[x][y] = cell_1;
      }
    }
    
    if (complex == true)
      Complex();
  }
  
  
  
  void Complex(){
    for (int i = 0; i < mazeSize - 2; i++){
      if(wall.size() > 0){
        int randomWall = (int)random(0, wall.size()-1);
        
        int x = wall.get(randomWall).getKey();
        int y = wall.get(randomWall).getValue();
        wall.remove(randomWall);
        
        //replace wall by path
        maze[x][y] = path_nb;
      }
      else{
        return;
      }
    }
  }
  
  
  
  boolean GenerationFinish() {
    for (int i = 1; i < mazeSize-1; i += 2)
    {
      for (int j = 1; j < mazeSize-1; j += 2)
      {
        if(maze[i][j] != maze[1][1])
          return false;
      }
    }
    return true;
  }
  
  
  
  void DrawMaze() {
    for (int i = 0; i < mazeSize; i++) {
      for (int j = 0; j < mazeSize; j++) {
        switch (maze[i][j]) {
          case -1:{
            //black
            //wall
            fill(#000000);
            stroke(#000000);
            break;
          }
          default:{
            fill(#FFFFFF);
            stroke(#FFFFFF);
          }
        }
        strokeWeight(1);
        rect(((i * sizeCase + ((width-height)/2)) + sizeCase/2), ((j * sizeCase) + (sizeCase/2)), sizeCase, sizeCase);
      }
    }
  }
}



public class Persistant_variable {
  boolean Key_r_pressed;
}



void keyPressed() {
  if (key == 'r' || key == 'R' && gameState != GameState.GENERATE) {
    if (variable.Key_r_pressed == false) {
      gameState = GameState.GENERATE;
      variable.Key_r_pressed = true;
    }
  }
}



void keyReleased() {
  if (key == 'r' || key == 'R') {
    variable.Key_r_pressed = false;
  }
}



void mousePressed() {
  if (mouseButton == LEFT) {
    int caseX = (mouseX - (width-height)/2) / maze.sizeCase;
    int caseY = mouseY / maze.sizeCase;
    try {
      //println("Case (" + caseX  + ", " + caseY + ") = " + maze.maze[caseX][caseY]);
    }
    catch(Exception e) {
    }
  }
}
