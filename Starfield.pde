class Starfield {
  int starlayer = 1;
  int fieldsize = 50;
  int starsizetolerance = 5;
  
  PVector velocity = new PVector(1, 0);
  PVector pos = new PVector(0, 0);
  
  
  void resetPosition(){
  }
  
  void display(){
    fill(set5);
    for (int i=0; i < fieldsize; i++){
      circle(random(0, width), random(0, height), random(1, starsizetolerance));
    }
  }
}
