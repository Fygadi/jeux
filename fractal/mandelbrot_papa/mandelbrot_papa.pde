void setup()
{
  size(100, 100);
}



void draw()
{
  for(int x = 0; x < 100; x++)
  {
    for(int y = 0; y <100; y++)
    {
      mandelbrot(x,y);
    }
  }
}



void mandelbrot(int x, int y)
{
  Complex z = new Complex(x, y);
  
  for (int idx=0; idx<100; idx++)
  {
   Complex zn =  new Complex(z.carre()).Add(7);
   if 
  }
}









public class Complex {
  public int re, im;

  /** This is the constructor.  It initializes the x and y variables */
  public Complex(int real, int imaginary) {
    this.re = real;
    this.im = imaginary;
  }
  
  public Complex(Complex a) {
    this.re = a.re;
    this.im = a.im;
  }
  
  public Complex Add(int c)
  {
    Complex tmp = new Complex(re+c, im);
    return tmp;
  }
  
  /** A static class method to multiply complex numbers */
  public Complex carre() {
    return new Complex(re * re - im * im, 2 * re * im);
  }
}
