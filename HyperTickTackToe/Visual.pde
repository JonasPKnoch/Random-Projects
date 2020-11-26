final color boardColor = color(255,255,255);
final float axesSizeMacro = 0.05;
final float squareSizeMacro = 0.95;
final float axesSizeInner = 0.1;
final float squareSizeInner = 0.9;
final char[] playerLetters = new char[]{'X','O','Y','Q'};
final color[] playerColors = new color[]{color(255, 0, 0)};

void drawBoard4D(Board board, float boardWidth, float boardHeight, float offX, float offY) {
  float innerBoardX= offX+boardWidth*axesSizeMacro;
  float innerBoardY = offY+boardHeight*axesSizeMacro;
  float tileWidth = (boardWidth*(1-axesSizeMacro))/board.depth;
  float tileHeight = (boardHeight*(1-axesSizeMacro))/board.breadth;
  stroke(boardColor);
  fill(boardColor);
  textSize(tileWidth/3);
  line(offX+boardWidth*(axesSizeMacro/2),offY+boardHeight*(axesSizeMacro/2), offX+boardWidth-tileWidth/2, offY+boardHeight*(axesSizeMacro/2)); 
  text("w", offX+boardWidth-tileWidth/3, offY+boardHeight*(axesSizeMacro/2));
  line(offX+boardWidth*(axesSizeMacro/2),offY+boardHeight*(axesSizeMacro/2), offX+boardWidth*(axesSizeMacro/2), offY+boardHeight-tileHeight/2);
  text("z", offX+boardWidth*(axesSizeMacro/2), offY+boardHeight-tileHeight/3);
  noStroke();
  for(int i = 0; i < board.depth; i++) {
    for(int j = 0; j < board.breadth; j++) {
      drawBoard2D(board, i, j, innerBoardX+tileWidth*i, innerBoardY+tileHeight*j, tileWidth*squareSizeMacro, tileHeight*squareSizeMacro);
    }
  }
  
}

void drawBoard2D(Board board, int locZ, int locW, float offX, float offY, float boardWidth, float boardHeight) {
  float innerBoardX= offX+boardWidth*axesSizeInner;
  float innerBoardY = offY+boardHeight*axesSizeInner;
  float tileWidth = (boardWidth*(1-axesSizeInner))/board.width;
  float tileHeight = (boardHeight*(1-axesSizeInner))/board.height;
  stroke(boardColor);
  textSize(tileWidth/2);
  line(offX+boardWidth*(axesSizeInner/2),offY+boardHeight*(axesSizeInner/2), offX+boardWidth-tileWidth, offY+boardHeight*(axesSizeInner/2)); 
  text("X", offX+boardWidth-tileWidth/2, offY+boardHeight*(axesSizeInner/2)-tileWidth/8);
  line(offX+boardWidth*(axesSizeInner/2),offY+boardHeight*(axesSizeInner/2), offX+boardWidth*(axesSizeInner/2), offY+boardHeight-tileHeight);
  text("Y", offX+boardWidth*(axesSizeInner/2), offY+boardHeight-tileHeight/2);
  
  textSize(tileWidth);
  noStroke();
  for(int i = 0; i < board.width; i++) {
    for(int j = 0; j < board.height; j++) {
      rect(innerBoardX+tileWidth*i, innerBoardY+tileHeight*j, tileWidth*squareSizeInner, tileHeight*squareSizeInner);
      if(board.plays[i][j][locZ][locW] != 0) {
        fill(playerColors[board.plays[i][j][locZ][locW]-1]);
        rect(innerBoardX+tileWidth*i, innerBoardY+tileHeight*j, tileWidth*squareSizeInner, tileHeight*squareSizeInner);
        fill(boardColor);
      }
    }
  }
}
