# case a: will be given distances + bearings at known intervals in time
#     will receive:
#         1. distance travelled
#         2. bearing at which the distance has been travelled
#         3. 2 boolean values, corresponding to whether the wall is on the left or right side
#         note: this is received at known samples in time
#     need:
#         1. sampling time (not really needed, just continuously listen)
#         2. how to listen
#         3. how much 1cm corresponds to on the grid
#         4. dimensions of grid
#     todo:
#         1. figure out which cell you're at by using the latest localisation received and the distance + bearing travelled
#         2. update the walls of the cell according to booleans received

# case b: localisation done
#     will receive:
#         1. current rover position
#         2. current rover bearing
#     todo:
#         1. update rover position and bearing
#         2. path travelled from "case a" might be zig zag so re-orient this path according to the coordinates received
#            - basically, apply a smoothing algorithm (???? idk how lol)

# case c: command rover how much to move
#     will receive
#         1. request for command
#     todo:
#         1. check visited cells
#         2. decide on which area the rover should move to next to maze out the psuedo walls
#         3. send to the rover the distance and bearing that it should travel

import math

# global variables:
grid_dimensions = None
grid_resolution = 1
sampling_time = None

# rover state:
class Rover:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.grid_x = 0
        self.grid_y = 0
        self.bearing = 0

grid_dimensions = []

class Maze:
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
maze = Maze()

# helper functions

def getNeighbours(maze, x, y):
    maze = maze.grid
    neighbours = [None, None, None, None]
    i = 0
    for dx, dy in [(-1, 0), (0, 1), (1, 0), (0, -1)]:
        nx, ny = x + dx, y + dy
        if (nx >= 0 and nx < grid_dimensions[0]) and (ny >= 0 and ny < grid_dimensions[1]):
            neighbours[i] = [[nx, ny], maze[nx][ny]]
        i += 1

def nextTarget(maze, x, y, targetList):
    cell = maze.grid[x][y]
    targetFound = False
    targetList = []
    neighbours = getNeighbours(maze, x, y)
    nextNeighbours = []
    for i in range(4):
        if neighbours[i] and not (cell[i+1] or neighbours[i][1][0]):
            nx, ny = neighbours[0][0], neighbours[0][1]
            nextNeighbours = getNeighbours(maze, nx, ny)
            # this following for loop makes sure that the target cell has neighbour that has been visited
            # i.e. it is moving along hte pseudo walls
            for i in range(4):
                if nextNeighbours[i] and nextNeighbours[1][0]:
                    targetFound = True
                    targetList.append(neighbours[i][0])
                    # we need the following break so that we take the first target that comes up
                    # this is to ensure we always take the first neighbour in the following order:
                    # top -> right -> bottom -> left
                    break
            if targetFound:
                break

    if targetFound:
        return targetList
    
    oldNeighbours = neighbours
    for i in range(len(oldNeighbours)):
        targetList.append(oldNeighbours[i][0])
        # while not targetFound:
        x, y = oldNeighbours[i][0][0], oldNeighbours[i][0][1]
        targetFound, targetList = nextTarget(maze, x, y, targetList)
        if targetFound:
            break
        else:
            targetList.pop()

    return targetList

def mazeExplored(grid):
    for r in range(grid_dimensions):
        for c in range(grid_dimensions):
            if not grid[r][c][0]:
                return False
    
    return True

# TO-DO
def sendCommand(distance, bearing):
    None

# TO-DO: check that this mazes to relevant (x, y) coordinates
def updatePosition(distance, bearing):
    # update the rover's position based on the distance and bearing
    rover.x += distance * math.cos(bearing)
    rover.y += distance * math.sin(bearing)

    # convert to grid coordinates
    # not sure if this is needed
    rover.grid_x = int(rover.x / grid_resolution)
    rover.grid_y = int(rover.y / grid_resolution)

def appxBearing(bearing):
    # i want to approximate each bearing i get into one of the following sets:
    # [0], [0, 90], [90], [90, 180], [180], [180, 270], [270], [270, 0], [0]
    # this means i want to divide the 360 bearing into 8 sectors, each being 45 degrees
    # at each of the 45 degree increment, i want to have a 45 degree range for it with that number at the center
    # for example, at 45 degrees, any bearing number within the range 22.5-67.5 will fall into that

    sectors = {22.5: [0], 67.5: [0, 90], 112.5: [90], 157.5: [90, 180], 
               202.5: [180], 247.5: [180, 270], 292.5: [270], 337.5: [270, 0], 
               382.5: [0]}
    
    for sector in list(sectors.keys()):
        if bearing < sector:
            return sectors[sector]
        
    return 0

