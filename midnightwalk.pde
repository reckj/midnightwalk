import processing.sound.*;

SoundFile file;

PFont cyRegular;

Player player;
Obstacle obstacle1;
Obstacle obstacle2;
Obstacle obstacle3;
Obstacle obstacle4;
Path path;
Starfield starfield1;
Starfield starfield2;
Score score;
TitleWalker titlewalker;

float time = 0;

color set1 = #F2505D;
color set2 = #7A77D9;
color set3 = #020E26;
color set4 = #0B3640;
color set5 = #F2C744;
color bgColor = set3;
color set4Faded = 0x330B3640;
color set4Fadedless = 0xB30B3640;
color set5Faded = 0x80F2C744;
color set5Fadedless = 0x1AF2C744;

float menuRectSizeX = 500;

String activeState = "Menu";

float playbackGain = 0.5;

int maxStarfieldSize = 300;

boolean pauseWasPressed = false;

float playerAcceleration = 2.0;

float pathTolerance = 150;
float pathMovementScale = 1.5;
float pathVelocity = 0.2;
float pathPhase = radians(90);



void setup() {
  size(1500, 1000, FX2D);
  //fullScreen(FX2D, 2);
  
  file = new SoundFile(this, "soundtrack.wav");
  //file.loop();

  cyRegular = createFont("CyRegular.otf",32);
  textFont(cyRegular);

  player = new Player();
  
  obstacle1 = new Obstacle();
  obstacle1.resetPosition();
  obstacle2 = new Obstacle();
  obstacle2.resetPosition();
  obstacle3 = new Obstacle();
  obstacle3.resetPosition();
  obstacle4 = new Obstacle();
  obstacle4.resetPosition();
  
  path = new Path();
  
  starfield1 = new Starfield();
  starfield1.fieldsize = 150;
  starfield1.generatePattern();
  starfield1.velocity = 0.2;
  starfield2 = new Starfield();
  starfield2.fieldsize = 60;
  starfield2.starSizeToleranceTop = 10;
  starfield2.starSizeToleranceBottom = 5;
  starfield2.generatePattern();
  starfield2.velocity = 0.75;
  
  score = new Score();
  
  titlewalker = new TitleWalker();
}



void draw() {
  if (activeState.equals("Menu")) {
    runMenuState();
  }
  if (activeState.equals("Game")) {
    runGameState();
  }
  if (activeState.equals("Pause")) {
    runPauseState();
  }
  if (activeState.equals("Quit")) {
    runQuitState();
  }
  if (activeState.equals("GameOver")) {
    runGameOverState();
  }
  time++;
}



void keyPressed() {
  // game inputs
  if (activeState.equals("Game")) {
    if (key == CODED){
      if (player.velocity.mag() <= player.speedLimit){
        if (keyCode == LEFT) {
          player.velocity.add(-playerAcceleration,0);
        }
        if (keyCode == RIGHT) {
          player.velocity.add(playerAcceleration,0);
        }
      }
    }
    if (key == 'p' || key == 'P'){
      activeState = "Pause";
      //file.pause();
    }
  }

  if (activeState.equals("Menu")) {
    if (key == 'g' || key == 'G') {
      activeState = "Game";
      file.loop(1,playbackGain);
    }

    if (key == 'q' || key == 'Q') {
      activeState = "Quit";
    }
  }
  if (activeState.equals("Pause")) {
    if ((key == 'p' & pauseWasPressed == true)|| (key == 'P' & pauseWasPressed == true)){
      activeState = "Game";
      pauseWasPressed = false;
      //file.play();
    }
  }
  if (activeState.equals("GameOver")) {
    if (key == 'm' || key == 'M') {
      activeState = "Menu";
    }
  }
}

void keyReleased() {
  if (activeState.equals("Pause")) {
    if (key == 'p' || key == 'P'){
      pauseWasPressed = true;
    }
  }
  if (activeState.equals("Game")){
    if (key == CODED){
        if (keyCode == LEFT || keyCode == RIGHT) {
          player.velocity.set(0,0);
        }
      }
    }
}
