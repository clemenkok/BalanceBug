module.exports = app => {
    const map = require("../controllers/map.controller.js");
  
    var router = require("express").Router();
  
    // edit global map
    router.post("/", map.edit);
  
    app.use('/api/map', router);
  };    