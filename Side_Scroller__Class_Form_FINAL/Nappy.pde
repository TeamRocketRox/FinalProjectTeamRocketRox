class Nappy {
  float speed2;
  PImage nappy;
  float x=random(1400,2000);
  float y;

  Nappy() {
    //Random speed and height
    y=random(105, height-65);
    nappy= loadImage("Nappy.png");
    speed2=random(4, 7);
  }

  void draw() {
    image(nappy, x, y, 50, 50);
  }

//If passes screen, restarts position
  void run() {
    x-=speed2;
    if (x<-50) {
      x=1600;
      y=random(105, height-65);
    }
  }
}
