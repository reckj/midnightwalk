class Sceneryobject {
  String type = "lamp";
  PVector pos = new PVector(0,0);
  
  void update() {
  }
  

  
  void display() {
    if (type == "lamp") {
      lampsvg.disableStyle();
      fill(set6);
      shape(lampsvg,pos.x,pos.y);
    }
    else if (type == "bench") {
    
    }
  }
  
  void reset () {
  }
}
