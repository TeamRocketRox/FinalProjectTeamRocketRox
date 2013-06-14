class PlayerUno {
  PImage pone;
  boolean hit;
  int life;
  int x=20;
  int y=250;

  PlayerUno() {
    pone= loadImage("Player 1_LEFT.png");
    life=100;
  }

  void draw() {
    image(pone, x, y, 60, 60);
  }
//Allows movement and prevents from exiting screen
  void move() {
    if (BlackBox.isKeyDown(BlackBox.VK_A)) {
      x+=-4.5;
      if (x<0) {
        x=0;
      }
    }
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      x+=4.5;
      if (x>width-60) {
        x=width-60;
      }
    }
    if (BlackBox.isKeyDown(BlackBox.VK_W)) {
      y+=-4.5;
      if (y<105) {
        y=105;
      }
    }
    if (BlackBox.isKeyDown(BlackBox.VK_S)) {
      y+=4.5;
      if (y>height-100) {
        y=height-100;
      }
    }
  }
// Booleans to check if player is hurt
  boolean Hurt1(Happy h) {
    if (h.x>=x-30 && h.x<=x+30 && h.y>=y-30 && h.y<=y+30) {
      return true;
    } else {
      return false;
    }
  }
  boolean Hurt2(Nappy n) {
    if (n.x>=x-30 && n.x<=x+30 && n.y>=y-30 && n.y<=y+30) {
      return true;
    } else {
      return false;
    }
  }
  boolean Hurt3(Sappy s) {
    if (s.x>=x-30 && s.x<=x+30 && s.y>=y-30 && s.y<=y+30) {
      return true;
    } else {
      return false;
    }
  }
  boolean Hurt4(Albert a) {
    if (a.x>=x-30 && a.x<=x+30 && a.y>=y-30 && a.y<=y+30) {
      return true;
    } else {
      return false;
    }
  }
}

