class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  final float speedLimit = 10;
  PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width / 2, 3 * height / 4);

  void resetPlayer() {
    velocity = new PVector(0, 0);
    pos = new PVector(width / 2, 3 * height / 4);
  }

  void update() {
    if (pos.x < 0 || pos.x > width){
      activeState = "GameOver";
      resetPlayer();
    }
    else {
      pos.add(velocity);
    }
  }
  
  void display() {
    noFill();
    stroke(255);
    rectMode(CORNER);
    rect(pos.x - size/2, pos.y - size/2, size, size);
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
