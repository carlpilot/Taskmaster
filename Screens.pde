
class Screen {
  int id;
  String name;

  ArrayList<Button> buttons;
  
  Date associatedDate = new Date(1,1,1);
  
  public Screen (String name, int id) {
    this.name = name; this.id = id; 
  }
  
  boolean[] pressedMask () {
    boolean[] m = new boolean[buttons.size()];
    for(int i = 0; i < m.length; i++) {
      m[i] = buttons.get(i).pressed(); 
    }
    return m;
  }
}

void switchScreen (int newScreen) {
  screenToSwitchTo = newScreen;
  // the actual switch occurs when the mouse is released by the mouseClicked function in Taskmaster.pde
}

void initScreens () {
  screens.add(new Screen("Screen 0", 0)); // no screen for index 0
  
  screens.add(new Screen("Day Summary: {date}", 1));
  
  screens.add(new Screen("Add Task", 2));
  
  screens.add(new Screen("Manage Task", 3));
}

void drawScreen (Screen sc) {
  // Draw background
  fill(30);stroke(255);strokeWeight(2);rectMode(CENTER);
  rect(width/2, height/2, width - 2 * windowMargin, height - 2 * windowMargin);
  
  // Draw window title
  textAlign(CENTER, CENTER); fill(255); textSize(36);
  String name = sc.name.replace("{date}", sc.associatedDate.dispLong());
  text(name, width/2, windowMargin + 30);
}
