module.exports = app => {
    const map_info = require("../controllers/map_info.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Tutorial
    router.post("/", map_info.create);
  
    // Retrieve all Tutorials
    router.get("/", map_info.findAll);
  
    // Retrieve a single Tutorial with id
    router.get("/:id", map_info.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", map_info.update);
  
    // Delete a Tutorial with id
    router.delete("/:id", map_info.delete);
  
    // Create a new Tutorial
    router.delete("/", map_info.deleteAll);
  
    app.use('/api/map_info', router);
  };    