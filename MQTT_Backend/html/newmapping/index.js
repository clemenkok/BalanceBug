const express = require("express");
const app = require("express")();
const http = require("http").Server(app);
const io = require("socket.io")(http);
const port = process.env.PORT || 3000;
const { text } = require("express");
var fs = require("fs");
const { runInContext } = require("vm");

var file = "data1646.txt";
var data = fs.readFileSync(file, "utf8");
var dataArr = data.toString().split("\n");
//remove last dataarr
dataArr.pop();
//each dataarr is a line of data like 1,1,1,1,1 so we need to split it by commas but only keep first 3
var dataArr2 = [];
for (var i = 0; i < dataArr.length; i++) {
  let temp = dataArr[i].split(",");
  //remove last 2 element of temp
  temp.pop();
  temp.pop();
  //each element of temp convert into number
  for (var j = 0; j < temp.length; j++) {
    temp[j] = Number(temp[j]);
  }
  dataArr2.push(temp);
}
var currentcount1 = 0;

//create an array from range 1 to 12 for testing
var a = [];
for (var i = 1; i <= 12; i++) {
  let temp = [];
  temp.push(i);
  temp.push(i);
  a.push(temp);
}
//console.log(a);
//dataArr2 = a;

var selectevery = 5; //********
var blurredarray = [];
for (var i = 0; i < Math.ceil(dataArr2.length / selectevery); i++) {
  let tempx = 0;
  let tempy = 0;

  if (i + 1 < Math.ceil(dataArr2.length / selectevery)) {
    for (var j = 0; j < selectevery; j++) {
      if (selectevery * i + j < dataArr2.length)
        tempx += dataArr2[selectevery * i + j][0];
    }
    tempx = tempx / selectevery;

    for (var j = 0; j < selectevery; j++) {
      if (selectevery * i + j < dataArr2.length)
        tempy += dataArr2[selectevery * i + j][1];
    }
    tempy = tempy / selectevery;
  }

  if (!(i + 1 < Math.ceil(dataArr2.length / selectevery))) {
    for (var j = 0; j < dataArr2.length - selectevery * i; j++) {
      tempx += dataArr2[selectevery * i + j][0];
    }
    tempx = tempx / (dataArr2.length - selectevery * i);

    for (var j = 0; j < dataArr2.length - selectevery * i; j++) {
      tempy += dataArr2[selectevery * i + j][1];
    }
    tempy = tempy / (dataArr2.length - selectevery * i);
  }

  //console.log(tempx, tempy);

  blurredarray.push([tempx, tempy]);
}
var currentcount2 = 0;
//console.log(blurredarray);

//using my fake data ****
var fakefile = "fakedata1.txt";
var fakedata = fs.readFileSync(fakefile, "utf8");
var _fakedataArr = fakedata.toString().split("\n");
var fakedataArr = [];
for (var i = 0; i < _fakedataArr.length; i++) {
  let temp = _fakedataArr[i].split(",");
  //each element of temp convert into number
  for (var j = 0; j < temp.length; j++) {
    temp[j] = Number(temp[j]);
  }
  fakedataArr.push(temp);
}
var fakecurrentcount = 0;

//console.log(fakedataArr)

//so  i can use js
app.use(express.static(__dirname));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.get("/fuck", (req, res) => {
  res.sendFile(__dirname + "/kmean.html");
});

// the 3rd element is whether rover is following wall: "right" "left" "none"

io.on("connection", (socket) => {
  console.log(`Socket ${socket.id} connected.`);

  socket.on("needball", (msg) => {
    if (currentcount1 < dataArr2.length) {
      let tmp = [
        dataArr2[currentcount1][0],
        dataArr2[currentcount1][1],
        "right",
      ];
      //console.log(tmp)
      io.emit("sendyouball", tmp);
      currentcount1++;
    }
  });

  socket.on("needbigball", (msg) => {
    if (currentcount2 < blurredarray.length) {
      let tmp = [
        blurredarray[currentcount2][0],
        blurredarray[currentcount2][1],
        "right",
      ];
      io.emit("sendyouball", tmp);
      currentcount2++;
    }
  });

  socket.on("resetcount", (msg) => {
    console.log("reset count");
    currentcount1 = currentcount2 = fakecurrentcount = 0;
  });

  socket.on("getfakedata", (msg) => {
    if (fakecurrentcount < fakedataArr.length) {
      let tmp = [
        fakedataArr[fakecurrentcount][0],
        fakedataArr[currfakecurrentcountentcount2][1],
        "left",
      ];
      io.emit("sendyouball", tmp);
      fakecurrentcount++;
    }
  });
});

