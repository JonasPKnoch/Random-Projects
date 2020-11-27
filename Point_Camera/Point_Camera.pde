import processing.video.*;
int lineLength = 50;
Capture video;

void setup() {
  size(640, 480, P2D);
  video = new Capture(this, width, height);
  video.start(); 
  println(video.list());
  strokeWeight(8);
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();    
    //image(video,0,0);   
    for(int i = 0; i < 500; i++)
    {
      int x = int(random(width));
      int y = int(random(height));
      stroke(video.get(x,y));
      fill(video.get(x,y));
      point(x,y);
    }
    
  }
}
