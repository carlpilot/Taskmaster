
class UIText {
  
  String text;
  float cx, cy;
  int size;
  int colour;
  
  public UIText (String text, float cx, float cy, int size, int colour) {
    this.text = text; this.cx = cx; this.cy = cy; this.size = size; this.colour = colour;
  }
  
  void draw () {
    textAlign(CENTER, CENTER); textSize(size); fill(colour);
    text(text, cx, cy);
  }
  
}

class Button {

  String text;
  float cx, cy, w, h;
  float tlx, tly;
  int screen;
  
  Date associatedDate;

  public Button (String text, float cx, float cy, float w, float h, int screen) {
    this.text = text;
    this.cx = cx;
    this.cy = cy;
    this.w = w;
    this.h = h;
    this.screen = screen;
    tlx = cx - w/2;
    tly = cy - h/2;
  }

  boolean pressed () {
    if (currentScreen != screen) return false; // buttons on inactive screens do nothing
    return (mouseX > tlx && mouseY > tly && mouseX <= tlx + w && mouseY <= tly + h);
  }
}
