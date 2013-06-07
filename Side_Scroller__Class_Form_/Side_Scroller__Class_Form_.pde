int hamount=4;
int namount=3;
int samount=2;
int aamount=1;
PlayerUno pone;
PlayerDos ptwo;
PoneBullet poneshot;
PtwoBullet ptwoshot;
Happy[] happy;
Nappy[] nappy;
Sappy[] sappy;
Albert[] albert;
PImage space;

void setup() {
  BlackBox.init(this);
  size(800, 700);
  poneshot= new PoneBullet();
  ptwoshot= new PtwoBullet();
  pone= new PlayerUno();
  ptwo= new PlayerDos();
  happy= new Happy[hamount];
  nappy= new Nappy[namount];
  sappy= new Sappy[samount];
  albert= new Albert[aamount];
  space= loadImage("Star Background.jpg");
  for (int i = 0; i < hamount; i++) {
    happy[i] = new Happy();
  }
  for (int i = 0; i < namount; i++) {
    nappy[i] = new Nappy();
  }
  for (int i = 0; i < samount; i++) {
    sappy[i] = new Sappy();
  }
  for (int i = 0; i < aamount; i++) {
    albert[i] = new Albert();
  }
}

void draw() {
  //background
  image(space, 0, 0, width, height);
  pone.draw();
  pone.move();
  pone.barrier();
  ptwo.draw();
  ptwo.move();
  ptwo.barrier();
  for (int i =0;i < hamount;i++) {
    happy[i].draw();
    happy[i].run();
  }
  for (int i =0;i < namount;i++) {
    nappy[i].draw();
    nappy[i].run();
  }
  for (int i =0;i < samount;i++) {
    sappy[i].draw();
    sappy[i].run();
  }
  for (int i =0;i < aamount;i++) {
    albert[i].draw();
    albert[i].run();
  }
}

