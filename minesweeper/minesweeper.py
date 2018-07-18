import random

class Grid:
    
    def __init__(self, row_size, col_size, num_bombs):
        self.row_size  = row_size
        self.col_size  = col_size
        self.num_bombs = num_bombs
        self.grid      = [[ 0 for _ in range(col_size)] for _ in range(row_size)]
        self.user_grid = [["-" for _ in range(col_size)] for _ in range(row_size)]
        self.init_grid()
        self.unsolved  = True
        
    def main(self):
        while self.unsolved:
            self.display()
            row = int(input("Row space?  ")) - 1
            col = int(input("Col space?  ")) - 1
            print()
            self.place_mark(row, col)
        
    def init_grid(self):
        bombs = self.num_bombs
        while bombs:
            # This can be better what if unlucky or num_bombs > row*col
            row_loc = random.randint(0, self.row_size-1)
            col_loc = random.randint(0, self.col_size-1)
            if self.grid[row_loc][col_loc] == 0:
                self.grid[row_loc][col_loc] = "bomb"
                self.increment_surrounding(row_loc, col_loc)
                bombs = bombs - 1
                
    def increment_surrounding(self, row_loc, col_loc):
        for i, j in self.all_adj():
            if self.is_inside_grid(row_loc + i, col_loc + j):
                if self.grid[row_loc+i][col_loc+j] != "bomb":
                    self.grid[row_loc+i][col_loc+j] += 1
                        
                        
    def is_inside_grid(self, row, col):
        if row < 0 or col < 0:
            return False
        if row >= self.row_size or col >= self.col_size:
            return False
        return True
    
    def all_adj(self):
        lst = list()
        for i in (-1, 0, 1):
            for j in (-1, 0, 1):
                if not (i == 0 and j == 0):
                    lst.append((i, j))
        return lst
    
    def all_lat(self, row, col):
        lst = list()
        for i in (-1, 0, 1):
            for j in (-1, 0, 1):
                if (i != 0 or j != 0) and (abs(i) != abs(j)):
                    lst.append((row+i, col+j))
        return lst
        
    def search_empties(self, row, col):
        to_search = self.all_lat(row, col)
        seen_before = set()
        while to_search != []:
            curr = to_search.pop(0)
            seen_before.add(curr)
            if self.is_inside_grid(curr[0], curr[1]) and self.grid[curr[0]][curr[1]] == 0:
                self.user_grid[curr[0]][curr[1]] = 0
                next_search = self.all_lat(curr[0], curr[1])
                next_search = [elem for elem in next_search if elem not in seen_before]
                to_search.extend(next_search)
            elif self.is_inside_grid(curr[0], curr[1]):
                self.user_grid[curr[0]][curr[1]] = self.grid[curr[0]][curr[1]]
        
        
    def place_mark(self, row, col):
        if self.grid[row][col] == "bomb":
            raise Exception("Game over")
        elif self.grid[row][col] != 0:
            self.user_grid[row][col] = self.grid[row][col]
        else:
            self.user_grid[row][col] = self.grid[row][col]
            self.search_empties(row, col)
        
    def display(self):
        for i in range(self.row_size):
            for j in range(self.col_size):
                print(self.user_grid[i][j], end=" ")
            print()

if __name__ == "__main__":
    ROW_SIZE  = 10
    COL_SIZE  = 10
    NUM_BOMBS = 12
    g = Grid(ROW_SIZE, COL_SIZE, NUM_BOMBS)
    g.main()