class Sceneryobject {
  String type = "";
  PVector pos = new PVector(0,0);
  PVector velocity = new PVector(-0.2,3);
  float objectsize_init = 200;
  float objectsize = objectsize_init;
  
  void update() {
    pos.add(velocity);
    //objectsize += pos.y / 1000;
    if (pos.y > height) {
      reset();
    }
  }
  

  
  void display() {
    if (type == "lampL") {
      lampsvg.disableStyle();
      fill(set6);
      shape(lampsvg,pos.x,pos.y, objectsize, objectsize);
    }
    else if (type == "bench") {
    
    }
  }
  
  void reset () {
    objectsize = objectsize_init;
    if (type == "lampL") {
      pos.y = -lampsvg.height;
      pos.x = 1 * width/10;
    }
    else if (type == "lampR"){
      pos.y = -lampsvg.height;
      pos.x = 9 * width / 10;
    }
  }
}
