import ddf.minim.*;

Minim minim;
AudioPlayer lose;
AudioPlayer great;
AudioPlayer start;
PImage winner;
PVector location;
PVector cannon1;
PVector cannon2;
PVector cannon3;
PVector cannon4;
ArrayList bullets;
int count;
int interval;
int score;
int c3spd;
int c4spd;
boolean titlescreen;
boolean playing;
boolean lostscreen;

void setup() {
  //music stuffz
  minim= new Minim(this);
  lose= minim.loadFile("Chrono Trigger - Ozzie Laugh.mp3");
  great= minim.loadFile("[tindeck.com] - Chrono Trigger - Fanfare 1.mp3");
  start= minim.loadFile("Chrono Trigger - Presentiment.mp3");
  winner= loadImage("a_winner_is_you_1024.jpg");
  titlescreen=true;
  playing=false;
  lostscreen=false;
  size(750, 600);
  textSize(30);
  count=0;
  interval=30;
  bullets=new ArrayList();
  //PVectors used to make variable use simpler
  location=new PVector();
  cannon1=new PVector(20, 0);
  cannon2=new PVector(0, 20);
  cannon3=new PVector(20, width);
  cannon4=new PVector(height, 20);
  c3spd=5;
  c4spd=5;
}
void draw() {
// title screen
  if (titlescreen) {
// intro music
    start.play();
    background(0);
    fill(52, 206, 202);
    textSize(50);
    text("Welcome to: DODGE!", width/2-260, 100);
    text("Dodge the bullets to stay alive!",0,250);
    text("Move with the mouse!",width/2-260,350);
    text("Click to Play!", width/2-150, height-100);
    if (mousePressed) {
      titlescreen=false;
      playing=true;
      lostscreen=false;
    }
  }
  if (playing) {
    background(175);
    PVector mouse=new PVector(mouseX, mouseY);
    PVector move=PVector.sub(mouse, location);
    count++;
    spikes();
    fill(155, 14, 198);
    textSize(50);
    text("Score:"+score, 75, 80);
    fill(188, 44, 44);
// first cannon
    cannon1.y+=max(min(mouseY-cannon1.y, random(2,5)), random(-2,-5));
    if (cannon1.y<0)cannon1.y=0;
    else if (cannon1.y>height)cannon1.y=height;
// adds cannons, adds didiculty!
    if (score>5000) {
      cannon2.x+=max(min(mouseX-cannon2.x, random(2,5)), random(-2,-5));
      if (cannon2.x<0)cannon2.x=0;
      else if (cannon2.x>width)cannon2.x=width;
    }
    if (score>10000) {
      cannon3.y+=c3spd;
      if (cannon3.y<0) {
        cannon3.y=0;
        c3spd=-c3spd;
      }
      else if (cannon3.y>height) {
        cannon3.y=height;
        c3spd=-c3spd;
      }
    }
    if (score>15000) {
      cannon4.x+=c4spd;
      if (cannon4.x<0) {
        cannon4.x=0;
        c4spd=-c4spd;
      }
      else if (cannon4.x>width) {
        cannon4.x=width;
        c4spd=-c4spd;
      }
    }
// gets the bullets going
    for (int i=0;i<bullets.size();i++) {
      ((Bullet)bullets.get(i)).run();
    }
//the cannons
    triangle(0, cannon1.y+25, 0, cannon1.y-25, 50, cannon1.y);
    if (score>5000)triangle(cannon2.x+25, 0, cannon2.x-25, 0, cannon2.x, 50);
    if (score>10000)triangle(width, cannon3.y+25, width, cannon3.y-25, width-50, cannon3.y);
    if (score>15000)triangle(cannon4.x+25, height, cannon4.x-25, height, cannon4.x, height-50);
//the player
    fill(76,198,197);
    ellipse(mouse.x, mouse.y, 50, 50);
//adds speed, adds dificulty!
    if (count>interval) {
      count=0;
      score+=1*175-(mouseX/4-50);
// bullets for each cannon
      bullets.add(new Bullet(cannon1, 1));
      if (score>5000)bullets.add(new Bullet(cannon2, 2));
      if (score>10000)bullets.add(new Bullet(cannon3, 3));
      if (score>15000)bullets.add(new Bullet(cannon4, 4));
    }
    interval=40-(bullets.size()/20);
    if (interval<10)interval=10;
// I wouldn't touch those spikes...
    if (mouseX<=70||mouseY<=70||mouseX>=width-70||mouseY>=height-70) {
      lostscreen=true;
      playing=false;
      titlescreen=false;
    }
  }
// game over screen
  if (lostscreen) {
    for(int i=0;i<bullets.size();i++){
      Bullet b=((Bullet)bullets.get(i));
      bullets.remove(b);
    }
// losing sound
    lose.play();
    background(0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2-50);
    text("Your score was:"+score, width/2, height/2);
    text("Click anywhere to play again", width/2, height/2+50);
//play again?
    if (mousePressed) {
      score=0;
      titlescreen=false;
      playing=true;
      lostscreen=false;
    }
// HAPPY EASTER
    if (key==' ') {
      image(winner, 0, 0, width, height);
      great.play();
    }
  }
}
