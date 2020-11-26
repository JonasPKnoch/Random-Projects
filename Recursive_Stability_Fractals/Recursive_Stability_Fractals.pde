class Complex {
  float r;
  float i;
  Complex(float r, float i) {
    this.r = r;
    this.i = i;
  }
}

Complex cAdd(Complex n1, Complex n2) {
  return new Complex(n1.r + n2.r, n1.i + n2.i);
}

Complex cMult(Complex n1, Complex n2) {
  return new Complex(n1.r*n2.r - n1.i*n2.i, n1.r*n2.i + n1.i*n2.r);
}

Complex cSqr(Complex n) {  
  return cMult(n, n);
}

float functionEscape(Complex p, Complex c, int checks) {
  Complex current = new Complex(p.r, p.i);
  int count = 0;
  
  for(int i = 0; i < checks; i++) {
    count ++;
    
    current = cAdd(cSqr(current), c);
    
    float dist = dist(p.r, p.i, current.r, current.i);
    
    if((dist > 2)) {
      return dist*count;
    }
  }
  
  return 0;
}

void drawMandelbrot(float offX, float offY, float scale) {
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      
      float v = functionEscape(new Complex(0, 0), new Complex((i)*scale + (offX), (j)*scale + (offY)), 100);
      
      if(v == 0) {
        pixels[i + j*height] = color(0);
      } else {
        pixels[i + j*height] = color((v+50) % 100, 100, 100);
      }
    }
  }
  updatePixels();
}

float x;
float y;
float zoom;

void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  x = -0;
  y = -0;
  zoom = 0.0035;
}

void keyPressed() {
  if(key == '=') {
    zoom *= 0.8;
  }
  if(key == '-') {
    zoom *= 1.25;
  }
  
  if(keyCode == UP) {
    y -= 40*zoom;
  }
    if(keyCode == DOWN) {
    y += 40*zoom;
  }
  if(keyCode == LEFT) {
    x -= 40*zoom;
  }
  if(keyCode == RIGHT) {
    x += 40*zoom;
  }
}

void draw() {
    translate(width/2, height/2);
    drawMandelbrot(x, y, zoom);
}
