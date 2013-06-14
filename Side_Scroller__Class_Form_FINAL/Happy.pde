class Happy {
  float speed1;
  PImage happy;
  float x=random(1400,2000);
  float y;

  Happy() {
    //Random speed and height
    y=random(105, height-65);
    happy= loadImage("Happy.png");
    speed1=random(3, 6);
  }

  void draw() {
    image(happy, x, y, 50, 50);
  }
  
//If passes screen, restarts position
  void run() {
    x-=speed1;
    if (x<-50) {
      x=1400;
      y=random(105, height-65);
    }
  }
}

