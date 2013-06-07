boolean button = true;
PImage title;
PImage Screen1;
PImage Screen2;
PImage Screen3;
PImage Screen4;
PImage Screen5;
PImage Screen6;
PImage Screen7;
PImage Screen8;
PImage Screen9;
PImage Screen10;
PImage Screen11;
PImage Screen12;
PImage Screen13;
PImage Screen14;
PImage Screen15;
PImage Screen16;
int screen = 0;

void setup() {
  size(800, 700);
  imageMode(CENTER);
  title=loadImage("title.png");
  Screen1=loadImage("Screen 1.png");
  Screen2=loadImage("Screen 2.png");
  Screen3=loadImage("Screen 3.png");
  Screen4=loadImage("Screen 4.png");
  Screen5=loadImage("Screen 5.png");
  Screen6=loadImage("Screen 6.png");
  Screen7=loadImage("Screen 7.png");
  Screen8=loadImage("Screen 8.png");
  Screen9=loadImage("Screen 9.png");
  Screen10=loadImage("Screen 10.png");
  Screen11=loadImage("Screen 11.png");
  Screen12=loadImage("Screen 12.png");
  Screen13=loadImage("Screen 13.png");
  Screen14=loadImage("Screen 14.png");
  Screen15=loadImage("Screen 15.png");
  Screen16=loadImage("Screen 16.png");
}


void draw() {
  background(255);
  imageMode(CENTER);
  if (screen==0) {
    image(title, width/2, height/2);
  }
  if (screen==1) {
    image(Screen1, width/2, height/2);
  }
  if (screen==2) {
    image(Screen2, width/2, height/2);
  }
  if (screen==3) {
    image(Screen3, width/2, height/2);
  }
  if (screen==4) {
    image(Screen4, width/2, height/2);
  }
  if (screen==5) {
    image(Screen5, width/2, height/2);
  }
  if (screen==6) {
    image(Screen6, width/2, height/2);
  }
  if (screen==7) {
    image(Screen7, width/2, height/2);
  }
  if (screen==8) {
    image(Screen8, width/2, height/2);
  }
  if (screen==9) {
    image(Screen9, width/2, height/2);
  }
  if (screen==10) {
    image(Screen10, width/2, height/2);
  }
  if (screen==11) {
    image(Screen11, width/2, height/2);
  }
  if (screen==12) {
    image(Screen12, width/2, height/2);
  }
  if (screen==13) {
    image(Screen13, width/2, height/2);
  }
  if (screen==14) {
    image(Screen14, width/2, height/2);
  }
  if (screen==15) {
    image(Screen15, width/2, height/2);
  }
  if (screen==16) {
    image(Screen16, width/2, height/2);
  }
}
void mousePressed() {
  if (mouseX>0 && mouseX<800 && mouseY>0 && mouseY<700) {
    button=!button;
  };
  if (button) {
    screen++;
  }
  if (!button) {
    screen++;
  }
}  