http.listen(port, () => {
  console.log(`Socket.IO server running at http://localhost:${port}/`);
});



// A Star Algorithm ***************************************************** VErSION 1 (works)

// https://levelup.gitconnected.com/a-star-a-search-for-solving-a-maze-using-python-with-visualization-b0cae1c3ba92
// https://briangrinstead.com/blog/astar-search-algorithm-in-javascript/

// the data needs to be in the following structure to work

clusters = {
  0: [2],
  1: [2],
  2: [0, 1, 3],
  3: [2],
};
clustercoords = [
  [0, 5],
  [-5, 0],
  [0, 0],
  [5, 0],
];

var astar = {
  init: function () {
    grid = {};

    //loop through string "A" to "D"

    for (var i = 0; i < Object.keys(clusters).length; i++) {
      grid[i] = {
        f: 99999999,
        g: 99999999,
        h: 99999999,
        debug: "",
        parent: null,
      };
    }

    return grid;
    //console.log(grid);

    // for(var x = 0; x < grid.length; x++) {
    //   for(var y = ; y < grid[x].length; y++) {
    //     grid[x][y].f = ;
    //     grid[x][y].g = ;
    //     grid[x][y].h = ;
    //     grid[x][y].debug = "";
    //     grid[x][y].parent = null;
    //   }
    // }
  },
  search: function (start, end) {
    //start and end are numbers (0123)

    let grid = astar.init();

    var openList = [];
    var closedList = [];
    openList.push(start);

    while (openList.length > 0) {
      // Grab the lowest f(x) to process next
      var lowInd = 0;
      for (var i = 0; i < openList.length; i++) {
        if (grid[openList[i]].f < grid[openList[lowInd]].f) {
          lowInd = i;
        }
      }

      var currentNode = openList[lowInd];

      // End case -- result has been found, return the traced path
      if (clustercoords[currentNode] == clustercoords[end]) { 
        var curr = currentNode;
        var ret = [];
        //let last = curr;  
        while (grid[curr].parent != null) {//console.log(curr)
          if(ret.includes(curr)) break;
          ret.push(curr);
          // if (grid[curr].parent == last) break;
          // last = curr;
          curr = grid[curr].parent;
        }
        ret = ret.reverse();
        ret.unshift(start);
        return ret;
      }

      // Normal case -- move currentNode from open to closed, process each of its neighbors
      //remove currentNode from openList
      openList = openList.filter(
        (openlistitem) => openlistitem !== currentNode
      );
      // openList.removeGraphNode(currentNode);
      closedList.push(currentNode);
      var neighbors = astar.neighbors(currentNode);

      for (var i = 0; i < neighbors.length; i++) {
        var neighbor = neighbors[i];

        if (closedList.includes(neighbor)){ //|| neighbor.isWall()) { my neighbor cant be a wall
          // not a valid node to process, skip to next neighbor
          continue;
        }

        //distance between this neighbour and currentNode
        var d = astar.heuristic(
          clustercoords[currentNode],
          clustercoords[neighbor]
        );
        // g score is the shortest distance from start to current node, we need to check if
        //   the path we have arrived at this neighbor is the shortest one we have seen yet
        //var gScore = currentNode.g + 1; // 1 is the distance from a node to it's neighbor
        var gScore = grid[currentNode].g + d; // we are using d in our case, nvm i think is wrong
        var gScoreIsBest = false;

        if (!openList.includes(neighbor)) {
          // This the the first time we have arrived at this node, it must be the best
          // Also, we need to take the h (heuristic) score since we haven't done so yet

          gScoreIsBest = true;
          grid[neighbor].h = astar.heuristic(
            clustercoords[neighbor],
            clustercoords[end]
          );
          openList.push(neighbor);
        } else if (gScore < grid[neighbor].g) {
          // We have already seen the node, but last time it had a worse g (distance from start)
          gScoreIsBest = true;
        }

        if (gScoreIsBest ) {//&& !grid[currentNode].parent == neighbor 
          //console.log(currentNode, grid[currentNode].parent, neighbor, grid[currentNode].parent == neighbor )
          // Found an optimal (so far) path to this node.   Store info on how we got here and
          //  just how good it really is...
          if(grid[currentNode].parent != neighbor) grid[neighbor].parent = currentNode;
          //grid[neighbor].parent.push(currentNode)
          grid[neighbor].g = gScore;
          grid[neighbor].f = grid[neighbor].g + grid[neighbor].h;
          grid[neighbor].debug =
            "F: " +
            grid[neighbor].f +
            "<br />G: " +
            grid[neighbor].g +
            "<br />H: " +
            grid[neighbor].h;
        }
      }
    }

    // No result was found -- empty array signifies failure to find path
    return [];
  },
  heuristic: function (pos0, pos1) {
    // This is the Manhattan distance
    // var d1 = Math.abs(pos1.x - pos0.x);
    // var d2 = Math.abs(pos1.y - pos0.y);

    //console.log(pos0);

    // This is the Euclidean distance
    return Math.sqrt(
      Math.pow(pos1[0] - pos0[0], 2) + Math.pow(pos1[1] - pos0[1], 2)
    );
  },
  neighbors: function (node) {
    return clusters[node];
  },
};

