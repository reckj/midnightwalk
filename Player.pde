class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  final float speedLimit = 10;
  float damping = 0.98;
  PVector acceleration = new PVector (0, 0);
  PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width / 2, 3 * height / 4);

  void resetPlayer() {
    acceleration.x = 0;
    acceleration.y = 0;
    velocity.x = 0;
    velocity.y = 0;
    pos.x = width / 2;
    pos.y = 3 * height / 4;
  }

  void update() {
    if (pos.x < width / 5 + tile.tileSize / 2 || pos.x > 4 * width / 5 - tile.tileSize / 2){
      activeState = "GameOver";
      resetPlayer();
    }
    else {
      if (acceleration.x == 0) {
        velocity.mult(damping);
      }
      velocity.add(acceleration);
      pos.add(velocity);
      if (velocity.x > speedLimit) {
        velocity.x = speedLimit;
      }
      else if (velocity.x < -speedLimit) {
        velocity.x = -speedLimit;
      }
    }
  }
  
  void display() {
    //noFill();
    //stroke(255);
    rectMode(CORNER);
    //rect(pos.x - size/2, pos.y - size/2, size, size);
    noStroke();
    fill(set2);
    circle(pos.x,pos.y,size);
  }
  
  void checkCollisionWithObstacle(Obstacle obstacle){
    if (checkRectangle(pos.x - size/2, pos.y - size/2, size, size, obstacle.pos.x, obstacle.pos.y, obstacle.obstacleWidth, obstacle.obstacleHeight)){
      activeState = "GameOver";
    }
  }

}
