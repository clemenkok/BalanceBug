const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
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

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.all_info = require("./all_info.model.js")(sequelize, Sequelize);
db.map_info = require("./map_info.model.js")(sequelize, Sequelize);
db.live_database = require("./live_database.model.js")(sequelize, Sequelize);


db.all_info.belongsTo(db.map_info, {
  foreignKey: 'map_id'
});

// Raw SQL Query to insert data in all_info when live_database is updated
sequelize.query(
  'INSERT INTO all_info (tile_number, tile_info) SELECT tile_num, tile_info FROM live_database',
  { type: Sequelize.QueryTypes.RAW }
)
  .then(() => {
    console.log('Data inserted successfully');
  })
  .catch(err => {
    console.error('Error inserting data:', err);
  });

module.exports = db;  