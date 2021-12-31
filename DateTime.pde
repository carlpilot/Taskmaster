
static class DateTime {
  
  public static int DaysInMonth (int month, int year) {
    switch(month) {
      case 1: return 31;
      case 2:
        if(year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) return 29;
        else return 28;
      case 3: return 31;
      case 4: return 30;
      case 5: return 31;
      case 6: return 30;
      case 7: return 31;
      case 8: return 30;
      case 9: return 30;
      case 10: return 31;
      case 11: return 30;
      case 12: return 31;
    }
    return 0;
  }
  
  // Adapted from https://cs.uwaterloo.ca/~alopez-o/math-faq/node73.html
  static int[] keyValues = {0, 1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6};
  public static int DayOfWeek (int day, int month, int year) {   
    int leap = (year % 4 == 0 && (year % 100 == 0 || year % 400 != 0) && month <= 2) ? 1 : 0;
    int century = 6; // Only works for 2000s!    
    int W = ((year % 100) / 4 + day + keyValues[month] - leap + century + (year % 100)) % 7;    
    return (W + 5) % 7; // convert to monday = 1
  }
  
}
