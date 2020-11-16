class Path {
  float pathWidth = 100;
  
  //PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width/2-pathWidth/2, 0);
  
  void update() {
    //velocity.add(sinMovement(), 0);
    pos.add(sinMovement(pathMovementScale, pathVelocity, pathPhase),0);
  }
  
  void display() {
    noStroke();
    fill(set2);
    rect(pos.x,pos.y,pathWidth, height);
  }
}
