const db = require("../models");
const Live_database = db.live_database;

// Find the latest tile information (completed)
exports.findOne = (req, res) => {
  Live_database.findOne({
    order: [["createdAt", "DESC"]],
  })
    .then((data) => {
      //console.log(data)
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Error retrieving latest live db tile",
      });
    });
};

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

// Test function.
exports.create = (req, res) => {

  if (!req.body.tile_num) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }
  const live_database = {
    tile_info: req.body.tile_info,
    tile_num: req.body.tile_num
  };

  Live_database.create(live_database)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the live_database Table."
      });
    });
};
