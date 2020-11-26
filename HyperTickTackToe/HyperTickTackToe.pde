void setup() {
  textFont(createFont("Source Code Pro", 24));
  background(0);
  //noSmooth();
  size(900, 900);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  
  Board b = new Board(4,4,4,4);

  drawBoard4D(b, width, height, 0, 0);
  drawBoard4D(b, width, height, 0, 0);
}
