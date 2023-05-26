module.exports = (sequelize, Sequelize) => {
    const live_database = sequelize.define("live_database", {
        tile_num: {
          type: Sequelize.INT,
          primaryKey: true
        },
        tile_info: {
          type: Sequelize.VARCHAR(255)
        },
        last_visited: {
          type: Sequelize.DATETIME
        }
      });
    return live_database;
};