class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  final float speedLimit = 5;
  PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width / 5, height / 2);

  void reset() {
    velocity = new PVector(0, 0);
    pos = new PVector(width / 5, height / 2);
  }

  void update() {
    pos.add(velocity);

    if (pos.y >= height) {
      activeState = "Menu";
    }
  }

}