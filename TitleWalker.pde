class TitleWalker {
  PImage[] imageList = new PImage[17];
  PVector velocity = new PVector(-2, 0);
  PVector pos = new PVector(0, 0);
  
  TitleWalker() {
    for (int i = 0; i < imageList.length; i++) {
      int index = i;
      imageList[i] = loadImage("walker/"+index+".png");
    }
    resetPosition();
  }

  void update() {
    pos.add(velocity);
    if (pos.x > width)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    pos.set(-imageList[1].width, height/5);
  }

  void display() {
    noStroke();
    fill(0);
    int index = frameCount/4 % (imageList.length-1);
    image(imageList[index], pos.x, pos.y, imageList[index].width, imageList[index].height);
  }
}
