// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

class Player {
  float x;
  float y = height/2;
  float w = 20;
  float h = 100;
  float ychange = 0;

  Player(boolean left) {
    if (left) {
      x = w;
    } else {
      x = width - w;
    }
  }

  void update() {
    y += ychange;
    y = constrain(y, h/2, height-h/2);
  }

  void move(float steps) {
    ychange = steps;
  }

  void show() {
    fill(255);
    rectMode(CENTER);
    stroke(0,130,255);
    strokeWeight(2);
    rect(x, y, w, h);
    
    stroke(255);
    strokeWeight(1);
  }
}
