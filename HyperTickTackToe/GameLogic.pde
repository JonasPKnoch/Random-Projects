class Board {
  int width;
  int height;
  int depth;
  int breadth;
  int[][][][] plays;
  
  Board(int w, int h, int d, int b) {
    width = w;
    height = h;
    depth = d;
    breadth = b;
    plays = new int[w][h][d][b];
  }
  
  void place(int player, int x, int y, int z, int w) {
    plays[x][y][z][w] = player;
  }
  
  boolean checkVector(int check, int x, int y, int z, int w, int xV, int yV, int zV, int wV) {
    if(x >= width || x < 0 || y >= height || y < 0 || z >= depth || z < 0 || w >= breadth || w < 0) {
      return true;
    } else if(plays[x][y][z][w] != check) {
      return false;
    } else {
      return checkVector(check, x+xV, y+yV, z+zV, w+wV, xV, yV, zV, wV);
    }
  }
  
  int checkSpot(int check, int x, int y, int z, int w) {
    int ret = 0;
    for(int i = 0; i <= 1; i++) {
      for(int j = 0; j <= 1; j++) {
        for(int k = 0; k <= 1; k++) {
          for(int l = 0; l <= 1; l++) {
            if(i+j+k+l != 0) {
              if(checkVector(check, x, y, z, w, i, j, k, l) && checkVector(check, x, y, z, w, -i, -j, -k, -l)) {
                ret ++;
              }
            }
          }
        }
      }
    }
    
    return ret;
  }
}
