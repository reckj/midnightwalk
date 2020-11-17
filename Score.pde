class Score {
  float value = 0;
  
  void update(){
    if(value < 0){
      activeState = "GameOver";
    }
    else{
      if(checkCircle(path.pos.x, path.pos.y, path.pathWidth/2, player.pos.x, player.pos.y, player.size/2)){
        value+= 0.1;
      }
      else if(checkCircle(path.pos.x, path.pos.y, (path.pathWidth + pathTolerance)/2, player.pos.x, player.pos.y, player.size/2) == false){
        value-= 0.1;
      }
    }
  }
  
  void resetScore(){
    value = 0;
  }
  
  void dislay(){
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Score: "+int(value), 13 * width / 15, height / 12);
  }
}
