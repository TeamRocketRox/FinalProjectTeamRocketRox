// Music Library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer intromusic;
AudioPlayer gamemusic;
AudioPlayer lostmusic;
AudioPlayer winmusic;
// Font
PFont SpaceFont;
//Booleans used to shift between screens in the intro 
// and to commence losing, winning, and game screens 
boolean start;
boolean gameover;
boolean gamestart;
boolean gamewin;
boolean button = true;
// Images used for intro, winning, losing, and background
PImage win;
PImage lose;
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
PImage space;
// Integers for score and for the # of enemies
int scoreone;
int scoretwo;
int hamount;
int namount;
int samount;
int aamount;
int screen = 0;
// The Players
PlayerUno pone;
PlayerDos ptwo;
// The Enemies and Bullets
ArrayList<PoneBullet> poneshot= new ArrayList<PoneBullet>();
ArrayList<PtwoBullet> ptwoshot= new ArrayList<PtwoBullet>();
ArrayList<Happy> happy= new ArrayList<Happy>();
ArrayList<Nappy> nappy= new ArrayList<Nappy>();
ArrayList<Sappy> sappy= new ArrayList<Sappy>();
ArrayList<Albert> albert= new ArrayList<Albert>();

void setup() {
  frameRate(30);
  minim= new Minim(this);
  intromusic= minim.loadFile("Hangar 18.mp3");
  gamemusic= minim.loadFile("MofP.mp3");
  lostmusic= minim.loadFile("Sad Atari.mp3");
  winmusic= minim.loadFile("Fanfare 1.mp3");
  BlackBox.init(this);
  size(800, 700);
  //Starts with the intro
  start=true;
  scoreone=0;
  scoretwo=0;
  hamount=4;
  namount=3;
  samount=2;
  aamount=1;
  SpaceFont= loadFont("SpaceFont.vlw");
  win=loadImage("Win Screen.png");
  lose=loadImage("Gameover.png");
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
  pone= new PlayerUno();
  ptwo= new PlayerDos();
  space= loadImage("Star Background.jpg");
  // Creates enemies
  for (int i = 0; i < hamount; i++) {
    happy.add(new Happy());
  }
  for (int i = 0; i < namount; i++) {
    nappy.add(new Nappy());
  }
  for (int i = 0; i < samount; i++) {
    sappy.add(new Sappy());
  }
  for (int i = 0; i < aamount; i++) {
    albert.add(new Albert());
  }
}

