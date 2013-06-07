class PtwoBullet {
  PlayerDos ptwo;
  PImage bullet;
  int bx;
  int by;

  PtwoBullet() {
    ptwo= new PlayerDos();
    bullet= loadImage("bullet.png");
    bx=ptwo.x;
    by=ptwo.y;
  }

  void draw() {
    image(bullet, bx+30, by+30, 20, 10);
  }

  void shoot() {
    if (BlackBox.isKeyDown(BlackBox.VK_NUMPAD0)) {
      bx+=7;
    }
  }
}

