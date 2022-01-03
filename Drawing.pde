
int windowMargin = 100;


// Draw a calendar for a particular month and year, centred at (cx, cy) with size (w, h)
void drawCalendar(int month, int year, float cx, float cy, float w, float h) {

  // Calculate days in month and the weekday of the first day of the month
  int days = DaysInMonth(month, year);
  int firstDay = DayOfWeek(1, month, year);

  // Calculate how many rows the calendar needs
  int rows = (days + firstDay - 1) / 7 + 1;

  // Calculate the width and height of each day
  float dayHeight = h / (float)rows;
  float dayWidth = w / 7.0f;

  // Calculate the top left point of the calendar
  float calTopLeftX = cx - w/2.0f;
  float calTopLeftY = cy - h/2.0f;

  // Loop over days and draw
  for (int i = 1; i <= days; i++) {
    drawDay(i, month, year, firstDay, dayWidth, dayHeight, calTopLeftX, calTopLeftY);
  }

  // Draw border
  rectMode(CENTER);
  stroke(255);
  noFill();
  strokeWeight(1);
  rect(cx, cy, w+10, h+10);
}



// Draw a particular day given the day of month, which weekday was the first of the month,
// the size of the box (dw, dh) and the calendar top left (ctlx, ctly)
void drawDay (int day, int month, int year, int firstDayOfWeek, float dw, float dh, float ctlx, float ctly) {
  rectMode(CORNER);
  Date today = new Date(day, month, year);
  Date tomorrow = today.addDays(1);

  // Calculate the top left (x,y) coordinate of this day
  float tlx = ctlx + ((firstDayOfWeek + day - 1) % 7) * dw;
  float tly = ctly + ((firstDayOfWeek + day - 1) / 7) * dh;

  // Draw the rectangle
  if(currentScreen == 0 && mouseX >= tlx && mouseX <= tlx + dw && mouseY >= tly && mouseY <= tly + dh) fill(255,30); else noFill();
  stroke(60);strokeWeight(1);rect(tlx, tly, dw, dh);

  // Draw the text for which day it is
  textSize(24);textFont(font_cabin);textAlign(LEFT, CENTER);fill(255);
  text(day, tlx + 5, tly + 15);

  // Draw the box for tasks
  noStroke();fill(255, 30);
  float taskBoxHeight = dh/2.0f - 5;
  rect(tlx + 5, tly + dh/2, dw-10, taskBoxHeight);
  fill(255); // reset fill, otherwise opacity is messed up

  // Write any tasks that may be present
  ArrayList<Task> todayTasks = new ArrayList<Task>();
  for (int i = 0; i < tasks.size(); i++) {
    if (tasks.get(i).deadline().equals(tomorrow)) todayTasks.add(tasks.get(i));
  }
  textSize(36 * (taskBoxHeight / 3) / (textAscent() + textDescent()) * 0.8);
  textAlign(LEFT, CENTER);
  for (int i = 0; i < todayTasks.size(); i++) {
    String n = todayTasks.get(i).name;
    if (todayTasks.get(i).hardDeadline.equals(tomorrow)) {
      fill(255, 50, 50);
    } else {
      fill(255);
    }
    text(todayTasks.get(i).name, tlx + 5, tly + dh/2 + 5 + i * taskBoxHeight / 3);
  }
  
  if(mousePressed && currentScreen == 0 && mouseX >= tlx && mouseX <= tlx + dw && mouseY >= tly && mouseY <= tly + dh) {
    screens.get(1).associatedDate = new Date(day, month, year); 
    switchScreen(1);
  }
  
}



// Draw a particular screen
void drawScreen (int s) {
  
  if(s == 0) return; // don't draw screen 0
  
  if(mousePressed && currentScreen != 0 && (mouseX < windowMargin || mouseX > width - windowMargin || mouseY < windowMargin || mouseY > height - windowMargin)) switchScreen(0);
  
  Screen sc = screens.get(s);  
  drawScreen(sc);
}
