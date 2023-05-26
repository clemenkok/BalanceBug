module.exports = (sequelize, Sequelize) => {
    const all_info = sequelize.define("all_info", {
        id: {
          type: Sequelize.INTEGER,
          primaryKey: true
        },
        map_id: {
          type: Sequelize.STRING
        },
        tile_info: {
          type: Sequelize.INTEGER
        },
        tile_number: {
          type: Sequelize.INTEGER
        }
      });
    return all_info;
};