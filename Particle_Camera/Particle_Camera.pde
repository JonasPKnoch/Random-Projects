import processing.video.*;

int w_num = 128;
int h_num = 72;
int time = 0;
Capture video;
ArrayList<VideoParticle> partList;


class VideoParticle {
  float x;
  float y;
  float scale;
  
  VideoParticle(float x, float y, float scale) {
    this.x = x;
    this.y = y;
    this.scale = scale;
  }
  
  void moveFall(float speed) {
    y += speed;
  }
  
  void drawScale(float mod) {
    scale = brightness(video.get(round(x), round(y))) * mod;
    
    ellipse(x, y, scale, scale);
  }
  
    void drawColor() {
    fill(video.get(round(x), round(y)));
    
    ellipse(x, y, scale, scale);
  }
}

void setup() {
  size(1280, 720, P2D);
  colorMode(RGB, 1);
  
  video = new Capture(this, width, height);
  video.start(); 
  
  partList = new ArrayList<VideoParticle>();
}

void draw() {
  background(0);
  if (video.available()) {
    time++;
    video.read();
    video.loadPixels();    
    
    if(time == 1) {
      time = 0;
      
      for(int i = 0; i < 10; i++) {
        partList.add(new VideoParticle(random(width), 0, 16));
      }
    }
    
    for (int i = 0; i < partList.size(); i++) {
      VideoParticle part = partList.get(i);
      
      part.moveFall(5);
      part.drawColor();
      
      if(part.x > width || part.x < 0 || part.y > height || part.y < 0) {
        partList.remove(i);
      }
    }
  }
}
