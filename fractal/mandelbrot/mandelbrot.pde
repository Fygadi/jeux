boolean pause = false;

void setup()
{
  size(1080,1080);
}



  void draw()
{
  int posX=0;
  int posY=0;
  
  if (pause == false)
  {
    for(float x = -1.5; posX < 800; x=x+.003, posX++)
    {
      posY=0;
      for(float y = -1; posY <800; y = y+.003, posY++)
      {
        Complex z = new Complex(x,y);
        Complex z0 = new Complex(x,y);
        stroke(0);
        color c = color(0, 0, 0);
        int itt = 400; 
        for(int k = 1; k < itt; k++)
        {
          z = z.multi(z);
          z = z.add(z0);
          if(z.module() > 4)
          {
            colorMode(HSB);
            c = color((k*3+150)%255, 255, 255);
            break;
          }
          //if(z.real <= -4 || z.real >= 4 || z.img <= -4 || z.img >= 4){
          //  break;
          //}
        }
        set(posX,posY, c);
        //println("posX=" + posX + "  PosY= " + posY);
      }
    } //<>//
    pause = true;
  }
}



class Complex 
{
  float real;   // the real part
  float img;   // the imaginary part
  
  public Complex(float real, float img) 
  {
    this.real = real;
    this.img = img;
  }
  
  public Complex multi(Complex b) 
  {
    float real = this.real * b.real - this.img * b.img;
    float img = this.real * b.img + this.img * b.real;
    return new Complex(real, img);
  }
  
   public Complex add(Complex b) 
   {
     float real = this.real + b.real;
     float img = this.img + b.img;
     return new Complex(real, img);
   }
   
   public float module() 
   {
     float mod = (this.real * this.real) + (this.img * this.img);
     return (mod);
   }
}
