void runGameState() {
    background(bgColor);
    
    starfield1.update();
    starfield2.update();
    path.update();
    score.update();
    player.update();
    lampL.update();
    lampR.update();
    benchL.update();
    benchR.update();
    tile.update();
    
    starfield1.display();
    starfield2.display();
    
    player.checkCollisionWithObstacle(obstacle1);
    player.checkCollisionWithObstacle(obstacle2);
    player.checkCollisionWithObstacle(obstacle3);
    player.checkCollisionWithObstacle(obstacle4);

    
    //4 different difficulties defined by the score
    if (score.value > 0 & score.value < 50){
      obstacle1.minVelocity = 2;
      obstacle1.maxVelocity = 6;
      
      obstacle1.display();
      
      obstacle1.update();
      
      activeLevel = "Level1";
    }
    else if (score.value >= 50 & score.value < 100){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 3;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 6;
      
      obstacle1.update();
      obstacle2.update();
      
      obstacle1.display();
      obstacle2.display();
      
      activeLevel = "Level2";
    }
    else if (score.value >= 100 & score.value < 200){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 4;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 6;
      
      obstacle1.update();
      obstacle2.update();
      obstacle3.update();
      
      obstacle1.display();
      obstacle2.display();
      obstacle3.display();
      
      activeLevel = "Level3";
    }
    else if(score.value >= 200){
      obstacle1.minVelocity = 1;
      obstacle1.maxVelocity = 4;
      obstacle2.minVelocity = 2;
      obstacle2.maxVelocity = 6;
      
      obstacle1.update();
      obstacle2.update();
      obstacle3.update();
      obstacle4.update();
      
      obstacle1.display();
      obstacle2.display();
      obstacle3.display();
      obstacle4.display();
      
      activeLevel = "Level4";
    }
    
    path.display();
    player.display();
    lampL.display();
    lampR.display();
    benchL.display();
    benchR.display();
    tile.display();
    score.dislay();
    //text(player.velocity.x, 100, 100);
    text(second() - lastSecond,100,100);
    
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
  obstacle3.resetPosition();
  obstacle4.resetPosition();
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
