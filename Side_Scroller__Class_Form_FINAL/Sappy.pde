class Sappy {
  float speed3;
  PImage sappy;
  float x=random(1400, 2000);
  float y;

  Sappy() {
    //Random speed and height
    y=random(105, height-65);
    sappy= loadImage("Sappy.png");
    speed3=random(5, 8);
  }

  void draw() {
    image(sappy, x, y, 50, 50);
  }

//If passes screen, restarts position
  void run() {
    x-=speed3;
    if (x<-50) {
      x=1800;
      y=random(105, height-65);
    }
  }
}

