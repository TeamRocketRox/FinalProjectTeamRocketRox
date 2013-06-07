class Albert {
  float speed4;
  PImage albert;
  float albertx=2000;
  float alberty;

  Albert() {
    alberty=random(25, height-25);
    albert= loadImage("Albert.png");
    speed4=random(4, 9);
  }

  void draw() {
    image(albert, albertx, alberty, 50, 50);
  }

  void run() {
    albertx-=speed4;
    if (albertx<-50) {
      albertx=2000;
      alberty=random(25, height-25);
    }
  }
}

