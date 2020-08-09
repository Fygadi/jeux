void setup(){
  fullScreen();
  select_pixel();
}


void select_pixel(){
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
    
      println("i == " + i);
      println("j == " + j);
      
      colorMode(HSB);
      stroke(((i*j) %360), i%width, j%height);
      point(i, j);
    }
  }
}