# case a
def caseA(data):
    # TO-DO: breakdown the json packet
    distance, bearing, left_wall, right_wall = data
    x0, y0 = rover.grid_x, rover.grid_y
    updatePosition(distance, bearing)
    x, y = rover.grid_x, rover.grid_y
    
    bearings = appxBearing(bearing)
    # update the walls of the current cell
    maze.grid[x][y] = True  # mark cell as visited

    for bearing in bearings:
        if bearing == 0:
            if left_wall:
                maze.grid[x][y][4] = True  # mark left border as wall
                ny = y-1 # mark left neighbour's right border as wall
                if ny >= 0 and ny < grid_dimensions[1]:
                    maze.grid[x][ny][2] = True
            if right_wall:
                maze.grid[x][y][2] = True  # mark right border as wall
                ny = y+1 # mark right neighbour's left border as true
                if ny >= 0 and ny < grid_dimensions[1]:
                    maze.grid[x][ny][4] = True
        elif bearing == 90:
            if left_wall:
                maze.grid[x][y][1] = True  # mark top border as wall
                nx = x-1 # mark top neighbour's bottom border as wall
                if nx >= 0 and nx < grid_dimensions[0]:
                    maze.grid[nx][y][3] = True
            if right_wall:
                maze.grid[x][y][3] = True  # mark bottom border as wall
                nx = x+1 # mark bottom neighbour's top border as wall
                if nx >= 0 and nx < grid_dimensions[0]:
                    maze.grid[nx][y][1] = True
        elif bearing == 180:
            if left_wall:
                maze.grid[x][y][2] = True  # mark right border as wall
                ny = y+1 # mark right neighbour's left border as true
                if ny >= 0 and ny < grid_dimensions[1]:
                    maze.grid[x][ny][4] = True 
            if right_wall:
                maze.grid[x][y][4] = True  # mark left border as wall
                ny = y-1 # mark left neighbour's right border as wall
                if ny >= 0 and ny < grid_dimensions[1]:
                    maze.grid[x][ny][2] = True
        elif bearing == 270:
            if left_wall:
                maze.grid[x][y][3] = True  # mark right border as wall
                nx = x+1 # mark right neighbour's left border as wall
                if nx >= 0 and nx < grid_dimensions[0]:
                    maze.grid[nx][y][1] = True
            if right_wall:
                maze.grid[x][y][1] = True  # mark left border as wall
                nx = x-1 # mark left neighbour's right border as wall
                if nx >= 0 and nx < grid_dimensions[0]:
                    maze.grid[nx][y][3] = True

    # if rover.grid[x][y][1]:
    #     rover.grid[x-1][y][3] = True
    # if rover.grid[x][y][2]:
    #     rover.grid[x][y+1][4] = True
    # if rover.grid[x][y][3]:
    #     rover.grid[x+1][y][1] = True
    # if rover.grid[x][y][4]:
    #     rover.grid[x][y-1][2] = True

# case b: localisation done
def caseB(position, bearing):
    # update rover's position and bearing based on received data
    rover.x, rover.y = position
    rover.bearing = bearing

# case c: command rover how much and where to move
def caseC():
    targetList = nextTarget(maze) 

    pathCells = len(targetList)
    if pathCells == 0:
        sendCommand("No reachable unvisited cell found", False)
    for cell in targetList:
        dx = cell[0] - rover.x
        dy = cell[1] - rover.y
        distance = math.sqrt(dx**2 + dy**2)
        bearing = math.atan2(dy, dx)
        sendCommand(distance, bearing)
        rover.x, rover.y = cell[0], cell[1]
    # Calculate the bearing and distance to the next target.
    # dx = next_x - rover.x
    # dy = next_y - rover.y
    # distance = math.sqrt(dx**2 + dy**2)
    # bearing = math.atan2(dy, dx)

    # relay drive command to the server/rover
    # sendCommand(distance, bearing)

# main loop:
def start():
    maze.createGrid()
    while not maze.explored():
        data = ...  # TO-DO: add function to listen to server
        
        # for now will assume it's a json packet with a type field
        if data['type'] == 'move':
            caseA(data)
        elif data['type'] == 'localisation':
            caseB(data['position'], data['bearing'])
        elif data['type'] == 'command_request':
            caseC()

start()