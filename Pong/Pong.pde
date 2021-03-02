// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

import processing.sound.*;

Ball ball;

SoundFile score;
SoundFile hit;

Player left;
Player right;

int leftscore = 0;
int rightscore = 0;

boolean menu = true;

void setup() {
  size(600, 400);
  hit = new SoundFile(this,"hit.wav");
  score = new SoundFile(this,"score.wav");
  ball = new Ball();
  left = new Player(true);
  right = new Player(false);
}

void draw() {
  if (menu) menu();
  else {
    background(0);
    for(int i=0; i < 800; i+=15) {
      strokeWeight(10);
      stroke(255,255,255);
      line(300,i+5,300,i+5);
    }
    strokeWeight(1);
  
    ball.collisionPlayerRight(right);
    ball.collisionPlayerLeft(left);
  
    left.show();
    right.show();
    left.update();
    right.update();
  
    ball.update();
    ball.edges();
    ball.show();
  
    fill(255);
    textSize(32);
    text(leftscore, 100, 40);
    text(rightscore, width-132, 40);
  }
}

// Initial screen
void menu(){
  background(0);
  textSize(50);
  textAlign(CENTER);
  fill(255);
  text("Pong", 300,100);
  textSize(25);
  textAlign(CENTER);
  text("by Fabián B.", 300, 150);
  textAlign(CENTER);
  text("> Player 1 (left): W - S", 300, 230);
  text("> Player 2 (right): O - L", 300, 260);
  text("To start the game press ENTER",300, 300);
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'w') {
    left.move(-10);
  } else if (key == 's') {
    left.move(10);
  }

  if (key == 'o' || keyCode == UP) {
    right.move(-10);
  } else if (key == 'l' || keyCode == DOWN) {
    right.move(10);
  }
  
  if (keyCode == ENTER) menu = false;
}
  
void hit() {
  hit.play();
}

void score() {
  score.play();
}
