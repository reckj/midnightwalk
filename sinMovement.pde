float sinMovement(float scale, float velocity, float phase){
  float s = 0; //<>//
  //float framescaler = 0.001;
  s = sin(radians(time)*velocity + phase)*scale;
  
  return s;
}
