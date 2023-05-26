// Accepts input and converts to commands for the model or view. 

const db = require("../models");
const All_info = db.all_info;
const Op = db.Sequelize.Op;

// Create and Save a new Table
exports.create = (req, res) => {
  // Validate request
  if (!req.body.title) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  const all_info = {
    id: req.body.id,
    map_id: req.body.map_id,
    tile_info: req.body.tile_info,
    tile_number: req.body.tile_number
  };

  All_info.create(all_info)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the all_info Table."
      });
    });

};

// Retrieve all items from the database.
exports.findAll = (req, res) => {
  const title = req.query.title;
  var condition = title ? { title: { [Op.like]: `%${title}%` } } : null;

  All_info.findAll({ where: condition })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving all_info."
      });
    });

};

// Find a single map data with an id
exports.findOne = (req, res) => {
  const id = req.params.id;

  All_info.findByPk(id)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving all_info with id=" + id
      });
    });

};

// Update map data by the id in the request
exports.update = (req, res) => {
  const id = req.params.id;

  All_info.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "all_info was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update all_info with id=${id}. Maybe all_info was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating all_info with id=" + id
      });
    });

};

// Delete map data with the specified id in the request
exports.delete = (req, res) => {
  const id = req.params.id;

  All_info.destroy({
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Data from all_info was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete all_info with id=${id}. Maybe all_info was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete all_info with id=" + id
      });
    });

};

// Delete all map_data from the database.
exports.deleteAll = (req, res) => {
  All_info.destroy({
    where: {},
    truncate: false
  })
    .then(nums => {
      res.send({ message: `${nums} data from all_info were deleted successfully!` });
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all_info."
      });
    });

};
