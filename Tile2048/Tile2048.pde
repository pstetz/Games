Tile start;
boolean gameOn;
void setup(){
  size(800, 800);
  start = new Tile(0, 0);
}

void draw() {
  background(240);
  start.show();
}

void keyPressed() {
  switch(keyCode) {
    case 37:
       print("Left\n");
       break;
    case 38:
       print("up\n");
       break;
    case 39:
       print("Right\n");
       break;
    case 40:
       print("Down\n");
       break;
  }
}