astar.init();
// console.log(astar.search(0, 3));
clusters = JSON.parse(
  fs.readFileSync("./astardata/testclusterconnections1.json", "utf8")
);
let _clustercoords = JSON.parse(
  fs.readFileSync("./astardata/centroids.json", "utf8")
);

//loop through anclustercoords
for (var i = 0; i < _clustercoords.length; i++) {
  clustercoords[i] = [_clustercoords[i].x, _clustercoords[i].y];
}

// console.log(astar.search(55, 57 ));


// A Star Algorithm ***************************************************** VErSION 2 (works too)

function calculateDistance(start, end) {
  const [x1, y1] = clustercoords[start];
  const [x2, y2] = clustercoords[end];
  return Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2);
}

function findShortestRoute(startCluster, endCluster) {
  const openSet = [startCluster];
  const closedSet = new Set();
  const gScore = {};
  const fScore = {};
  const cameFrom = {};

  gScore[startCluster] = 0;
  fScore[startCluster] = calculateDistance(startCluster, endCluster);

  while (openSet.length > 0) {
    let current = openSet[0];
    let currentIndex = 0;

    for (let i = 1; i < openSet.length; i++) {
      const fScoreCurrent = fScore[current];
      const fScoreNeighbor = fScore[openSet[i]];

      if (fScoreNeighbor < fScoreCurrent) {
        current = openSet[i];
        currentIndex = i;
      }
    }

    if (current === endCluster) {
      const path = [current];
      let prev = current;
      while (cameFrom[prev] !== undefined) {
        path.unshift(cameFrom[prev]);
        prev = cameFrom[prev];
      }
      return path;
    }

    openSet.splice(currentIndex, 1);
    closedSet.add(current);

    for (const neighbor of clusters[current]) {
      if (closedSet.has(neighbor)) {
        continue;
      }

      const tentativeGScore = gScore[current] + calculateDistance(current, neighbor);

      if (!openSet.includes(neighbor)) {
        openSet.push(neighbor);
      } else if (tentativeGScore >= gScore[neighbor]) {
        continue;
      }

      cameFrom[neighbor] = current;
      gScore[neighbor] = tentativeGScore;
      fScore[neighbor] = tentativeGScore + calculateDistance(neighbor, endCluster);
    }
  }

  return []; // No path found
}

const startCluster = 13;
const endCluster = 80;
const shortestRoute = findShortestRoute(startCluster, endCluster);
// console.log(shortestRoute); // Output: [0, 2]
