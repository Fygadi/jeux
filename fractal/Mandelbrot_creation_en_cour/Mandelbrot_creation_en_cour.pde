int number_iteration_G = 10;

void setup(){
  size(800, 800);
  background(0);
}

private class MandelBrot {
  float real;
  float imaginair;
  
  
  int Pixel_position(int x, int y) {
    int pixel_position;
    //convert the position (x, y) to a number (1, nuber_pixel)
    pixel_position = x + ((y * width) - width);
    return pixel_position;
  }
  
  
  void mandelbrot(float c) {
    
    float new_Zn = 0;
    float Zn = 0;
    
    new_Zn = (Zn * Zn) + c;
  }
  
  
  float Complex(float r, float i) {
    
    int x; int y;
    x = 8;
    y = 5i;
    
    
    
    return (r + i);
  }
}
