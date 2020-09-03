public class Mandelbrot { //<>//
  int nb_iteration;
  
  Mandelbrot(int _iteration) {nb_iteration = _iteration;}
  
  int Calcule_mandelBrot(Complex c){
    Complex dummy = new Complex();
    Complex Zn = new Complex();
    
    int i = 0;
    
    //while module of Zn < 2
    //2 * 2 = 4
    while (i < nb_iteration && ((Zn.getR() * Zn.getR()) + (Zn.getI() * Zn.getI())) < 4){
      //calcule Zn+1 = (Zn * Zn) + C
      Zn = dummy.Addition(dummy.Squar(Zn), c);
      i++;
    }
    return i;
  }
}
