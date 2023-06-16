module.exports = app => {
    const live_database = require("../controllers/live_database.controllers.js");
  
    var router = require("express").Router();
  
    // Retrieve a single tile info with id
    // There could be some difference between the raw data stream from the ESP32 and
    // after we process - so we keep this route.
    router.get("/latest", live_database.findOne);
    
    // route for testing
    router.post("/add", live_database.create);

    app.use('/api/live_database', router);
  };    