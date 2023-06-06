module.exports = (sequelize, Sequelize) => {
  const live_database = sequelize.define("live_database", {
      tile_num: {
        type: Sequelize.JSON, 
      },
      tile_info: {
        type: Sequelize.JSON
      }
    });
  return live_database;
};