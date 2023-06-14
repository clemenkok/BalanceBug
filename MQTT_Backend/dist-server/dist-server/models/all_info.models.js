"use strict";

// this contains all information collected so far from all maps 
// basically a data warehouse
module.exports = function (sequelize, Sequelize) {
  var all_info = sequelize.define("all_info", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true
    },
    map_id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    tile_info: {
      type: Sequelize.JSON
    },
    tile_num: {
      type: Sequelize.JSON
    }
  });
  return all_info;
};