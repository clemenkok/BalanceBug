// Accepts input and converts to commands for the model or view. 

const db = require("../models");
const Map_info = db.map_info;
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

  const map_info = {
    map_id: req.body.map_id,
    map_name: req.body.map_name,
    user_map_name: req.body.user_map_name,
    map_size: req.body.map_size,
    date_time: req.body.date_time
  };

  Map_info.create(map_info)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the map_info Table."
      });
    });

};

// Retrieve all items from the database.
exports.findAll = (req, res) => {
  const title = req.query.title;
  var condition = title ? { title: { [Op.like]: `%${title}%` } } : null;

  Map_info.findAll({ where: condition })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving map_info."
      });
    });

};

// Find a single map data with an id
exports.findOne = (req, res) => {
  const id = req.params.id;

  Map_info.findByPk(id)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving map_info with id=" + id
      });
    });

};

// Update map data by the id in the request
exports.update = (req, res) => {
  const id = req.params.id;

  Map_info.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "map_info was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update map_info with id=${id}. Maybe map_info was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating map_info with id=" + id
      });
    });

};

// Delete map data with the specified id in the request
exports.delete = (req, res) => {
  const id = req.params.id;

  Map_info.destroy({
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Data from map_info was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete map_info with id=${id}. Maybe map_info was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete map_info with id=" + id
      });
    });

};

// Delete all map_data from the database.
exports.deleteAll = (req, res) => {
  
  Map_info.destroy({
    where: {},
    truncate: false
  })
    .then(nums => {
      res.send({ message: `${nums} data from map_info were deleted successfully!` });
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all map_info."
      });
    });

};
