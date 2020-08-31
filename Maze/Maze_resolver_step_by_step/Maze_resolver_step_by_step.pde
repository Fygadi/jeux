import java.util.Arrays; //<>//
import java.util.ArrayList;
import javafx.util.Pair; 

Maze maze;
Persistant_variable variable = new Persistant_variable();


enum GameState {
  GRID, 
    GRID_NEXT, 
    GENERATEUR, 
    GENERATEUR_NEXT, 
    RESOLVER, 
    RESOLVER_NEXT,
    DRAW_MAZE,
    END
}
GameState gameState = GameState.GRID;

//the global variable i is temporaire.
int temp_Complex = 0;


boolean complex_G = true ;
int mazeSize_G = 61;



void setup(){
  frameRate(120);
  fullScreen(3);
  background(#282828);

  colorMode(HSB, (mazeSize_G/2 * mazeSize_G/2));
  rectMode(CENTER);
  maze = new Maze();
}



void draw(){
  //println("gameState = " + gameState);
  switch (gameState) {
  case GRID:{
      maze.CreateGrid();
      maze.DrawMaze();
      gameState = GameState.GRID_NEXT;
      break;
    }
  case GRID_NEXT:{
      if (keyPressed)
        if (variable.Key_r_pressed == false)
          gameState = GameState.GENERATEUR;
      break;
    }
  case GENERATEUR:{
      if (maze.GenerationFinish() == true) {
        if(temp_Complex < maze.mazeSize - 2){
          temp_Complex++;
          maze.Complex();
          delay((int)(1000/70));
        }
        else {
          gameState = GameState.GENERATEUR_NEXT;
        }
      }
      else {
        maze.Generateur();
        maze.DrawMaze();
        delay((int)(1000/70));
      }

      break;
    }
  case GENERATEUR_NEXT:{
      if (keyPressed)
        gameState = GameState.RESOLVER;
      break;
    }
  case RESOLVER:{
      maze.Solver();
      gameState = GameState.RESOLVER_NEXT;
      break;
    }
  case RESOLVER_NEXT:
    {
      if (keyPressed == true || mousePressed == true)
        gameState = GameState.DRAW_MAZE;
      break;
    }
    case DRAW_MAZE:{
      if (keyPressed == true || mousePressed == true) {
        
        for(int i = 0; i < maze.mazeSize-1; i++){
          for(int j = 0; j < maze.mazeSize-1; j++){
            if(maze.maze[i][j] > 0)
              maze.maze[i][j] = maze.path_nb;
          }
        }
        gameState = GameState.END;
      }
      break;
    }
  case END:
    {

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
    
    
    //set the wall can be break
    for (int i = 1; i < mazeSize-1; i++)
    {
      for (int j = 1; j < mazeSize-1; j += 2)
      {
        if ((i % 2) == 0)
        {
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
  
  
  
  void Complex(){
    if(wall.size() > 0){
      int randomWall = (int)random(0, wall.size()-1);
      
      int x = wall.get(randomWall).getKey();
      int y = wall.get(randomWall).getValue();
      wall.remove(randomWall);
      
      //replace wall by path
      maze[x][y] = path_nb;
      DrawMaze();
    }
    else{
      gameState = GameState.GENERATEUR_NEXT;
    }
    println(wall.size());
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



  void Solver() {
    //every cell = path_nb
    for (int i = 1; i < mazeSize-1; i++) {
      for (int j = 1; j < mazeSize-1; j++) {
        if (maze[i][j] >= 0) {
          maze[i][j] = path_nb;
        }
      }
    }
    maze[0][1] = enter_nb;
    
    
    int distance = 1;
    int temp[][] = new int[mazeSize][mazeSize];
    while (maze[1][1] == 0) {  //Gives each cell the distance between the actual location and the exit
    
      for (int i = 0; i < mazeSize; i++) {
        for (int j = 0; j < mazeSize; j++) {
          temp[i][j] = maze[i][j];
        }
      }
      
      distance++;
      //give distance to maze[][]
      for (int i = mazeSize-2; i > 0; i--) {
        for (int j = mazeSize-2; j > 0; j--) {
          if (maze[i][j] == path_nb) {
            if (maze[i - 1][j] > 0 || maze[i + 1][j] > 0 || maze[i][j - 1] > 0 || maze[i][j + 1] > 0) {
              temp[i][j] = distance;
            }
          }
        }
      }
      
      for (int i = 0; i < mazeSize; i++) {
        for (int j = 0; j < mazeSize; j++) {
          maze[i][j] = temp[i][j];
        }
      }
    }
    
    
    //print table of maze
    for (int a = 0; a < mazeSize; a++) {
      for (int b = 0; b < mazeSize; b++) {
        System.out.format("%3d ", maze[b][a]);
      }
      println();
    }
    println();
    println();
    println();
    
    
    
    int x = 1;
    int y = 1;
    int up, down, left, right;
    while (x != mazeSize - 2 || y != mazeSize - 2) {  //set 
      up = maze[x][y - 1];
      down = maze[x][y + 1];
      left = maze[x - 1][y];
      right = maze[x + 1][y];
      
      
      //Check if variable is != path
      //if variable == wall
      //set a big number to this variable
      if(up <= 0)
        up = (mazeSize * mazeSize);
      if(down <= 0)
        down = (mazeSize * mazeSize);
      
      if(left <= 0)
        left = (mazeSize * mazeSize);
        
      if(right <= 0)
        right = (mazeSize * mazeSize);
      
      println("(" + x + ", " + y + ")");
      println("up = " + up);
      println("down = " + down);
      println("left = " + left);
      println("right = " + right);
      println();
      println();
      println();
        
        
        if (up <= down && up <= left && up <= right) {
        y--;
      } else if (down <= up && down <= left && down <= right) {
        y++;
      } else if (left <= up && left <= down && left <= right) {
        x--;
      } else if (right <= up && right <= down && right <= left) {
        x++;
      }
      maze[x][y] = solution_nb;
    }
    DrawMaze();
  }



  void DrawMaze() {
    for (int i = 0; i < mazeSize; i++) {
      for (int j = 0; j < mazeSize; j++) {
        switch (maze[i][j]) {
          case 0:{
            //white
            //path
            fill(#FFFFFF);
            break;
          }
          case -1:{
            //black
            //wall
            fill(#000000);
            break;
          }
          case -2:{
            //white
            //enter
            fill(#FFFFFF);
            break;
          }
          case -3:{
            //white
            //exit
            fill(#FFFFFF);
            break;
          }
          case -4:{
            //green
            //solution
            fill(#00FF00);
            //fill(#FFFFFF);
            break;
          }
          default:{
            //set the color by the number of the case
            fill ((maze[i][j] * 30) % (mazeSize/2 * mazeSize/2), (mazeSize/2 * mazeSize/2), (mazeSize/2 * mazeSize/2));
            break;
          }
        }
        noStroke();
        rect(((i * sizeCase + ((width-height)/2)) + sizeCase/2), ((j * sizeCase) + (sizeCase/2)), sizeCase, sizeCase);
      }
    }
  }
}



public class Persistant_variable {
  boolean Key_r_pressed;
}



void keyPressed() {
  if (key == 'r' || key == 'R' && gameState != GameState.GRID) {
    if (variable.Key_r_pressed == false) {
      background(#282828);
      gameState = GameState.GRID;
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
      maze.DrawMaze();
    }
    catch(Exception e) {
    }
  }
}
