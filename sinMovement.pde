float sinMovement(float scale, float velocity, float phase){
  float s = 0; //<>//
  //float framescaler = 0.001;
  s = sin(radians(frameCount)*velocity + phase)*scale;
  
  return s;
}
