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

// simple route to check if the server works
app.get('/', (req, res) => {
  res.json({ message: 'test.' });
});


//my socket shits ********************************************************************************************************************
const http = require('http').Server(app);
const { setupsocket, socketemit } = require('./publishers/socketshit.js');
var io = setupsocket(http);

// the 3rd element is whether rover is following wall: "right" "left" "none"

app.use(express.static(__dirname + '/html/newmapping'));
app.get('/newmapping', (req, res) => {
  res.sendFile(__dirname + '/html/newmapping/index.html');
});
app.get('/socketemittest', (req, res) => {
  socketemit("rover_current_coords", [1,2,"right"]);
  res.send('socket emitted');
});
//my socket shits ********************************************************************************************************************



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
