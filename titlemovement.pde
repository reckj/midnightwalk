float titleMovement(float scale, float velocity, float phase){
  float s = 0;
  //float framescaler = 0.001;
  s = abs(sin(radians(millis())*velocity + phase)*scale);
  
  return s;
}
