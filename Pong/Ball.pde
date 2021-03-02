// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

class Ball {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12;

  Ball() {
    reset();
  }

  void collisionPlayerLeft(Player p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        thread ("hit");
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.x + p.w/2 + r;
      }
    }
  }
  
  void collisionPlayerRight(Player p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        thread ("hit");
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }

  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void edges() {
    if (y < 0 || y > height) {
      thread ("hit");
      yspeed *= -1;
    }

    if (x - r > width) {
      thread ("score");
      leftscore++;
      textAlign(CENTER);
      text("Player 1 scored!", 150, 200);
      reset();
    }

    if (x + r < 0) {
      thread ("score");
      rightscore++;
      textAlign(CENTER);
      text("Player 2 scored!", 450, 200);
      reset();
    }
  }

  void show() {
    fill(255);
    stroke(0,255,150);
    strokeWeight(2);
    ellipse(x, y, r*2, r*2);
    stroke(255);
    strokeWeight(1);
  }
}
