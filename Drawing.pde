void drawCalendar(int month, int year, float cx, float cy, float w, float h) {
  rectMode(CENTER);
  stroke(60); noFill(); strokeWeight(1);
  rect(cx, cy, w+10, h+10);
  
  int days = DateTime.DaysInMonth(month, year);
  int firstDay = DateTime.DayOfWeek(1, month, year);
  
  int rows = (days + firstDay - 1) / 7 + 1;
  
  float dayHeight = h / (float)rows;
  float dayWidth = w / 7.0f;
  
  float calTopLeftX = cx - w/2.0f;
  float calTopLeftY = cy - h/2.0f;
  
  for(int i = 1; i <= days; i++) {
    drawDay(i, firstDay, dayWidth, dayHeight, calTopLeftX, calTopLeftY);
  }  
}

void drawDay (int day, int firstDayOfWeek, float dw, float dh, float ctlx, float ctly) {
   rectMode(CORNER);
   float tlx = ctlx + ((firstDayOfWeek + day - 1) % 7) * dw;
   float tly = ctly + ((firstDayOfWeek + day - 1) / 7) * dh;
   stroke(255); noFill(); strokeWeight(1);
   rect(tlx, tly, dw, dh);
   textSize(24); textFont(font_cabin); textAlign(LEFT, CENTER);
   text(day, tlx + 5, tly + 15);
}
