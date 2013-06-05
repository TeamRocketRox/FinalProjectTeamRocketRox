PImage gameover;
int x = 400;
int y = 350;

void setup() {
  size(800, 700);
  imageMode(CENTER);
  gameover=loadImage("Gameover.png");
}

void draw() {
  background(0);
  image(gameover, x, y);
}

