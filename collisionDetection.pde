boolean checkRectangle(
  float r1x, float r1y, float r1w, float r1h, 
  float r2x, float r2y, float r2w, float r2h) {

  return (r1x < r2x + r2w &&
    r1x + r1w > r2x &&
    r1y < r2y + r2h &&
    r1y + r1h > r2y);
}

boolean checkCircle(
  float cxa, float cya, float ra, 
  float cxb, float cyb, float rb) {

  return dist(cxa, cya, cxb, cyb) < ra + rb;
}

boolean checkPath(float playerX, float pathX, float pathTolerance){
  
  return (abs(pathX - playerX) < pathTolerance);
}
