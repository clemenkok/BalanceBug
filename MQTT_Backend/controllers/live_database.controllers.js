const db = require("../models");
const Live_database = db.live_database;

// Find the latest tile information (completed)
exports.findOne = (req, res) => {
  Live_database.findOne({
    order: [["createdAt", "DESC"]],
  })
    .then((data) => {
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
  const live_database = {
    tile_num: req.body.tile_info,
    tile_info: res.body.tile_num,
  };

  Live_database.create(live_database)
    .then((data) => {
      console.log("added tile data to database:" + data);
    })
    .catch((err) => {
      console.log({
        message:
          err.message ||
          "Some error occurred while creating the live_database Table.",
      });
    });
};
