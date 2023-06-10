module.exports = app => {
    const utils = require("../controllers/utils.controller.js");
  
    var router = require("express").Router();
  
    // add your routes here. These are all our endpoint routes, or URLs that we stand up to listen for requests.
    router.post("/start_rover", utils.start_rover);
    router.put("/deadreckoning_data", utils.deadreckoning_data);
    router.post("/localise", utils.localise);
    
    app.use('/api/utils', router);
  };    