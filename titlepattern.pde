class Titlepattern {
  int patternSize = 50;
  float[] posYL = new float[patternSize];
  float[] posYR = new float[patternSize];
  float[] stroke = new float[patternSize];
  
  void update(){
    if (millis() - animationTime > 1){
      for (int i = 0; i < 50; i++) {
        //posYL[i] = random(0, height);
        //posYR[i] = random(0, height);
        posYL[i] = titleMovement(1000, 0.01, 0 + radians(i));
        println(posYL[i]);
        posYR[i] = titleMovement(1000, 0.01, pathPhase + radians(i*2));
        //stroke[i] = random(5, 15);
       stroke[i] = 5;
      }
      animationTime = millis();
    }
  }
  
  void display() {
    for (int i = 0; i < 50; i++){
      stroke(set4);
      strokeWeight(stroke[i]);
      line(0, posYL[i], width, posYR[i]);
    }
    rectMode(CENTER);
    noStroke();
    fill(set1);
    rect(width / 2, height / 5 + 30, 800, 150);
    rect(width / 2, height / 2 + 5, 550, 65);
    stroke(set3);
    rectMode(CORNER);
    rect( 1180, 80, 155, 225);
  }
}



  //file.stop();
  //background(set1);
  //fill(set3);
  //textAlign(CENTER, CENTER);
  //textSize(120);
  //text("Midnightwalk", width/2, height/5);
  //textSize(32);
  //text("PRESS G FOR GAME, Q FOR QUIT.", width / 2, height / 2);
