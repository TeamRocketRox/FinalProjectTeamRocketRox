class Albert {
  float speed4;
  PImage albert;
  float x=random(1400,2000);
  float y;

  Albert() {
    //Random speed and height
    y=random(105, height-65);
    albert= loadImage("Albert.png");
    speed4=random(6, 9);
  }

  void draw() {
    image(albert, x, y, 50, 50);
  }
//If passes screen, restarts position
  void run() {
    x-=speed4;
    if (x<-50) {
      x=2000;
      y=random(105, height-65);
    }
  }
}

