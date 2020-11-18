import processing.sound.*;
import processing.svg.*;

SoundFile file;
SoundFile[] singlenote;
int numNotes = 10;

PFont cyRegular;

PShape lampsvg;
PShape benchLsvg;
PShape benchRsvg;

PImage tilepng;

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
Sceneryobject lampL;
Sceneryobject lampR;
Sceneryobject benchL;
Sceneryobject benchR;
Sceneryobject tile;

float time = 0;

color set1 = #F2505D;
color set2 = #7A77D9;
color set3 = #020E26;
color set4 = #0B3640;
color set5 = #F2C744;
color set6 = #553b6C;
color bgColor = set3;
color set4Faded = 0x330B3640;
color set4Fadedless = 0xB30B3640;
color set5Faded = 0x80F2C744;
color set5Fadedless = 0x1AF2C744;

float menuRectSizeX = 500;

String activeState = "Menu";

String activeLevel = "Level1";

float playbackGain = 0.2;

int maxStarfieldSize = 300;

boolean pauseWasPressed = false;

float playerAcceleration = 0.5;

float pathTolerance = 150;
float pathMovementScale = 1.3;
float pathVelocity = 0.2;
float pathPhase = radians(90);



void setup() {
  size(1500, 1000, FX2D);
  fullScreen(FX2D, 2);
  
  file = new SoundFile(this, "soundtrack.wav");
  singlenote = new SoundFile[numNotes];
  for (int i = 0; i < numNotes; i++) {
    singlenote[i] = new SoundFile(this, "/singlenotes"+i+ ".wav");
  }
  singlenote[1].loop();

  cyRegular = createFont("CyRegular.otf",32);
  textFont(cyRegular);
  
  lampsvg = loadShape("svgobjects/lamp.svg");
  benchLsvg = loadShape("svgobjects/benchL.svg");
  benchRsvg = loadShape("svgobjects/benchR.svg");
  tilepng = loadImage("pngobjects/tile.png");
  lampL = new Sceneryobject();
  lampR = new Sceneryobject();
  benchL = new Sceneryobject();
  benchR = new Sceneryobject();
  tile = new Sceneryobject();
  lampL.type = "lampL";
  lampR.type = "lampR";
  benchL.type = "benchL";
  benchR.type = "benchR";
  tile.type = "tile";
  lampL.reset();
  lampR.reset();
  benchL.reset();
  benchR.reset();
  tile.reset();

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
      //if (player.velocity.mag() <= player.speedLimit){
        if (keyCode == LEFT) {
          player.acceleration.add(-playerAcceleration,0);
        }
        if (keyCode == RIGHT) {
          player.acceleration.add(playerAcceleration,0);
        }
      //}
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
          //player.velocity.set(0,0);
          player.acceleration.set(0,0);
        }
      }
    }
}
