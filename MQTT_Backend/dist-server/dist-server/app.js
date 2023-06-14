"use strict";

// MQTT Broker to handle incoming data stream from the ESP32, process with algorithms in the cloud and coordinate responses with the Pi 

// We generate the global map immedaitely upon server start
var generate_initial_map = require('./services/initial_map_generation');
global.globalMap = [];
generate_initial_map(global.globalMap);

// We import our publish and subscribe functions and call them (this is the application entry point)
var subscribers = require('./subscribers/MQTT_subscribers.js');
var publishers = require('./publishers/MQTT_publishers.js');
subscribers.subscribe(); // we immediately connect to the MQTT broker and start subscribing to all topics
publishers.start_rover(); // a proxy to start the rover (in actuality, it will be done by the rover frontend)

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

// HTTP Server to enable React to request-response data from database 

var express = require("express");
var bodyParser = require("body-parser");
var cors = require("cors");
var app = express();
var corsOptions = {
  origin: "http://localhost:8081"
};
app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({
  extended: true
}));

// call sync() on database
var db = require("./models");
db.sequelize.sync();

// simple route to check if the server works
app.get("/", function (req, res) {
  res.json({
    message: "test."
  });
});

// all_info routes (an API route to manipulate data inside the all_info table -> triggered when the user saves the map)
require("./routes/all_info.routes.js")(app);
require("./routes/map_info.routes.js")(app);
require("./routes/live_database.routes.js")(app);

// set port, listen for requests
var PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
  console.log("Server is running on port ".concat(PORT, "."));
});