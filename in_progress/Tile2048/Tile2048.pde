Board board;
boolean gameOn;

void setup(){
  size(800, 800);
  board = new Board();
  board.setup();
}

void draw() {
  background(240);
  board.show();
}

void keyPressed() {
  if(board.size == board.row_num * board.col_num) {
    print("Game Over");
  } else {
    board.addRandTile();
    switch(keyCode) {
      case 37: // Left
        board.tilt(1, 0, -1,
                   0, 0, 0);
        break;
      case 38: // Up
        board.tilt(0, 0, 0,
                   1, 0, -1);
        break;
      case 39: // Right
        board.tilt(0, -1, 1,
                   0, 0, 0);
        break;
      case 40: // Down
        board.tilt(0, 0, 0,
                   0,-1, 1);
        break;
    }
  }
}
