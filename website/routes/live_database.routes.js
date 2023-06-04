module.exports = app => {
  const live_database = require("../controllers/live_database.controller.js");

  var router = require("express").Router();

  // Create new row for tile information 
  router.post("/", live_database.create);
/*   
  // Retrieve all tile info
  router.get("/", live_database.findAll); */

  // Retrieve a single tile info with id
  router.get("/latest", live_database.findOne);
/* 
  // Update a tile info with id
  router.put("/:id", live_database.update);

  // Delete a tile info with id
  router.delete("/:id", live_database.delete);

  // Delete new tile info
  router.delete("/", live_database.deleteAll);
 */
  app.use('/api/live_database', router);
};    