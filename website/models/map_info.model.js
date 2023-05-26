module.exports = (sequelize, Sequelize) => {
    const map_info = sequelize.define("all_info", {
        id: {
          type: Sequelize.NUMBER,
          primaryKey: true
        },
        map_id: {
          type: Sequelize.STRING
        },
        tile_info: {
          type: Sequelize.NUMBER
        },
        tile_number: {
          type: Sequelize.INT
        }
      });
    return map_info;
};