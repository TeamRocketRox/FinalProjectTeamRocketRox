class PoneBullet {
  PlayerUno pone; 
  PImage bullet;
  int bx;
  int by;

  PoneBullet() {
    pone= new PlayerUno();
    bullet= loadImage("bullet.png");
    bx=pone.x;
    by=pone.y;
  }

  void draw() {
    image(bullet, bx+30, by+30, 20, 10);
  }
  
   void shoot(){
   if (BlackBox.isKeyDown(BlackBox.VK_SPACE)) {
      bx+=7;
    }
  }
}


