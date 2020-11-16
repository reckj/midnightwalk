Player player;
Obstacle obstacle1;
Path path;
Starfield starfield1;
Starfield starfield2;

color set1 = #F2505D;
color set2 = #7A77D9;
color set3 = #020E26;
color set4 = #0B3640;
color set5 = #F2C744;
color bgColor = set3;

String activeState = "Game";

float pathTolerance = 50;
float pathMovementScale = 1.5;
float pathVelocity = 0.2;
float pathPhase = radians(90);



void setup() {
  size(1500, 1000, FX2D);
  //fullScreen(FX2D, 2);

  player = new Player();
  
  obstacle1 = new Obstacle();
  obstacle1.resetPosition();
  
  path = new Path();
  
  starfield1 = new Starfield();
  starfield1.fieldsize = 120;
  starfield1.generatePattern();
  starfield1.velocity = 0.2;
  starfield2 = new Starfield();
  starfield2.fieldsize = 40;
  starfield2.starSizeToleranceTop = 10;
  starfield2.starSizeToleranceBottom = 5;
  starfield2.generatePattern();
  starfield2.velocity = 0.75;
}



void draw() {
  if (activeState.equals("Menu")) {

  }
  if (activeState.equals("Game")) {
    background(bgColor);
    starfield1.update();
    starfield1.display();
    starfield2.update();
    starfield2.display();
    obstacle1.display();
    obstacle1.update();
    path.display();
    path.update();
    stroke(255);
    line(width/2,0,width/2,height);
  }
  if (activeState.equals("Pause")) {
    runPauseState();
  }
  if (activeState.equals("Quit")) {
    runQuitState();
  }
}

void runQuitState() {
  exit();
}

void runPauseState() {
  background(set2);
}

void keyPressed() {
  // game inputs
  if (activeState.equals("Game")) {
    if (key == CODED){
      if (keyCode == LEFT || keyCode == RIGHT) {
        obstacle1.resetPosition();
      }
    }
    if (key == 'm' || key == 'M'){
      activeState = "Menu";
    }
    if (key == 'p' || key == 'P'){
      activeState = "Pause";
    }
  }

  if (activeState.equals("Menu")) {
    if (key == 'g' || key == 'G') {
    }

    if (key == 'q' || key == 'Q') {
      activeState = "Quit";
    }
  }
}
