void setup() {
  background(65,105,225);
  fullScreen();
}



void draw(){
  number();
}



void number(){
  float point_x1 = 3;
  float point_y1 = 1;
  
  float point_x2 = 5;
  float point_y2 = 2;
  
  float point_x3 = 6;
  float point_y3 = 7;
  
  float point_x4 = 8;
  float point_y4 = 7;
  
  
  float temp = 0;
  float total = 0;
  temp = calculent_la_pente(point_x1, point_y1, point_x2, point_y2);
  total = total + temp;
  
  temp = calculent_la_pente(point_x2, point_y2, point_x3, point_y3);
  total = total + temp;
  
  temp = calculent_la_pente(point_x3, point_y3, point_x4, point_y4);
  total = total + temp;
  
  float moyen = total/3;
  println("moyen = " + moyen);
}



float calculent_la_pente(float x1, float y1, float x2, float y2){
    float resultat = (y1-y2)/(x1-x2);
  return resultat;
}
