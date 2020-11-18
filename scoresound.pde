void scoresound() {
  lastSecond = millis();
  int i = int(random(0,10));
  singlenote[i].play(1,playbackGainSingleNotes);
}
