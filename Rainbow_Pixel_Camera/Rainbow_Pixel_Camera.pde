import processing.video.*;
Capture video;
int gridSize = 16;
int time = 0;
PImage swordFish;
void setup() 
{
  //swordFish = loadImage("sword fish transparent.png");
  size(640, 480);
  video = new Capture(this, width, height);
  video.start(); 
  strokeWeight(1);
  colorMode(HSB,100);
}

void draw() 
{
  time++;
  if (video.available()) 
  {
    video.read();
    video.loadPixels();  
    //image(video,0,0);
    renderEach();  
  }
}

void renderEach()
{
  background(0,0,0);
  for(int x = 0; x < int(width/gridSize); x++)
  {
      for(int y = 0; y < int(height/gridSize); y++)
      {
        color col = video.get(x*gridSize,y*gridSize);
        float size = (brightness(col)/100);
        fill((x+time)*2%100,100,100);
        stroke((x+time)*2%100,100,100);
        rect(x*gridSize,y*gridSize,gridSize*size,gridSize*size);
        //image(swordFish,x*gridSize,y*gridSize,gridSize*size*3,gridSize*size*3);
      }
  }
}
