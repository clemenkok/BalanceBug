var grid_dimensions = [73, 48]; 
var grid_resolution = 5;

// rover class
class Rover {
    constructor() {
        this.x = 0;
        this.y = 0;
        this.grid_x = 0;
        this.grid_y = 0;
        this.bearing = 0;
    }
}

// maze class
class Maze {
    constructor() {
        this.grid = [];
        this.visitedGrid = [];
        this.pseudoVisited = [];
    }

    createGrid() {
        for (let x = 0; x < grid_dimensions[0]; x++) {
            let row = [];
            for (let y = 0; y < grid_dimensions[1]; y++) {
                row.push([false, false, false, false, false]);
            }
            this.grid.push(row);
        }
        // this.visitedGrid = [...this.grid];
    }

    fillGrid(x, y) {
        if (x < 0 || x >= grid_dimensions[0] || y < 0 || y >= grid_dimensions[1] || this.visitedGrid[x][y][0]) {
            return;
        }
        this.visitedGrid[x][y][0] = true;
        let d = [[-1, 0], [0, 1], [1, 0], [0, -1]];
        for (let i = 0; i < 4; i++) {
            let nx = x + d[i][0];
            let ny = y + d[i][1];
            // check the cell exists and that it's accessible from the current cell
            if (nx >= 0 && nx < grid_dimensions[0] && ny >= 0 && ny < grid_dimensions[1] && !this.visitedGrid[x][y][i+1]) {
                this.fillGrid(nx, ny);
            }
        }
    }

    updateGrid() {
        this.visitedGrid = [...this.grid];
        for (let x = 0; x < grid_dimensions[0]; x++) {
            for (let y = 0; y < grid_dimensions[1]; y++) {
                if (!this.visitedGrid[x][y][0]) {
                    this.fillGrid(x, y);
                }
            }
        }
    }

    explored() {
        for (let x = 0; x < grid_dimensions[0]; x++) {
            for (let y = 0; y < grid_dimensions[1]; y++) {
                if (this.visitedGrid[x][y][0] && !(this.grid[x][y][0] === 1 || this.grid[x][y][0] === 2)) {
                    return false;
                }
            }
        }
        return true;
    }
}

function updatePosition(rover, x, y, bearing, leftWall, rightWall) {
    // update the rover's position based on the distance and bearing
    rover.x = x;
    rover.y = y;
    rover.bearing = bearing;

    // convert to grid coordinates
    rover.grid_x = Math.ceil(rover.x / grid_resolution);
    rover.grid_y = Math.ceil(rover.y / grid_resolution);
}

function appxBearing(bearing) {
    // i want to approximate each bearing i get into one of the following sets:
    // [0], [0, 90], [90], [90, 180], [180], [180, 270], [270], [270, 0], [0]
    // this means i want to divide the 360 bearing into 8 sectors, each being 45 degrees
    // at each of the 45 degree increment, i want to have a 45 degree range for it with that number at the center
    // for example, at 45 degrees, any bearing number within the range 22.5-67.5 will fall into that

    var sectors = {
        22.5: [0], 
        67.5: [0, 90], 
        112.5: [90], 
        157.5: [90, 180], 
        202.5: [180], 
        247.5: [180, 270], 
        292.5: [270], 
        337.5: [270, 0],
        382.5: [0]
    };
    
    for (var sector in sectors) {
        if (bearing < sector) {
            return sectors[sector];
        }
    }
        
    return [0];
}

function updateBorder(maze, x, y, border, neighbourBorder, delta) {
    // mark border as wall
    maze.grid[x][y][border] = true

    let limitCheck;
    if ([1, 3].includes(border)) {
        ni = x + delta;
        limitCheck = grid_dimensions[0];
    } else {
        ni = y + delta;
        limitCheck = grid_dimensions[1];
    }

    if (0 <= ni && ni < limitCheck) {
        if ([1, 3].includes(border)) {
            maze.grid[ni][y][neighbourBorder] = true;
        } else {
            maze.grid[x][ni][neighbourBorder] = true;
        }
    }    
}

function caseA(maze, rover, xcoord, ycoord, degree, leftWall, rightWall){
    // TO-DO: check breakdown of json packet
    let x = xcoord;
    let y = ycoord;
    let bearing = degree;
    // console.log("Bearing: "+ bearing)
    let left_wall = leftWall;
    let right_wall = rightWall;
    updatePosition(rover, x, y, bearing, leftWall, rightWall);
    x = rover.grid_x;
    y = rover.grid_y;
    let bearings = appxBearing(bearing);
    wallMapping = {0: [[4, 2, -1], [2, 4, 1]], 90: [[1, 3, -1], [3, 1, 1]], 
                    180: [[2, 4, 1], [4, 2, -1]], 270: [[3, 1, 1], [1, 3, -1]]}
    // console.log("Bearings: "+ bearings)
    // mark cell as visited if it's not part of the border following
    // border following walls to be marked as 1 once it's done
    if (!maze.grid[x][y][0]) {
        maze.grid[x][y][0] = true
        // update the walls of the current cell and its neighbours
        for (let bear of bearings) {
            if (left_wall) {
                let border = wallMapping[bear][0][0];
                let neighbourBorder = wallMapping[bear][0][1];
                // console.log("border: "+ border)
                let delta = wallMapping[bear][0][2];
                updateBorder(maze, x, y, border, neighbourBorder, delta);
            }
            if (right_wall) {
                let border = wallMapping[bear][1][0];
                let neighbourBorder = wallMapping[bear][1][1];
                // console.log("border: "+ border)
                let delta = wallMapping[bear][1][2];
                // console.log("Bearing: "+ bear)
                updateBorder(maze, x, y, border, neighbourBorder, delta);
            }
        }
    }
    tile_num = [x, y]
    tile_info = [0, 0, 0, 0, 0]
    for(let i = 0; i < 5; i++){
        if (maze.grid[x][y][i]){
            tile_info[i] = 1
        } else{
            tile_info[i] = 0
        }
    }
    return [tile_num, tile_info]
}


const mazeMap = new Maze()
const rover = new Rover()

module.exports = { rover, mazeMap, caseA };