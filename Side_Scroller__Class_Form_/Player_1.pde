class PlayerUno {
  PImage pone;
  int x=20;
  int y=250;

  PlayerUno() {
    pone= loadImage("Player 1_LEFT.png");
  }

  void draw() {
    image(pone, x, y, 60, 60);
  }

  void move() {
    if (BlackBox.isKeyDown(BlackBox.VK_LEFT)) {
      x+=-4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_RIGHT)) {
      x+=4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_UP)) {
      y+=-4.5;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_DOWN)) {
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
