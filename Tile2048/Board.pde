class Board {
  int row_num = 4;
  int col_num = 4;
  int size    = 0;
  Tile[][] grid = new Tile[row_num][col_num];
  
  void setup(){
    addTile(0, 0);
  }
  
  void show() {
    for(int i = 0; i < row_num; i++) {
      for(int j = 0; j < col_num; j++) {
        if(grid[i][j] != null) {
          grid[i][j].show();
        }
      }
    }
  }
  
  void addTile(int row_i, int col_i){
    Tile tile = new Tile(row_i, col_i);
    grid[row_i][col_i] = tile;
    size += 1;
  }
  
  void removeTile(int row_i, int col_i) {
    grid[row_i][col_i] = null;
    size -= 1;
  }
  
  void tiltUp(){
    for (int i=1; i < row_num; i++) {
      for (int j=0; j < col_num; j++) {
        // Check if grid has tile in (i-1, j)
      }
    }
  }
  
  //void tiltHorizontal(int x_dir){
    
  //}
}
