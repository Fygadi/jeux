public class CellValue{
  Cellules_types case_state;
  int infection_time;
  
  public CellValue(){
    case_state = Cellules_types.VIVANT;
    infection_time = 0;
  }
  
  //CaseStats[1][1].caseStats = Cellules_types.MALADE;
  //CaseStats[1][1].infection_time = 100;
}
