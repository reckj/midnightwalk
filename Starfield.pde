class Starfield {
  int starlayer = 1;
  int fieldsize = 50;
  int starsizetolerance = 5;
  float posRelative = 0;
  float[] posX = new float[fieldsize];
  float[] posY = new float[fieldsize];
  float[] size = new float[fieldsize];
  float velocity = 0.5;
  
  //PVector velocity = new PVector(1, 0);
  //PVector pos = new PVector(0, 0);
  
  Starfield(){
    //for (int i=0; i < fieldsize; i++){
    //  posX[i] = random(0, width);
    //  posY[i] = random(0, height);
    //  size[i] = random(1, starsizetolerance);
    //}
  }
  
  void resetPosition(){
  }
  
  void update(){
    if(posRelative <= height){
      for (int i=0; i < fieldsize; i++){
        posY[i]+= velocity;
      }
      posRelative += velocity;
    }
    else {
      posRelative = 0;
      generatePattern();
    }
  }
  
  void generatePattern(){
    for (int i=0; i < fieldsize; i++){
      posX[i] = random(0, width);
      posY[i] = random(0, height);
      size[i] = random(1, starsizetolerance);
    }    
  }
  
  void display(){
    for (int i=0; i < fieldsize; i++){
      fill(set5);
      noStroke();
      circle(posX[i], posY[i], size[i]);
    }
  }
}
