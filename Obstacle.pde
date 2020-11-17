class Obstacle {
  // visual attributes
  float size = 100;

  PVector velocity = new PVector(0, 3);
  PVector pos = new PVector(0, 0);
 
  void update() {
    pos.add(velocity);

    // add wall again if it is out of screen
    if ((pos.y) > height)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    pos.set(random(width/5, 4*width/5), 0);
  }

  void display() {
    noStroke();
    fill(set1);
    rect(pos.x, pos.y, size, size);
  }
}
