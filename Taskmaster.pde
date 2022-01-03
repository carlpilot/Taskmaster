import java.util.Collections;

ArrayList<Task> tasks = new ArrayList<Task>();

PFont font_cabin;

int currentScreen = 0;

ArrayList<Screen> screens = new ArrayList<Screen>();


void setup () {
  size(1024, 768);

  font_cabin = createFont("/fonts/Cabin-Regular.ttf", 24);
  
  initScreens();

  // Test code
  tasks.add(new Task("Example Task", 3, new Date(5, 1, 2022), new Date(3, 1, 2022), 0));
  tasks.add(new Task("To-Do no. 2", 1, new Date(3, 1, 2022), new Date(3, 1, 2022), 0));
  tasks.add(new Task("To-Do no. 3", 1, new Date(7, 1, 2022), new Date(2, 1, 2022), 0));
  println(new Date(01, 01, 2022).dispLong());
  
  Collections.sort(tasks);
  printArray(tasks);
}


void draw () {
  background(30);

  // Title
  textAlign(LEFT, TOP);textSize(48);fill(255);noStroke();
  text("Taskmaster", 12, 6);
  String date = new Date(day(), month(), year()).dispLong();
  textSize(48*textWidth("Taskmaster")/textWidth(date));
  text(date, 12, 58);

  // Draw calendar
  float calWidth = width - 200;
  float calHeight = height - 200;
  drawCalendar(1, 2022, width - calWidth/2 -5, height - calHeight/2 -5, calWidth, calHeight);

  // Draw mask and window if screen is not 0
  if (currentScreen != 0) {
    rectMode(CORNER);fill(30, 200);noStroke();
    rect(0, 0, width, height);
  }
  drawScreen(currentScreen);
}

/*
void mouseClicked () {
  for (int i = 0; i < buttons.size(); i++) {
    buttons.get(i).mouseClicked();
  }
}
*/
