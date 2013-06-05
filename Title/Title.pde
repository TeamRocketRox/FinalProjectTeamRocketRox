PImage title;
int x = 400;
int y = 350;

void setup() {
  size(800, 700);
  imageMode(CENTER);
  title=loadImage("title.png");
}

void draw() {
  background(0);
  image(title, x, y);
}

