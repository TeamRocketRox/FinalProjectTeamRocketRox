class Sappy {
  float speed3;
  PImage sappy;
  float sappyx=1800;
  float sappyy;

  Sappy() {
    sappyy=random(25, height-25);
    sappy= loadImage("Sappy.png");
    speed3=random(3, 8);
  }

  void draw() {
    image(sappy, sappyx, sappyy, 50, 50);
  }

  void run() {
    sappyx-=speed3;
    if (sappyx<-50) {
      sappyx=1800;
      sappyy=random(25, height-25);
    }
  }
}
