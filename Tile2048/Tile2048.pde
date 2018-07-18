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
  switch(keyCode) {
    case 37: // Left
      //board.tilt(-1, 0);
      break;
    case 38: // Up
      board.tiltUp();
      break;
    case 39: // Right
      //board.tilt(1, 0);
      break;
    case 40: // Down
      //board.tilt(0, -1);
      break;
  }
}
