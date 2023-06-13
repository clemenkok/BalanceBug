class PriorityQueue {
    constructor() {
        this.elements = [];
    }

    empty() {
        return this.elements.length === 0;
    }

    put(item, priority) {
        this.elements.push({item, priority});
        this.elements.sort((a, b) => a.priority - b.priority);
    }

    get() {
        return this.elements.shift().item;
    }
}

function heuristic(start, end) {
    // manhattan distance on a square grid
    return Math.abs(start[0] - end[0]) + Math.abs(start[1] - end[1]);
}

function aStar(start, goal, mazeMap) {
    let rows = mazeMap.length;
    let cols = mazeMap[0].length;
    let neighbours = {};

    for (let row = 0; row < rows; row++) {
        for (let column = 0; column < cols; column++) {
            let coord = [row, column];
            neighbours[coord] = [];
            if (!mazeMap[row][column][1] && row > 0) {
                neighbours[coord].push([row-1, column]);
            }
            if (!mazeMap[row][column][2] && column < cols-1) {
                neighbours[coord].push([row, column+1]);
            }
            if (!mazeMap[row][column][3] && row < rows-1) {
                neighbours[coord].push([row+1, column]);
            }
            if (!mazeMap[row][column][4] && column > 0) {
                neighbours[coord].push([row, column-1]);
            }
        }
    }

    let frontier = new PriorityQueue();
    frontier.put(start, 0);
    let parentNode = {};
    let cost_so_far = {};
    parentNode[start] = null;
    cost_so_far[start] = 0;

    while (!frontier.empty()) {
        let current = frontier.get();
        if (current.toString() === goal.toString()) {
            break;
        }

        for (let next of neighbours[current]) {
            let new_cost = cost_so_far[current] + 1;
            if (Object.prototype.hasOwnProperty.call(cost_so_far, next) || new_cost < cost_so_far[next]) { // I modified this to fix a linting error.
                cost_so_far[next] = new_cost;
                let priority = new_cost + heuristic(goal, next);
                frontier.put(next, priority);
                parentNode[next] = current;
            }
        }
    }

    let shortest_path = [goal];
    while (parentNode[shortest_path[shortest_path.length - 1]] != null) {
        shortest_path.push(parentNode[shortest_path[shortest_path.length - 1]]);
    }
    shortest_path.reverse();
    let cost = cost_so_far[goal];
    return {shortest_path, cost};
}

module.exports = {
    aStar
};