void draw() {
  // Intro
  if (start) {
    lostmusic.loop(9000000);
    winmusic.loop(9000000);
    gamemusic.loop(900000);
    intromusic.play();
    if (screen==0) {
      image(title, 0, 0);
    }
    if (screen==1) {
      image(Screen1, 0, 0);
    }
    if (screen==2) {
      image(Screen2, 0, 0);
    }
    if (screen==3) {
      image(Screen3, 0, 0);
    }
    if (screen==4) {
      image(Screen4, 0, 0);
    }
    if (screen==5) {
      image(Screen5, 0, 0);
    }
    if (screen==6) {
      image(Screen6, 0, 0);
    }
    if (screen==7) {
      image(Screen7, 0, 0);
    }
    if (screen==8) {
      image(Screen8, 0, 0);
    }
    if (screen==9) {
      image(Screen9, 0, 0);
    }
    if (screen==10) {
      image(Screen10, 0, 0);
    }
    if (screen==11) {
      image(Screen11, 0, 0);
    }
    if (screen==12) {
      image(Screen12, 0, 0);
    }
    if (screen==13) {
      image(Screen13, 0, 0);
    }
    if (screen==14) {
      image(Screen14, 0, 0);
    }
    if (screen==15) {
      image(Screen15, 0, 0);
    }
    if (screen==16) {
      image(Screen16, 0, 0);
    }
    //Directions on how to play
    if (screen==17) {
      background(0);
      textFont(SpaceFont);
      textSize(50);
      fill(255);
      text("Player 1 Controls:", 50, 50);
      text("Movement: WASD", 75, 150);
      text("Shoot: Space", 75, 200);
      text("Player 2 Controls:", 50, 350);
      text("Movement: Arrow Keys", 75, 450);
      text("Shoot: Numpad 0", 75, 500);
      textSize(100);
      text("Click to", 250, 600);
      text("Continue!", 240, 700);
    }
    //If clicked, game will start
    if (screen>=18) {
      gamestart=true;
      start=false;
      gameover=false;
      gamewin=false;
    }
  }
  //Game Program
  if (gamestart) {
    winmusic.loop(9000000);
    lostmusic.loop(900000);
    intromusic.loop(9000);
    gamemusic.play();
    image(space, 0, 0, width, height);
    //Health/Enemies Destroyed
    pushMatrix();
    textFont(SpaceFont);
    textSize(30);
    fill(50, 120, 255);
    text("P1 Health:", 25, 50);
    text(pone.life, 25, 100);
    text("Enemies Destroyed:", 0, 695);
    text(scoreone, 210, 695);
    popMatrix();
    pushMatrix();
    textFont(SpaceFont);
    textSize(30);
    fill(0, 255, 0);
    text("P2 Health:", 625, 50);
    text(ptwo.life, 625, 100);
    text("Enemies Destroyed:", 560, 695);
    text(scoretwo, 770, 695);
    popMatrix();
    //Player creation and movement
    pone.draw();
    pone.move();
    ptwo.draw();
    ptwo.move();
    //Player Shooting
    if (BlackBox.isKeyDown(BlackBox.VK_SPACE)) {
      poneshot.add(new PoneBullet());
    }
    if (BlackBox.isKeyDown(BlackBox.VK_NUMPAD0)) {
      ptwoshot.add(new PtwoBullet());
    }
    //Allows player to eliminate enemies with bullet(both disappear after contact)
    //Also adds score if enemy destroyed and another enemy to replace it
    for (int i = 0; i < poneshot.size(); i++) {
      PoneBullet pone = poneshot.get(i);
      pone.draw();
      pone.shoot();
      if (pone.bx>width) {
        poneshot.remove(i);
      }
      for (int j = 0; j <happy.size();j++) {
        Happy h = happy.get(j);
        if (pone.hitCheck1(h)) {
          happy.remove(j);
          poneshot.remove(i);
          scoreone++;
          happy.add(new Happy());
        }
      }
      for (int w = 0; w <nappy.size();w++) {
        Nappy n = nappy.get(w);
        if (pone.hitCheck2(n)) {
          nappy.remove(w);
          poneshot.remove(i);
          scoreone++;
          nappy.add(new Nappy());
        }
      }
      for (int q = 0; q <sappy.size();q++) {
        Sappy s = sappy.get(q);
        if (pone.hitCheck3(s)) {
          sappy.remove(q);
          poneshot.remove(i);
          scoreone++;
          sappy.add(new Sappy());
        }
      }
      for (int b = 0; b <albert.size();b++) {
        Albert a = albert.get(b);
        if (pone.hitCheck4(a)) {
          albert.remove(b);
          poneshot.remove(i);
          scoreone++;
          albert.add(new Albert());
        }
      }
    }
    for (int i = 0; i <ptwoshot.size(); i++) {
      PtwoBullet ptwo = ptwoshot.get(i);
      ptwo.draw();
      ptwo.shoot();
      if (ptwo.bx>width) {
        ptwoshot.remove(i);
      }
      for (int j = 0; j <happy.size();j++) {
        Happy h = happy.get(j);
        if (ptwo.hitCheck1(h)) {
          happy.remove(j);
          ptwoshot.remove(i);
          scoretwo++;
          happy.add(new Happy());
        }
      }
      for (int w = 0; w <nappy.size();w++) {
        Nappy n = nappy.get(w);
        if (ptwo.hitCheck2(n)) {
          nappy.remove(w);
          ptwoshot.remove(i);
          scoretwo++;
          nappy.add(new Nappy());
        }
      }
      for (int q = 0; q <sappy.size();q++) {
        Sappy s = sappy.get(q);
        if (ptwo.hitCheck3(s)) {
          sappy.remove(q);
          ptwoshot.remove(i);
          scoretwo++;
          sappy.add(new Sappy());
        }
      }
      for (int b = 0; b <albert.size();b++) {
        Albert a = albert.get(b);
        if (ptwo.hitCheck4(a)) {
          albert.remove(b);
          ptwoshot.remove(i);
          scoretwo++;
          albert.add(new Albert());
        }
      }
    }
    //Checks to see if player is hit by enemy
    //If so, health decreases
    for (int i =0;i < happy.size();i++) {
      Happy h = happy.get(i);
      h.draw();
      h.run();
      if (pone.Hurt1(h)) {
        pone.hit=true;
      }
      if (ptwo.Hurt1(h)) {
        ptwo.hit=true;
      }
    }
    for (int i =0;i < nappy.size();i++) {
      Nappy n = nappy.get(i);
      n.draw();
      n.run();
      if (pone.Hurt2(n)) {
        pone.hit=true;
      }
      if (ptwo.Hurt2(n)) {
        ptwo.hit=true;
      }
    }
    for (int i =0;i < sappy.size();i++) {
      Sappy s = sappy.get(i);
      s.draw();
      s.run();
      if (pone.Hurt3(s)) {
        pone.hit=true;
      }
      if (ptwo.Hurt3(s)) {
        ptwo.hit=true;
      }
    }
    for (int i =0;i < albert.size();i++) {
      Albert a = albert.get(i);
      a.draw();
      a.run();
      if (pone.Hurt4(a)) {
        pone.hit=true;
      }
      if (ptwo.Hurt4(a)) {
        ptwo.hit=true;
      }
    }
  }
  if (pone.hit) {
    pone.life--;
    pone.hit=false;
  }
  if (ptwo.hit) {
    ptwo.life--;
    ptwo.hit=false;
  }

  // If 100 enemies are destroyed, then the game is won
  if (scoreone+scoretwo==100) {
    gamewin=true;
    gameover=false;
    start=false;
    gamestart=false;
    // If player health is 0, they disappear   
    // If both health is 0, game is lost
    if (pone.life==0) {
      pone.x=-100000000;
      pone.y=-100000000;
    }

    if (ptwo.life==0) {
      ptwo.x=-100000000;
      ptwo.y=-100000000;
    }
    if (pone.life==0&&ptwo.life==0) {
      gameover=true;
      gamestart=false;
      gamewin=false;
      start=false;
    }
  }
  // Game win conditions and screen
  if (gamewin) {
    intromusic.loop(900000);
    lostmusic.loop(9000000);
    gamemusic.loop(900000);
    winmusic.play();
    image(win, 0, 0);
    //If press enter, game restarts from intro
    //All values such as health, positions, etc. are reset
    if (BlackBox.isKeyDown(BlackBox.VK_ENTER)) {
      start=true;
      gameover=false;
      gamestart=false;
      gamewin=false;
      pone.x=20;
      pone.y=250;
      ptwo.x=20;
      ptwo.y=500;
      pone.life=100;
      ptwo.life=100;
      screen=0;
      scoreone=0;
      scoretwo=0;
      for (int i =0;i < happy.size();i++) {
        Happy h = happy.get(i);
        h.x=random(1400, 2000);
        for (int j =0;j < nappy.size();j++) {
          Nappy n = nappy.get(j);
          n.x=random(1400, 2000);
          for (int q =0;q < sappy.size();q++) {
            Sappy s = sappy.get(q);
            s.x=random(1400, 2000);
            for (int w =0;w < albert.size();w++) {
              Albert a = albert.get(w);
              a.x=random(1400, 2000);
            }
          }
        }
      }
    }
  }
  //Game lose conditions and screen
  if (gameover) {
    winmusic.loop(900000);
    intromusic.loop(9000000);
    gamemusic.loop(900000);
    lostmusic.play();
    image(lose, 0, 0);
    //If press enter, game restarts from game start
    //All values such as health, positions, etc. are reset
    if (BlackBox.isKeyDown(BlackBox.VK_ENTER)) {
      gamestart=true;
      gameover=false;
      start=false;
      gamewin=false;
      pone.x=20;
      pone.y=250;
      ptwo.x=20;
      ptwo.y=500;
      pone.life=100;
      ptwo.life=100;
      scoreone=0;
      scoretwo=0;
      for (int i =0;i < happy.size();i++) {
        Happy h = happy.get(i);
        h.x=random(1400, 2000);
        for (int j =0;j < nappy.size();j++) {
          Nappy n = nappy.get(j);
          n.x=random(1400, 2000);
          for (int q =0;q < sappy.size();q++) {
            Sappy s = sappy.get(q);
            s.x=random(1400, 2000);
            for (int w =0;w < albert.size();w++) {
              Albert a = albert.get(w);
              a.x=random(1400, 2000);
            }
          }
        }
      }
    }
  }
}
//Conditions for intro, where if one clicks, it continues to next screen
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

