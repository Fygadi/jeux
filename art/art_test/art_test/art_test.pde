int couleur = 0;



void setup()
{
  fullScreen();
}



void draw()
{
  
}



void mouseClicked()
{
  int nombre_couleur = 8;
  
  switch(couleur)
  {
    case 1: fill(0); 
    break;
    
    case 2: fill(255);
    break;
    
    case 3: fill(255, 0, 0);
    break;
    
    case 4: fill( 0, 255, 0);
    break;
    
    case 5: fill(0, 0, 255);
    break;
    
    case 6: fill(255, 255, 0);
    case 7: 
    case 8: 
  }
  
  if (couleur > nombre_couleur)
  {
    couleur = 0;
  }
}
