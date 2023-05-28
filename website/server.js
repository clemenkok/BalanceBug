const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const axios = require('axios');

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// call sync()
const db = require("./models");
db.sequelize.sync();

// simple route
app.get("/", (req, res) => {
  res.json({ message: "test." });
});

// all_info routes
require("./routes/all_info.routes.js")(app);

// map_info routes
require("./routes/map_info.routes.js")(app);

// live_database routes
require("./routes/live_database.routes.js")(app);

// test route for map updating 2D Array
require("./routes/map.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

global.globalMap = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];
