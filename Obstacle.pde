class Obstacle {
  // visual attributes
  float obstacleHeight = 100;
  float obstacleWidth = 200;

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
    pos.set(random(width/10, 9*width/10), random(-100,0));
    velocity.set(0, random(1, 5));
    obstacleHeight = random(50, 250);
    obstacleWidth = random(100, 350);
  }

  void display() {
    noStroke();
    fill(set1);
    rect(pos.x, pos.y, obstacleWidth, obstacleHeight);
  }
}
