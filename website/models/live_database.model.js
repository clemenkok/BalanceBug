module.exports = (sequelize, Sequelize) => {
    const live_database = sequelize.define("live_database", {
        tile_num: {
          type: Sequelize.INTEGER,
          primaryKey: true
        },
        tile_info: {
          type: Sequelize.STRING
        },
        last_visited: {
          type: Sequelize.DATE
        }
      });
    return live_database;
};