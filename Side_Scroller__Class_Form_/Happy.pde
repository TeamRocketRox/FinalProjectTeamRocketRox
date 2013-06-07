class Happy {
  float speed1;
  PImage happy;
  float happyx=1400;
  float happyy;

  Happy() {
    happyy=random(25, height-25);
    happy= loadImage("Happy.png");
    speed1=random(3, 6);
  }

  void draw() {
    image(happy, happyx, happyy, 50, 50);
  }

  void run() {
    happyx-=speed1;
    if (happyx<-50) {
      happyx=1400;
      happyy=random(25, height-25);
    }
  }
}

