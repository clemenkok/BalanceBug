const db = require("../models");
const Live_database = db.live_database;

// Find the latest tile information (completed)
exports.findOne = (req, res) => {

  Live_database.findOne({
    order: [['createdAt', 'DESC']],
  })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: err.message || "Error retrieving latest live db tile"
      });
    });
};
