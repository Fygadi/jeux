Maze maze;


  

void setup(){
  frameRate(60);
  fullScreen(3);
  background(40);
  
  colorMode(RGB);
  rectMode(CENTER);
  maze = new Maze();
  
  maze.CreateGrid();
  maze.generateur();
  
}



void draw(){
  maze.drawMaze();
}



public class Maze{
  int mazeSize = 11;
  int sizeCase;

  //-1 == BLACK / wall
  //0 == WHITE / path
  int[][] maze = new int[mazeSize][mazeSize];
  
  public Maze(){
    sizeCase = height/mazeSize;
  }
  
  
  
  void CreateGrid(){    
    //create grid
    for(int i = 0; i < mazeSize; i++){
      for(int j = 0; j < mazeSize; j++){
  
        if(i%2 == 0){
          maze[i][j] = -1;
        }
        else if(i%2 == 1){
          if(j%2 == 0){
            maze[i][j] = -1;
          }
          else if(j%2 == 1){
            maze[i][j] = 0;
          }
          else
          {
            println("error");
          }
          
        }
      }
    }
    
    int number = 0;
    for(int i = 0; i < mazeSize; i++){
      for(int j = 0; j < mazeSize; j++){
        
        if(maze[i][j] == 0){
          maze[i][j] = number;
          number = number +1;
        }
        
      }
    }
    maze[0][1] = 1;
    maze[mazeSize -1][mazeSize -2] = number;
  }
  
  
  
  void generateur(){
    while(generationFinish() == false){
      int x = (int)random(1, mazeSize-1);
      int y;
            

    if (x % 2 == 0)
    //set te variable y to random impair number
      y = ((int)random(0, (mazeSize - 1) / 2)  ) * 2 + 1;
    else
    //set te variable y to random pair number
      y = ((int)random(0, (mazeSize - 2) / 2)  ) * 2 + 2;
      
      
      int cell_1;
      int cell_2;
       //<>//
      if(maze[x-1][y] == -1){
        cell_1 = maze[x][y-1];
        cell_2 = maze[x][y+1];
      }
      else{
        cell_1 = maze[x-1][y];
        cell_2 = maze[x+1][y];
      }
      
      if(cell_1 != cell_2){
        maze[x][y] = 0;
        
        for(int i = 1; i < mazeSize-2; i = i+2){
          for(int j = 1; j < mazeSize-2; j = j +2){
            if(maze[i][j] == cell_2)
            maze[i][j] = cell_1;
          }
        }
      }
    }
  }
  
  
  
  boolean generationFinish(){
    for (int i = 1; i < mazeSize - 2; i += 2)
    {
      for (int j = 1; j < mazeSize - 2; j += 2)
      {
        if (maze[i][j] != maze[1][1])
        return false;
      }
    }
    return true;
  }
  
  
  
  void drawMaze(){
    for(int i = 0; i < mazeSize; i++){
      for(int j = 0; j < mazeSize; j++){
        if(maze[i][j] == -1){
          fill(0);
        }
        else if(maze[i][j] == 0){
          fill(255);
        }
        else{
          fill(maze[i][j] * 20 % 255 + 40, maze[i][j] * 5 % 255 + 40, maze[i][j] /5 % 255 + 40);
        }
        noStroke();
        rect (((i * sizeCase + ((width-height)/2)) + sizeCase/2), ((j * sizeCase) + (sizeCase/2)), sizeCase, sizeCase);
      }
    }
  }
}



void keyPressed(){
  if(key == 'r' || key == 'R'){
    maze.CreateGrid();
    maze.generateur();
  }
}



void mousePressed(){
  if(mouseButton == LEFT){
    int caseX = (mouseX - (width-height)/2) / maze.sizeCase;
    int caseY = mouseY / maze.sizeCase;
    try{
      println("Case (" + caseX  + ", " + caseY + ") = " + maze.maze[caseX][caseY]);
    }
    catch(Exception e){
      
    }
  }
}
