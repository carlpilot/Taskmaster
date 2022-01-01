
PFont font_cabin;

void setup () {
  size(1024, 768);
  
  font_cabin = createFont("/fonts/Cabin-Regular.ttf", 24);
}

void draw () {
  background(30);
  drawCalendar(1, 2022, width/2, height/2, width-200, height-200);
}
