module.exports = app => {
    const utils = require("../controllers/utils.controller.js");
  
    var router = require("express").Router();
  
    // add your routes here
    // GET requests are intended to retrieve data from a server and do not modify the server's state. 
    // On the other hand, POST requests are used to send data to the server for processing and may 
    // modify the server's state. in that case, POST requests are made by the ESP32 to send something
    // to the server and GET requests are made by the ESP32 to get something from the server, vv.
    // router.post("/", utils.edit);
  
    app.use('/api/utils', router);
  };    