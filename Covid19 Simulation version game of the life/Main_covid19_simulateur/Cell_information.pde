public class CellValue{
  Cellules_types case_state;
  int infection_time;
  int imuniter_time_affter_guerison;
  boolean resistent;
  
  public CellValue(){
    case_state = Cellules_types.VIVANT;
    infection_time = 0;
    imuniter_time_affter_guerison = 0;
    resistent = false;
  }
}
