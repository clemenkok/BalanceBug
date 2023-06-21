// MQTT Broker to handle incoming data stream from the ESP32, process with algorithms in the cloud and coordinate responses with the Pi

// We generate the global map immedaitely upon server start
const generate_initial_map = require('./services/initial_map_generation');

global.globalMap = [];

generate_initial_map(global.globalMap);

// We import our publish and subscribe functions and call them (this is the application entry point)
const subscribers = require('./subscribers/MQTT_subscribers.js');

subscribers.subscribe(); // we immediately connect to the MQTT broker and start subscribing to all topics

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

// HTTP Server to enable React to request-response data from database

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

const corsOptions = {
  origin: 'http://localhost:3000',
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// call sync() on database
const db = require('./models');
db.sequelize.sync();


//my socket shits ********************************************************************************************************************
const http = require("http").Server(app);
const io = require("socket.io")(http);


//so  i can use js



// the 3rd element is whether rover is following wall: "right" "left" "none"



app.use(express.static(__dirname + '/html/newmapping'));
app.get('/newmapping', (req, res) => {
  res.sendFile(__dirname + '/html/newmapping/index.html');
});


var fs = require("fs");
const { runInContext } = require("vm");

var file = "./html/newmapping/mapdata/data21jun1819.txt";
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
var fakefile = "./html/newmapping/mapdata/fakedata1.txt";
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


//my socket shits ********************************************************************************************************************










// simple route to check if the server works
app.get('/', (req, res) => {
  res.json({ message: 'test.' });
});






// all_info routes (an API route to manipulate data inside the all_info table -> triggered when the user saves the map)
require('./routes/all_info.routes.js')(app);
require('./routes/map_info.routes.js')(app);
require('./routes/live_database.routes.js')(app);
require('./routes/rover_control.routes.js')(app);

module.exports = app;

// // set port, listen for requests
const PORT = process.env.PORT || 8080;


//trying to use socket.io so i use http instead of app
// app.listen(PORT, () => {
//   console.log(`Server is running on port ${PORT}.`);
// });


http.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
