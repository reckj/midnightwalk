class Obstacle {
  // visual attributes
  float size = 100;

  PVector velocity = new PVector(-3, 0);
  PVector pos = new PVector(0, 0);
 
  void update() {
    pos.add(velocity);

    // add wall again if it is out of screen
    if ((pos.x + size) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    pos.set(random(width/7, width/3), 0);
  }

  void display() {
    noStroke();
    fill(set1);
    rect(pos.x, pos.y, size, size);
  }
}
