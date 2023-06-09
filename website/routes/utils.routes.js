module.exports = app => {
    const utils = require("../controllers/utils.controller.js");
  
    var router = require("express").Router();
  
    // add your routes here. These are all our endpoint routes, or URLs that we stand up to listen for requests.
    router.post("/light_led", utils.light_led); 

    app.use('/api/utils', router);
  };    