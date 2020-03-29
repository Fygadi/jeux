float x, y;
float a1 = -10/18., b1 = 1000;
float a2 = 10/17., b2 = -1000./17;

//float a1 = -1, b1 = 1000;
//float a2 = 2, b2 = -1000./17;


void setup(){
  background(0);
  fullScreen();
  
  entrer();
}



void draw(){
   
}



void entrer(){
  //label
  textSize(25);
  textAlign(LEFT, CENTER);
  
  text("Droite 1: y = " + a1 + " x + " + b1, width/2, 50);
  text("Droite 2: y = " + a2 + " x + " + b2, width/2, 100);
  
  //#1 calcule l'intersection des deux droites
  float intersection[] = new float[2];
  intersection = Position_intersection();

  
  //#2 calcule les deux valeur de Y pour une droite
  float y_droite_1[] = new float[2];
  float x_droite_1 = intersection[0];
  y_droite_1[0] = linearfonction(a1, x_droite_1 - 800, b1);
  y_droite_1[1] = linearfonction(a1, x_droite_1 + 800, b1);
 
  draw_line(x_droite_1 - 800, y_droite_1[0],
            x_droite_1 + 800, y_droite_1[1],
            1);
  
  
  float y_droite_2[] = new float[2];
  float x_droite_2 = intersection[0];
  y_droite_2[0] = linearfonction(a2, x_droite_2 - 800, b2);
  y_droite_2[1] = linearfonction(a2, x_droite_2 + 800, b2); 

  draw_line(x_droite_2 - 800, y_droite_2[0],
            x_droite_2 + 800, y_droite_2[1],
            2);
}



void draw_line(float x1, float y1,float x2,float y2, int couleur){
  
  switch (couleur)
  {
    case 1:
    stroke(255, 0, 0);
    fill(255, 0, 0);
    break;
    
    case 2:
    stroke(0, 255, 0);
    fill(0, 255, 0);
    break;
    
    default:
    stroke(0, 0, 255);
    fill(0, 0, 255);
  }
  
  
  
  strokeWeight(1);
  line(x1, y1, x2, y2);
  
  textSize(25);
  
  //point #1
  text(x1, x1, height-30);
  text(y1, 30, y1);
  
  //point #2
  text(x2, x2, height-30);
  text(y2, 30, y2);
}



void draw_position_line(){
}



float[] Position_intersection(){
  float intersection[] = new float[2];
  
  intersection[0] = ((b1-b2)/(a2-a1));
  intersection[1] = linearfonction(a1, intersection[0], b1);
  
  return intersection;
}



float linearfonction(float a, float x, float b){
  float y = (a*x)+b;
  return y;
}



float convert(float number){
  
  return number;
}
