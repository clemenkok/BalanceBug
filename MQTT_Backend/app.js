// MQTT Broker to handle incoming data stream from the ESP32, process with algorithms in the cloud and coordinate responses with the Pi -------------------

// We generate the global map immedaitely upon server start
const initial_map_generation = require('./services/initial_map_generation.js')
let globalMap = [];
initial_map_generation.generate_initial_map(globalMap);

// We import our publish and subscribe functions and call them (this is the application entry point)
const subscribers = require('./subscribers/MQTT_subscribers.js');
const publishers = require('./publishers/MQTT_publishers.js');

subscribers.subscribe(); // we immediately connect to the MQTT broker and start subscribing to all topics
publishers.start_rover(); // a proxy to start the rover (in actuality, it will be done by the rover frontend)


// HTTP Server to enable React to request-response data from database -------------------------------------------------------------------------------------

const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// call sync() on database
const db = require("./models");
db.sequelize.sync();

// simple route to check if the server works
app.get("/", (req, res) => {
  res.json({ message: "test." });
});

// all_info routes (an API route to manipulate data inside the all_info table -> triggered when the user saves the map)
require("./routes/all_info.routes.js")(app);
require("./routes/map_info.routes.js")(app);
require("./routes/live_database.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
