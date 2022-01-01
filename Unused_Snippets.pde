void drawYearCalendar (int year) {
  float cw = width/4.0f;
  float ch = height/3.0f;
  for(int i = 0; i < 12; i++) {
    drawCalendar(i + 1, year, cw/2.0f + width / 4.0f * (i % 4), ch/2.0f + height/3.0f * (i/4), cw-30, ch-30);
  }
}
