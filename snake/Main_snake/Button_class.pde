private class button{
  int posX, posY;    // Position of button
  int radius;      // Diameter of button
  int sizeX, sizeY;    //rectangle size
  color basicColor;       //Base color of button
  color highlightColor;   //hightlight color of button
  boolean pressed = false;
  int buttonMode = CENTER;
  int buttonType = RECT;  //RECT / ELLIPSE
  
  public button(){
    
  }
  
  //Circle
  public button(int tmp_posX, int tmp_posY, int tmp_radius){
    posX = tmp_posX; posY = tmp_posY;
    radius = tmp_radius;
  }
  
  public button(int tmp_posX, int tmp_posY, int tmp_radius, color tmp_basicColor, color tmp_highlightColor){
    posX = tmp_posX; posY = tmp_posY;
    radius = tmp_radius;
    basicColor = tmp_basicColor;
    highlightColor = tmp_highlightColor;
  }
  
  //Rectangle
  public button(int tmp_posX, int tmp_posY, int tmp_sizeX, int tmp_sizeY){
    posX = tmp_posX; posY = tmp_posY;
    sizeX = tmp_sizeX;
    sizeY = tmp_sizeY;
  }
  
  public button(int tmp_posX, int tmp_posY, int tmp_sizeX, int tmp_sizeY, color tmp_basicColor, color tmp_highlightColor){
    posX = tmp_posX; posY = tmp_posY;
    sizeX = tmp_sizeX;
    sizeY = tmp_sizeY;
    basicColor = tmp_basicColor;
    highlightColor = tmp_highlightColor;
  }
  
  
  
  void update(int x, int y) {
    if (this.buttonMode == ELLIPSE){
      if (overCircle(posX, posY, radius) == true) {
        this.pressed = true;
      }
    } else if (overRect(posX, posY, sizeX, sizeY)) {
      this.pressed = true;
    } else {
      pressed = false;
    }
  }
  
  
  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
