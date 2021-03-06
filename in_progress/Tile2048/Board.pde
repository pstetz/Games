class Board {
  int row_num = 4;
  int col_num = 4;
  int size    = 0;
  Tile[][] grid = new Tile[row_num][col_num];
  
  void setup(){
    addTile(3, 3);
    addTile(1, 1);
    addTile(2, 2);
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
  
  void addRandTile() {
    int row_i = 0;
    int col_i = 0;
    
    for(int i=0; i < row_num; i++) {
      for(int j=0; j < col_num; j++) {
        if(grid[i][j] == null) {
          row_i = i;
          col_i = j;
        }
      }
    }
    addTile(row_i, col_i);
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
  
  void tilt(int row_start, int row_end, int row_offset,
            int col_start, int col_end, int col_offset){
    for (int i=row_start; i != row_end; i++) {
      for (int j=col_start; j != col_end; j++) {
        if(grid[i][j] != null){
          Tile temp = grid[i][j];
          grid[i][j] = null;
          
          i = i + row_offset;
          j = j + col_offset;
          if(grid[i][j] != null && grid[i][j].value == temp.value) {
            grid[i][j].value *= 2;
          } else {
            grid[i][j] = temp;
            grid[i][j].updatePos(i, j);
            grid[i][j].show();
          }
        }
      }
    }
  }
}
