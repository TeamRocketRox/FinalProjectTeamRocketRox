class PtwoBullet {
  PImage bullet;
  int bx;
  int by;

  PtwoBullet() {
    bullet= loadImage("bullet.png");
    bx=ptwo.x;
    by=ptwo.y;
  }

  void shoot() { 
    bx+=7;
  }

  void draw() {
    image(bullet, bx+30, by+30, 20, 10);
  }

  //Booleans to check if bullets hit enemies
  boolean hitCheck1(Happy h) {
    if (bx>=h.x-25 && bx<=h.x+25 && by>=h.y-25 && by<=h.y+25) {
      return true;
    } else {
      return false;
    }
  }
  boolean hitCheck2(Nappy n) {
    if (bx>=n.x-25 && bx<=n.x+25 && by>=n.y-25 && by<=n.y+25) {
      return true;
    } else {
      return false;
    }
  }
  boolean hitCheck3(Sappy s) {
    if (bx>=s.x-25 && bx<=s.x+25 && by>=s.y-25 && by<=s.y+25) {
      return true;
    } else {
      return false;
    }
  }
  boolean hitCheck4(Albert a) {
    if (bx>=a.x-25 && bx<=a.x+25 && by>=a.y-25 && by<=a.y+25) {
      return true;
    } else {
      return false;
    }
  }
}

