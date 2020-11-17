void runGameState() {
    background(bgColor);
    starfield1.update();
    starfield1.display();
    starfield2.update();
    starfield2.display();
    path.display();
    path.update();
    obstacle1.display();
    obstacle1.update();
    obstacle2.display();
    obstacle2.update();
    score.update();
    score.dislay();
    player.update();
    player.display();
    player.checkCollisionWithObstacle(obstacle1);
    player.checkCollisionWithObstacle(obstacle2);
    stroke(255);
    line(width/2,0,width/2,height);
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
}

void runPauseState() {
  background(set2);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("PRESS P TO UNPAUSE", width / 2, height / 2);
}
