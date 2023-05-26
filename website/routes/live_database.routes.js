module.exports = app => {
    const live_database = require("../controllers/live_database.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Tutorial
    router.post("/", live_database.create);
  
    // Retrieve all Tutorials
    router.get("/", live_database.findAll);
  
    // Retrieve a single Tutorial with id
    router.get("/:id", live_database.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", live_database.update);
  
    // Delete a Tutorial with id
    router.delete("/:id", live_database.delete);
  
    // Create a new Tutorial
    router.delete("/", live_database.deleteAll);
  
    app.use('/api/live_database', router);
  };    