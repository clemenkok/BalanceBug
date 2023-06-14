// this contains all information collected so far from all maps 
// basically a data warehouse

module.exports = (sequelize, Sequelize) => {
    const all_info = sequelize.define("all_info", {
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