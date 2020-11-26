boolean stroke = true;

void setup() {
  size(1920,1080);
  colorMode(RGB, 100);
  background(0);
  generateRandom();
  save("Wallpaper.png");

  //exit();
}

void generateRandom() {
  if(random(1) > 0.5) {
    stroke = true;
    stroke(random(100));
    strokeWeight(random(1, 3));
  }
  else {
    stroke = false;
    strokeWeight(2);
  }
  float size = random(40, 200);
  grid(-size*2, -size*2, randTriGrid(int(width/size+size*2),int(height/size+size*2),size), color(random(70), random(70), random(70)), color(random(70), random(70), random(70)));
  textAlign(RIGHT);
  textSize(24);
  fill(100);
}

void grid(float offX, float offY, PVector[][] grid, color c1, color c2) {
  boolean odd = true;
  for(int i = 1; i < grid[0].length; i++) {
    odd = odd ? false : true;
    for(int j = 1; j < grid.length; j++) {
      fill(colorLerp(c1, c2, noise(i/5f,j/5f)));
      if(!stroke) {
        stroke(colorLerp(c1, c2, noise(i/5f,j/5f)));
      }
      if(!odd) {
        triangle(grid[j][i].x+offX, grid[j][i].y+offY, grid[j-1][i].x+offX, grid[j-1][i].y+offY, grid[j][i-1].x+offX, grid[j][i-1].y+offY);
        triangle(grid[j-1][i].x+offX, grid[j-1][i].y+offY, grid[j][i-1].x+offX, grid[j][i-1].y+offY, grid[j-1][i-1].x+offX, grid[j-1][i-1].y+offY);
      }
      else {
        triangle(grid[j][i].x+offX, grid[j][i].y+offY, grid[j][i-1].x+offX, grid[j][i-1].y+offY, grid[j-1][i-1].x+offX, grid[j-1][i-1].y+offY);
        triangle(grid[j][i].x+offX, grid[j][i].y+offY, grid[j-1][i].x+offX, grid[j-1][i].y+offY, grid[j-1][i-1].x+offX, grid[j-1][i-1].y+offY);
      }
    }
  }
}

color colorLerp(color c1, color c2, float x) {
  float minHue = min(hue(c1),hue(c2));
  float maxHue = max(hue(c1),hue(c2));
  float minBright = min(brightness(c1),brightness(c2));
  float maxBright = max(brightness(c1),brightness(c2));
  float minSat = min(saturation(c1),saturation(c2));
  float maxSat = max(saturation(c1),saturation(c2));
  return color(lerp(minHue,maxHue,x), lerp(minSat,maxSat,x), lerp(minBright,maxBright,x));
}

PVector[][] randTriGrid(int w, int h, float scale) {
  PVector[][] ret = new PVector[w][h];
  boolean odd = true;
  for(int i = 0; i < h; i++) {
    odd = odd ? false : true;
    for(int j = 0; j < w; j++) {
      if(!odd) {
        ret[j][i] = new PVector(j*scale+random(0.866*scale), i*scale*0.866+random(0.866*scale));
      }
      else {
        ret[j][i] = new PVector(j*scale+(scale/2)+random(0.866*scale), i*scale*0.866+random(0.866*scale));
      }
    }
  }
  return ret;
}
