"use strict";

var dbConfig = require("../config/db.config.js");
var Sequelize = require("sequelize");
var sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  operatorsAliases: false,
  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle
  }
});
var db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.all_info = require("./all_info.models.js")(sequelize, Sequelize);
db.map_info = require("./map_info.models.js")(sequelize, Sequelize);
db.live_database = require("./live_database.models.js")(sequelize, Sequelize);

//db.map_info.belongsTo(db.all.info, {
//  foreignKey: 'map_id'
//});

/* // Raw SQL Query to insert data in all_info when saving
sequelize.query(
  'INSERT INTO all_info (tile_number, tile_info) SELECT tile_num, tile_info FROM live_database',
  { type: Sequelize.QueryTypes.RAW }
)
  .then(() => {
    console.log('Data inserted successfully');
  })
  .catch(err => {
    console.error('Error inserting data:', err);
  }); */

module.exports = db;