class Sceneryobject {
  String type = "lamp";
  PVector pos = new PVector(width/3,0);
  PVector velocity = new PVector(-0.5,2);
  float objectsize = 100;
  
  void update() {
    pos.add(velocity);
    if (pos.y > height) {
      reset();
    }
  }
  

  
  void display() {
    if (type == "lamp") {
      lampsvg.disableStyle();
      fill(set6);
      shape(lampsvg,pos.x,pos.y, objectsize + time / 2, objectsize + time / 2);
    }
    else if (type == "bench") {
    
    }
  }
  
  void reset () {
    pos.y = 0;
    pos.x = width/3;
  }
}
