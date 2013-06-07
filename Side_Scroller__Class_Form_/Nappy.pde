class Nappy {
  float speed2;
  PImage nappy;
  float nappyx=1600;
  float nappyy;

  Nappy() {
    nappyy=random(25, height-25);
    nappy= loadImage("Nappy.png");
    speed2=random(3, 7);
  }

  void draw() {
    image(nappy, nappyx, nappyy, 50, 50);
  }

  void run() {
    nappyx-=speed2;
    if (nappyx<-50) {
      nappyx=1600;
      nappyy=random(25, height-25);
    }
  }
}
