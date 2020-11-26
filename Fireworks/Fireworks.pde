class Particle {
  float x;
  float y;
  float vX;
  float vY;
  float drag;
  float gravity;
  
  Particle() {}
  
  Particle(float x, float y, float vX, float vY, float drag, float gravity) {
      this.x = x;
      this.y = y;
      this.vX = vX;
      this.vY = vY;
      this.drag = drag;
      this.gravity = gravity;
    }
    
    void step() {
       vX *= 1 - drag;
       vY *= 1 - drag;
       vY += gravity;
       x += vX;
       y += vY;
     }
}

class Firework extends Particle {
  color c;
  float size;
  float pX;
  float pY;
  
  Firework(float x, float y, float vX, float vY, float drag, float gravity, color c, float size) {
    this.x = x;
    this.y = y;
    this.vX = vX;
    this.vY = vY;
    pX = vX;
    pY = vY;
    this.drag = drag;
    this.gravity = gravity;
    this.c = c;
    this.size = size;
  }
  
  void step() {
    pX = x;
    pY = y;
    vX *= 1 - drag;
    vY *= 1 - drag;
    vY += gravity;
    x += vX;
    y += vY;
    
    stroke(c);
    strokeWeight(size);
    line(pX, pY, x, y);
  }
}

ArrayList<Firework> fireworkList;
int timer;

void setup() {
  size(600, 600);
  
  fireworkList = new ArrayList<Firework>();
  timer = 0;
  
  background(0);
}



void draw() {
  timer++;
  noStroke();
  fill(0, 0, 0, 15);
  rect(0, 0, 600, 600);
  
  if(timer == 60)
    {
      timer = 0;
      fireworkList.add(new Firework(300, 300, random(-15, 15), random(-30, -10), 0, 1, color(random(50, 255), random(50, 255), random(50, 255)), random(8, 16)));
    }


  for(int i = 0; i < fireworkList.size(); i++) {
    Firework current = fireworkList.get(i);
    current.step();
    
    if(current.y > 600) {
      fireworkList.remove(i);     
    }
  }
}
