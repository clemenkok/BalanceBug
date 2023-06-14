"use strict";

// this contains information collected so far the current map (from each run/session)
// data is pushed into here continuously as the rover moves in real-time
// we save this data into all_info when the run is complete (and we decide to save, via the frontend)

module.exports = function (sequelize, Sequelize) {
  var live_database = sequelize.define("live_database", {
    tile_num: {
      type: Sequelize.JSON
    },
    tile_info: {
      type: Sequelize.JSON
    }
  });
  return live_database;
};