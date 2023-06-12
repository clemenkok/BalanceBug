module.exports = app => {
    const live_database = require("../controllers/live_database.controller.js");
  
    var router = require("express").Router();
  
    // Retrieve a single tile info with id
    router.get("/latest", live_database.findOne);
    
    app.use('/api/live_database', router);
  };    