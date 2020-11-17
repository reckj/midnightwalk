class Path {
  float pathWidth = 50;
  
  PVector pos = new PVector(width/2, height/2);
  
  void update() {
    pos.add(sinMovement(pathMovementScale, pathVelocity, pathPhase),0);
  }
  
  void display() {
    if(abs(player.pos.x - pos.x) < pathWidth/2){
      fill(set1);
      circle(pos.x, pos.y, pathWidth);
      fill(set4Faded);
      circle(pos.x, pos.y, pathWidth + pathTolerance);
    }
    else{
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
}
