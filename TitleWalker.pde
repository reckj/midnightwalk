class TitleWalker {
  PImage[] imageList = new PImage[17];
  PVector pos = new PVector(13 * width / 20, -50);
  
  TitleWalker() {
    for (int i = 0; i < imageList.length; i++) {
      int index = i;
      imageList[i] = loadImage("walker/"+index+".png");
    }
    resetPosition();
  }

  void update() {
    
  }

  void resetPosition() {
    //pos.set(0, height/5);
  }

  void display() {
    int index = frameCount/4 % (imageList.length-1);
    image(imageList[index], pos.x, pos.y, imageList[index].width, imageList[index].height);
  }
}
