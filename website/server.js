const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const axios = require('axios');

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};
app.listen(80, '0.0.0.0');
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

// all_info routes (an API route to save data directly into the all_info table)
require("./routes/all_info.routes.js")(app);

// map_info routes (an API route to save data directly into the map_info table)
require("./routes/map_info.routes.js")(app);

// live_database routes (an API route to save data directly into the live_database table)
require("./routes/live_database.routes.js")(app);

// utils map (an API route to do misc stuff)
require("./routes/utils.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

// should be a 35x35 matrix
global.globalMap = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

