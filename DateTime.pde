String[] weekdays = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
String[] months = {"", "January", "February", "March", "April", "May", "June",
                       "July", "August", "September", "October", "November", "December"};


public static int DaysInMonth (int month, int year) {
  switch(month) {
    case 1: return 31;
    case 2:
      if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) return 29;
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


class Date implements Comparable<Date> {

  int day, month, year;

  int weekday;

  public Date (int day, int month, int year) {
    this.day = day;
    this.month = month;
    this.year = year;
    weekday = DayOfWeek (day, month, year);
  }

  public Date addDays (int numDays) {
    int d = day;
    int m = month;
    int y = year;

    if (numDays > 0) {
      for (int i = 0; i < numDays; i++) {
        d++;
        if (d > DaysInMonth(m, y)) {
          d = 1;
          m++;
          if (m > 12) {
            m = 1;
            y++;
          }
        }
      }
    } else if (numDays < 0) {
      for (int i = 0; i < numDays; i++) {
        d--;
        if (d <= 0) {
          m--;
          if (m <= 0) y--;
          d = DaysInMonth(m, y);
        }
      }
    }

    return new Date(d, m, y);
  }

  boolean equals (Date d2) {
    return day == d2.day && month == d2.month && year == d2.year;
  }

  String toString() {
    return disp();
  }

  String disp () {
    return day + "/" + month + "/" + year;
  }

  String dispLong () {
    return weekdays[weekday] + " " + day + " " + months[month] + " " + year;
  }
  
  int dateCompare () {
    return int(String.format("%04d", year) + String.format("%02d", month) + String.format("%02d", day)); 
  }
  
  @Override
  int compareTo(Date other) {
    return dateCompare() - other.dateCompare();
  }
}
