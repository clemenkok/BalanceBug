module.exports = app => {
    const all_info = require("../controllers/all_info.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Tutorial
    router.post("/", all_info.create);
  
    // Retrieve all Tutorials
    router.get("/", all_info.findAll);
  
    // Retrieve a single Tutorial with id
    router.get("/:id", all_info.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", all_info.update);
  
    // Delete a Tutorial with id
    router.delete("/:id", all_info.delete);
  
    // Create a new Tutorial
    router.delete("/", all_info.deleteAll);
  
    app.use('/api/all_info', router);
  };    