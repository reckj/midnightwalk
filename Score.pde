class Score {
  float value = 0;
  float losingFactor = 0.01;
  float winningFactor = 0.08;
  float startScore = 10;
  
  void update(){
    if(value < 0){
      activeState = "GameOver";
    }
    else{
      if(checkCircle(path.pos.x, path.pos.y, path.pathWidth/2, player.pos.x, player.pos.y, player.size/2)){
        value+= winningFactor;
        
        if (millis() - lastSecond >= 500) {
          scoresound();
        }
      }
      else if(checkCircle(path.pos.x, path.pos.y, (path.pathWidth + pathTolerance)/2, player.pos.x, player.pos.y, player.size/2) == false){
        value-= losingFactor;
      }
    }
  }
  
  void resetScore(){
    value = startScore;
  }
  
  void dislay(){
    fill(set5);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Score: "+int(value), 13 * width / 15, height / 12);
  }
}
