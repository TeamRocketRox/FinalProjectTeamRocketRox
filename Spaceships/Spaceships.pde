float X = 125;
float Y = 650;
float A = 825;
float B = 650;
PImage p1;
PImage p2;

void setup() {
  size(1000, 750);
  background(250);
  p1=loadImage("Player 1.png");
  p2=loadImage("Player 2.png");
}
void draw() {
  background(250);
  image(p1, X, Y, 50, 50);
  image(p2, A, B, 50, 50);
  if (keyPressed) {
    if (key=='a') {
      X=X-10;
    }
    if (key=='d') {
      X=X+10;
    }
    fill(0);
    if (key=='j') {
      A=A-10;
    }
    if (key=='l') {
      A=A+10;
    }
  }
}

