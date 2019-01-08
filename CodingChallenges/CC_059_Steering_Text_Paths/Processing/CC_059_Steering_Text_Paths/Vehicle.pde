// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: https://www.youtube.com/watch?v=4hA7G3gup-4
// Processing transcription: Chuck England

class Vehicle {
  PVector pos;
  PVector target;
  PVector vel;
  PVector acc;
  float r = 8;
  float maxspeed = 10;
  float maxforce = 1;

  Vehicle(float x, float y) {
    pos = new PVector(random(width), random(height));
    target = new PVector(x, y);
    vel = PVector.random2D();
    acc = new PVector();
  }

  void behaviors() {
    PVector arrive = arrive(target);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector flee = flee(mouse);

    arrive.mult(1);
    flee.mult(5);

    applyForce(arrive);
    applyForce(flee);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void update() {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  void show() {
    stroke(255);
    strokeWeight(r);
    point(pos.x, pos.y);
  }

  PVector arrive(PVector target_) {
    PVector desired = PVector.sub(target_, pos);
    float d = desired.mag();
    float speed = maxspeed;
    if (d < 100) {
      speed = map(d, 0, 100, 0, maxspeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  PVector flee(PVector target) {
    PVector desired = PVector.sub(target, pos);
    float d = desired.mag();
    if (d < 50) {
      desired.setMag(maxspeed);
      desired.mult(-1);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
};
