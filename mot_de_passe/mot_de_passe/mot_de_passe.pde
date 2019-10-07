int nombreCaractere = 8;

void setup()
{
    background(0);
  for (int i = 0; i < nombreCaractere; i = i+1)
  {
    randomCharactere();
  }
}



void randomCharactere()
{
  print (((char)(int)random(0, 127)));
}

//http://www.asciitable.com/
