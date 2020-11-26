void dither(PImage source) {
  loadPixels();
  for(int i = 0; i < source.width*source.height; i++) {
    float value = brightness(source.pixels[i]);  
    value /= 8;
    value = round(value)*8;
    
    if(value <= 50) {
      if(i % ceil(100/value) == 0) {
        pixels[i] = color(100);
      } else {
        pixels[i] = color(0);
      }
    } else {
      if(i % ceil(100/(100 - value)) == 0) {
        pixels[i] = color(0);
      } else {
        pixels[i] = color(100);
      }
    }
  }
  updatePixels();
  println("done");
}


void hueDraw(PImage source) {
  loadPixels();
  for(int i = 0; i < source.width*source.height; i++) {
    float h = hue(source.pixels[i]);  
    pixels[i] = color(h, 100, 100);
  }
  updatePixels();
  println("done");
}


void setup() {
  colorMode(HSB, 100);
  PImage source = loadImage("Mona_Lisa.jpg");
  size(800, 800);
  dither(source);
}
