class Sceneryobject {
  String type = "";
  PVector pos = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  float objectsize_init = 200;
  float objectsize = objectsize_init;
  float tileSize = 50;
  float objectOffset = height / 3;
  float driftSpeed = 2;
  float offsetSpeed = 0.0;
  int numTiles = int(height/tileSize);
  
  void update() {
    pos.add(velocity);
    //objectsize += pos.y / 1000;
    if (pos.y > height) {
      reset();
    }
  }
  

  
  void display() {
    if (type == "lampL" || type == "lampR") {
      lampsvg.disableStyle();
      fill(set6);
      shape(lampsvg,pos.x,pos.y, objectsize, objectsize);
    }
    else if (type == "benchL") {
      benchLsvg.disableStyle();
      fill(set6);
      shape(benchLsvg, pos.x, pos.y, objectsize, objectsize);
    }
    else if (type == "benchR") {
      benchRsvg.disableStyle();
      fill(set6);
      shape(benchRsvg, pos.x, pos.y, objectsize, objectsize);
    }
    else if (type == "tile") {
      for (int i = 0; i <= numTiles; i++) {
        image(tilepng, pos.x, pos.y - i * tileSize, tileSize, tileSize);
        image(tilepng, pos.x, pos.y + i * tileSize, tileSize, tileSize);
        image(tilepng, pos.x + 3 * width / 5 - tileSize, pos.y - i * tileSize, tileSize, tileSize);
        image(tilepng, pos.x + 3 * width / 5 - tileSize, pos.y + i * tileSize, tileSize, tileSize);
      }
    }
  }
  
  void reset () {
    objectsize = objectsize_init;
    if (type == "lampL") {
      pos.y = -objectsize;
      pos.x = 1 * width/20;
      velocity.set(-offsetSpeed,driftSpeed);
    }
    else if (type == "lampR") {
      pos.y = -objectsize;
      pos.x = 19 * width / 20 - objectsize;
      velocity.set(offsetSpeed,driftSpeed);
    }
    else if (type == "benchL") {
      pos.y = -objectsize - objectOffset;
      pos.x = 1 * width / 20;
      velocity.set(-offsetSpeed,driftSpeed);
    }
    else if (type == "benchR") {
      pos.y = -objectsize - objectOffset;
      pos.x = 19 * width / 20 - objectsize;
      velocity.set(offsetSpeed,driftSpeed);
    }
    else if (type == "tile") {
      pos.y = -tileSize;
      pos.x = 2 * width / 10;
      velocity.set(0, driftSpeed);
    }
  }
}
