int g_iteration = 10; //<>//
void setup() {
  noLoop();
  //size(800, 800);
  fullScreen();
  background(0);

    // Method 1
  {
    Complex nb1 = new Complex(1,2);
    Complex nb2 = new Complex(3,4);
    Complex dummy = new Complex();
    Complex resultat = new Complex();
    
    resultat = dummy.Addition(nb1, nb2);
    println("Method1: resultat = " + "(" + resultat.getR() + ", " + resultat.getI() +")");
  }
  
  
    // Method 2
    {
    Complex nb1 = new Complex(1,2);
    Complex nb2 = new Complex(3,4);
    Complex resultat = new Complex();
    
    resultat = nb1.Addition(nb2);
    println("Method2: resultat = " + "(" + resultat.getR() + ", " + resultat.getI() +")");
  }
}



void draw() {
  Mandelbrot mandelbrot = new Mandelbrot(g_iteration);
  for(float x = -2; x <= 2; x += 0.01){
    for(float y = -2; y <= 2; y += 0.01){
      Complex pixel_position = new Complex(x, y);
      int result_iteration = mandelbrot.Calcule_mandelBrot(pixel_position);
      pixelColor(result_iteration, (int)((x + 2) * 200) + 200, (int)((y + 2) * 200) + 200);
    }
  }
}



void pixelColor(int nombre_iteration, int x, int y){
  color c;
  switch (nombre_iteration) {
    case 0: {
      c = color(255, 255, 255);
      break;
    }
    case 1: {
      c = color(255, 255, 255);
      break;
    }
    case 2: {
      c = color(255, 255, 255);
      break;
    }
    case 3: {
      c = color(255, 255, 255);
      break;
    }
    case 4: {
      c = color(255, 255, 255);
      break;
    }
    case 5: {
      c = color(255, 255, 255);
      break;
    }
    case 6: {
      c = color(255, 255, 255);
      break;
    }
    case 7: {
      c = color(255, 255, 255);
      break;
    }
    case 8: {
      c = color(255, 255, 255);
      break;
    }
    case 9: {
      c = color(0, 0, 0);
      break;
    }
    default: {
      c = color(0, 0, 0);
    }
  }
  set(x, y, c);
}
