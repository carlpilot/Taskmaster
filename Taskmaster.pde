
ArrayList<Task> tasks = new ArrayList<Task>();

PFont font_cabin;

void setup () {
  size(1024, 768);
  
  font_cabin = createFont("/fonts/Cabin-Regular.ttf", 24);
  
  // Test code
  tasks.add(new Task("Example Task", 3, new Date(5,1,2022), new Date(3,1,2022), 0));
  tasks.add(new Task("To-Do no. 2", 1, new Date(3,1,2022), new Date(3,1,2022), 0));
  println(new Date(01, 01, 2022).dispLong());
}

void draw () {
  background(30);
  
  // Title
  textAlign(LEFT, TOP);  textSize(48);  stroke(255);  noFill();
  text("Taskmaster", 12, 6);
  String date = new Date(day(), month(), year()).dispLong();
  textSize(48*textWidth("Taskmaster")/textWidth(date));
  text(date, 12, 58);
  
  // Draw calendar
  float calWidth = width - 200;
  float calHeight = height - 200;
  drawCalendar(1, 2022, width - calWidth/2 -5, height - calHeight/2 -5, calWidth, calHeight);
}
