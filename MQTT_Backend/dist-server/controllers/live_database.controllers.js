"use strict";

var db = require("../models");
var Live_database = db.live_database;

// Find the latest tile information (completed)
exports.findOne = function (req, res) {
  Live_database.findOne({
    order: [["createdAt", "DESC"]]
  }).then(function (data) {
    res.send(data);
  })["catch"](function (err) {
    res.status(500).send({
      message: err.message || "Error retrieving latest live db tile"
    });
  });
};

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

// Test function.
exports.create = function (req, res) {
  var live_database = {
    tile_num: req.body.tile_info,
    tile_info: res.body.tile_num
  };
  Live_database.create(live_database).then(function (data) {
    console.log("added tile data to database:" + data);
  })["catch"](function (err) {
    console.log({
      message: err.message || "Some error occurred while creating the live_database Table."
    });
  });
};