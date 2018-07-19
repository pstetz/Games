class Tile {
  int value;
  PVector position;
  PVector pixelPos;
  
  Tile(int x, int y){
    if(random(1)<0.1){
      value = 4;
    } else {
      value = 2;
    }
    
    position = new PVector(x, y);
    pixelPos = new PVector(200*x, 200*y);
  }
  
  void show() {
    fill(200, 100, 0);
    rect(pixelPos.x, pixelPos.y, 200, 200);
    fill(255);
    textAlign(CENTER, CENTER);
    text(value, pixelPos.x+100, pixelPos.y+100);
  }
  
  void updatePos(int x, int y) {
    position = new PVector(x, y);
    pixelPos = new PVector(200*x, 200*y);
  }
}
