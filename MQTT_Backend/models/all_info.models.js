// this contains all information collected so far from all maps 
// basically a data warehouse

module.exports = (sequelize, Sequelize) => {
    const all_info = sequelize.define("all_info", {
        id: {
          type: Sequelize.INTEGER,
          primaryKey: true
        },
        map_id: {
          type: Sequelize.INTEGER
        },
        tile_info: {
          type: Sequelize.JSON
        },
        tile_number: {
          type: Sequelize.JSON
        }
      });
    return all_info;
};