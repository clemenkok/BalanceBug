const db = require('../models');
const Live_database = db.live_database;

// Find tile information according to the counter specified, ensuring that all data is obtained.
exports.findOne = (req, res) => {
  console.log(req.query.counter_val)
  Live_database.findByPk(req.query.counter_val)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || 'Error retrieving live db tile',
      });
    });
};

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

// Test function.
exports.create = (req, res) => {
  if (!req.body.tile_num) {
    res.status(400).send({
      message: 'Content can not be empty.',
    });
    return;
  }
  const live_database = {
    tile_info: req.body.tile_info,
    tile_num: req.body.tile_num,
  };

  Live_database.create(live_database)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          'Some error occurred while creating the live_database Table.',
      });
    });
};
