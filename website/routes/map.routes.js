module.exports = app => {
    const map = require("../controllers/map.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Tutorial
    router.post("/", map.create);
  
    // Retrieve all Tutorials
    router.get("/", map.findAll);
  
    // Retrieve a single Tutorial with id
    router.get("/:id", map.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", map.update);
  
    // Delete a Tutorial with id
    router.delete("/:id", map.delete);
  
    // Create a new Tutorial
    router.delete("/", map.deleteAll);
  
    app.use('/api/map', router);
  };    