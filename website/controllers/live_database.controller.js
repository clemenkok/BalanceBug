// Accepts input and converts to commands for the model or view. 
// TODO: GET endpoint for requesting latest DB record (completed)

const db = require("../models");
const Live_database = db.live_database;
const Op = db.Sequelize.Op;

// Create and Save a new row containing tile info
exports.create = (req, res) => {
  // Validate request
  if (!req.body.tile_num) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  // updates map in memory
  let updatedTileInfo = req.body.tile_info;
  let newGlobalX = req.body.tile_num[0];
  let newGlobalY = req.body.tile_num[1];
  globalMap[newGlobalX][newGlobalY] = updatedTileInfo;

  // Log the updated array (testing)
  console.log('Updated Array:', globalMap);

  const live_database = {
    tile_num: req.body.tile_num,
    tile_info: req.body.tile_info
  };

  Live_database.create(live_database)
    .then(data => {
      res.send("tile_info successfully created:" + data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the live_database Table."
      });
    });
};

// Find the latest tile information (completed)
exports.findOne = (req, res) => {

  Live_database.findOne({
    order: [['createdAt', 'DESC']],
  })
    .then(data => {
      /* updates map in memory
      let updatedTileInfo = data.tile_info;
      let newGlobalX = data.tile_num[0];
      let newGlobalY = data.tile_num[1];
      globalMap[newGlobalX][newGlobalY] = updatedTileInfo; */
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: err.message || "Error retrieving latest live db tile"
      });
    });
};
/* 

// Retrieve all items from the database.
exports.findAll = (req, res) => {
  const tile_num = req.query.tile_num;
  var condition = tile_num ? { tile_num: { [Op.like]: `%${tile_num}%` } } : null;

  Live_database.findAll({ where: condition })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving live_database."
      });
    });
};

// Update map data by the id in the request
exports.update = (req, res) => {
  const id = req.params.id;

  Live_database.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "live_database was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update live_database with id=${id}. Maybe live_database was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating live_database with id=" + id
      });
    });
};

// Delete map data with the specified id in the request
exports.delete = (req, res) => {
  const id = req.params.id;

  Live_database.destroy({
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Data from live_database was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete live_database with id=${id}. Maybe live_database was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete live_database with id=" + id
      });
    });
};

// Delete all map_data from the database.
exports.deleteAll = (req, res) => {

  Live_database.destroy({
    where: {},
    truncate: false
  })
    .then(nums => {
      res.send({ message: `${nums} data from live_database were deleted successfully!` });
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all live_database."
      });
    });
}; */