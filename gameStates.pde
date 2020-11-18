void runGameState() {
    background(bgColor);
    
    starfield1.update();
    starfield2.update();
    path.update();
    score.update();
    player.update();
    
    starfield1.display();
    starfield2.display();
    
    player.checkCollisionWithObstacle(obstacle1);
    player.checkCollisionWithObstacle(obstacle2);

    
    //4 different difficulties defined by the score
    if (score.value > 0 & score.value < 50){
      obstacle1.minVelocity = 2;
      obstacle1.maxVelocity = 5;
      
      obstacle1.display();
      
      obstacle1.update();
    }
    else if (score.value >= 50 & score.value < 100){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 3;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 5;
      
      obstacle1.update();
      obstacle2.update();
      
      obstacle1.display();
      obstacle2.display();
    }
    else if (score.value >= 100 & score.value < 200){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 4;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 5;
      
      obstacle1.update();
      obstacle2.update();
      obstacle3.update();
      
      obstacle1.display();
      obstacle2.display();
      obstacle3.display();
    }
    else if(score.value >= 200){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 4;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 5;
      
      obstacle1.update();
      obstacle2.update();
      obstacle3.update();
      obstacle4.update();
      
      obstacle1.display();
      obstacle2.display();
      obstacle3.display();
      obstacle4.display();
    }
    
    path.display();
    score.dislay();
    player.display();
    lamp.disableStyle();
    fill(set6);
    shape(lamp,500,500);
}

void runQuitState() {
  exit();
}

void runMenuState(){
  file.stop();
  background(set1);
  fill(set3);
  rectMode(CENTER);
  //rect(width/4,height/5,menuRectSizeX,menuRectSizeX);
  textAlign(CENTER, CENTER);
  textSize(120);
  text("Midnightwalk", width/2, height/5);
  textSize(32);
  text("PRESS G FOR GAME, Q FOR QUIT.", width / 2, height / 2);
  player.resetPlayer();
  path.resetPath();
  score.resetScore();
  obstacle1.resetPosition();
  obstacle2.resetPosition();
  titlewalker.update();
  titlewalker.display();
}

void runPauseState() {
  background(set2);
  fill(set3);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("PRESS P TO UNPAUSE", width / 2, height / 2);
}

void runGameOverState(){
  background(set5);
  fill(set3);
  textAlign(CENTER, CENTER);
  textSize(120);
  text("GAME OVER", width/2, height/5);
  textSize(40);
  text("PRESS M FOR MENU", width / 2, height / 2);
}
