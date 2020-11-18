class Obstacle {
  // visual attributes
  float obstacleHeight = 100;
  float obstacleWidth = 200;
  float maxVelocity = 5;
  float minVelocity = 1;
  boolean scoreChanged = false;
  String lastUpdateLevel = "Level1";

  PVector velocity = new PVector(0, 3);
  PVector pos = new PVector(0, 0);
 
  void update() {
    pos.add(velocity);
    
    if (lastUpdateLevel != activeLevel) {
      resetPosition();
    }

    // add wall again if it is out of screen
    if ((pos.y) > height)
    {
      resetPosition();
    }
    
    lastUpdateLevel = activeLevel;
  }

  void resetPosition() {
    pos.set(random(2 * width/10, 8 * width/10), -250);
    velocity.set(0, random(minVelocity, maxVelocity));
    obstacleHeight = random(50, 250);
    obstacleWidth = random(100, 350);
  }

  void display() {
    noStroke();
    fill(set1);
    rect(pos.x, pos.y, obstacleWidth, obstacleHeight);
  }
}
