class Rover:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.grid_x = 0
        self.grid_y = 0
        self.bearing = 0

grid_dimensions = []

class Map:
    def __init__(self):
        self.grid = []

    def createGrid(self):
        for _ in range(grid_dimensions[0]):
            row = []
            for _ in range(grid_dimensions[1]):
                row.append([False, False, False, False, False])
            self.grid.append(row)

    def fillGrid(self, x, y):
        if (x < 0 or x >= grid_dimensions[0]) or (y < 0 or y >= grid_dimensions[1]) or self.grid[x][y][0]:
            return
        
        self.grid[x][y][0] = True
        d = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        for i in range(4):
            dx, dy = d[i]
            nx, ny = x + dx, y + dy
            # check the cell exists and that it's accessible from the current cell
            if (nx >= 0 and nx < grid_dimensions[0]) and (ny >= 0 and ny < grid_dimensions[1]) and not self.grid[x][y][i+1]:
                self.fillGrid(self, nx, ny)

    def updateGrid(self):
        for x in range(grid_dimensions[0]):
            for y in range(grid_dimensions[1]):
                if not self.grid[x][y][0]:
                    self.fillGrid(self, x, y)

    def explored(self):
        for row in self.grid:
            for cell in row:
                if not cell[0]:
                    return False
        return True

rover = Rover()
map = Map()