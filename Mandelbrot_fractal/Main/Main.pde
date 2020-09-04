int g_Max_iteration = 300; //<>//


float g_x1 = -2.2;
float g_x2 = 1;
float g_y1 = -1.6;
float g_y2 = 1.6;

Mandelbrot_zoom mandelbrot_zoom = new Mandelbrot_zoom();

void setup() {
  noLoop();
  size(800, 800);
  //fullScreen();
  background(0);
}



void draw() {
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      //converti pixel coordonate complex number
      Complex c = new Complex(mandelbrot_zoom.zoom_x1 + ((float)x / width) * (mandelbrot_zoom.zoom_x2 - mandelbrot_zoom.zoom_x1), 
                              mandelbrot_zoom.zoom_y1 + ((float)y / height) *(mandelbrot_zoom.zoom_y2 - mandelbrot_zoom.zoom_y1));
      
      Mandelbrot mandelbrot = new Mandelbrot(g_Max_iteration);
      int nb_iteration = mandelbrot.Calcule_mandelBrot(c);
      pixelColor(nb_iteration, g_Max_iteration, x, y);
    }
  }
  updatePixels();
  //saveFrame("mandelbrot.png");
}



void pixelColor(int iteration, int max_iteration, int x, int y){
  color c = 255 - (iteration * 255 / max_iteration);
  pixels[(x + (y * width))] = color(c, c, c);
}



void mousePressed() {
  mandelbrot_zoom.zoom_x1 = (mandelbrot_zoom.zoom_x1 + ((float)mouseX / width) * (mandelbrot_zoom.zoom_x2 - mandelbrot_zoom.zoom_x1));
  mandelbrot_zoom.zoom_y1 = (mandelbrot_zoom.zoom_y1 + ((float)mouseY / height) * (mandelbrot_zoom.zoom_y2 - mandelbrot_zoom.zoom_y1));
}



void mouseReleased(){
  mandelbrot_zoom.zoom_x2 = (mandelbrot_zoom.zoom_x1 + ((float)mouseX / width) * (mandelbrot_zoom.zoom_x2 - mandelbrot_zoom.zoom_x1));
  mandelbrot_zoom.zoom_y2 = (mandelbrot_zoom.zoom_y1 + (mandelbrot_zoom.zoom_x2 - mandelbrot_zoom.zoom_x1));
  redraw();
}



void keyPressed(){
  if (key == 'r' || key == 'R') {
    mandelbrot_zoom = new Mandelbrot_zoom();
    redraw();
  }
}
