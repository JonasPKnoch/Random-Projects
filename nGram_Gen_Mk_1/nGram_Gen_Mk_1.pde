void line(PVector p1, PVector p2) {
  line(p1.x,p1.y,p2.x,p2.y);
}

boolean inArray(int in, int[] arr) {  
  for(int i: arr) {
    if(i == in) {
      return true;
    }
  }
  
  return false;
}

class nGram {
  int points;
  
  nGram(int _points) {
    points = _points;
  }
  
  PVector nPoint(int n) {
    return new PVector(cos((((2*PI)/points)*n)),sin(((2*PI)/points)*n));
  }
  
  void display(int jump, float x, float y, float scale) {
    int[] visited = new int[points];
    int p = jump;
    for(int i = 0; i < points; i++) {
      line(nPoint(p-jump).add(x,y).mult(scale/2),nPoint(p).add(x,y).mult(scale/2));
      visited[i] = p;
      p+= jump;
    }
  }
  
  void display(int jump) {
    int[] visited = new int[points];
    int p = jump;
    for(int i = 0; i < points; i++) {
      line(nPoint(p-jump).mult(min(height-16,width-16)/2).add(width/2,height/2),nPoint(p).mult(min(height-16,width-16)/2).add(width/2,height/2));
      visited[i] = p%points;
      p+= jump;
      if(inArray(p%points,visited) && p%points != 0) {
        p++;
      }
    }
    println(visited);
  }
}

nGram g;

void setup() {
  background(0);
  stroke(255);
  strokeWeight(8);
  noSmooth();
  size(600,600);
  
  g = new nGram(7);
    
  g.display(2);
}
