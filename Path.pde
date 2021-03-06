class Path {
  float pathWidth = 50;
  
  PVector pos = new PVector(width / 2, 3 * height / 4);
  
  void resetPath(){
    pos.x = width/2;
    pos.y = 3 * height / 4;
    time = 0;
  }
  
  void update() {
    pos.add(sinMovement(pathMovementScale, pathVelocity, pathPhase),0);
  }
  
  void display() {
    if (checkCircle(pos.x, pos.y, pathWidth/2, player.pos.x, player.pos.y, player.size/2)){
      fill(set5Faded);
      circle(pos.x, pos.y, pathWidth);
      fill(set5Fadedless);
      circle(pos.x, pos.y, pathWidth + pathTolerance);
    }
    else {
      noStroke();
      fill(set4Fadedless);
      circle(pos.x, pos.y, pathWidth);
      fill(set4Faded);
      circle(pos.x, pos.y, pathWidth + pathTolerance);
      //rectMode(CORNER);
      //rect(pos.x, pos.y, pathWidth, height);
      //line(pos.x, player.pos.y, player.pos.x, player.pos.y);
    }
  }
}
