class PlayerDos {
  PImage ptwo;
  int x=20;
  int y=500;

  PlayerDos() {
    ptwo= loadImage("Player 2_LEFT.png");
  }

  void draw() {
    image(ptwo, x, y, 60, 60);
  }

  void move() {
    if (BlackBox.isKeyDown(BlackBox.VK_A)) {
      x+=-4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      x+=4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_W)) {
      y+=-4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_S)) {
      y+=4.5;
    }
  }

  void barrier() {
    if (x>width-60) {
      x=width-60;
    }
    if (x<0) {
      x=0;
    }
    if (y>height-60) {
      y=height-60;
    }
    if (y<0) {
      y=0;
    }
  }
}
