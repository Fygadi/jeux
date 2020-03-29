float x, y;
float a1 = 120, b1 = 30;
float a2 = 60, b2 = 10;

void setup(){
  fullScreen();
  
  println("a1*x+b ==" + a1*x+b1);
}



void draw(){
  draw_line(); 
}



void draw_line(){
  //float ligne_0[] = new float[3];
  //float ligne_1[] = new float[3];
  
  
  //stroke(255, 0, 0);
  //line(ligne_0[0], ligne_0[1], ligne_0[2], ligne_0[3]); 
  //line(ligne_1[0], ligne_1[1], ligne_1[2], ligne_1[3]);
}



float[] Position_intersection(){
  float intersection[] = new float[1];
  
  intersection[0] = ((b1-b2)/(a2-a1));
  intersection[1] = ((a1 * intersection[0]) + b1);
  
  return intersection;
}



float linearfonction(int a, int x, int b){
  float y = a*x+b;
  return y;
}
 


//this fuction find the value max and min for the lignes x and y.
float[] find_value(float intersection_X, float intersection_Y){
  float value[] = new float[3];
  
  Math.abs(intersection_X);
  Math.abs(intersection_Y);
  
  //value[0] max in X,  value[1] = Value min in X
  value[0] = intersection_X + 15;
  value[1] = intersection_X - 15;
  
  //value[2] max in Y,  value[3] = Value min in Y
  if (linearfonction(a, x, b) > linearfonction(a, x, b){
    
  }
  else{
    
  }
  
  //value[2] = 
  //value[3] = 
  
  
  
  return value;
}



float convert(float number){
  
  return number;
}
