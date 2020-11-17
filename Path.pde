class Path {
  float pathWidth = 100;
  
  //PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width/2, height/2);
  
  void update() {
    //velocity.add(sinMovement(), 0);
    pos.add(sinMovement(pathMovementScale, pathVelocity, pathPhase),0);
  }
  
  void display() {
    noStroke();
    fill(set4Fadedless);
    circle(pos.x, pos.y, pathWidth);
    fill(set4Faded);
    circle(pos.x, pos.y, pathWidth + pathTolerance);
    //rectMode(CORNER);
    //rect(pos.x, pos.y, pathWidth, height);
    line(pos.x, player.pos.y, player.pos.x, player.pos.y);
  }
}
