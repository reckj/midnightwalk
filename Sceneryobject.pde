class Sceneryobject {
  String type = "lamp";
  PVector pos = new PVector(0,0);
  float objectsize = 100;
  
  void update() {
  }
  

  
  void display() {
    if (type == "lamp") {
      lampsvg.disableStyle();
      fill(set6);
      shape(lampsvg,pos.x,pos.y, objectsize, objectsize);
    }
    else if (type == "bench") {
    
    }
  }
  
  void reset () {
  }
}
