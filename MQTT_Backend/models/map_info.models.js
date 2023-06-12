// this contains specific map information (i.e. it tells us when each map was generated and information about the map, basically detailing data from each session)
// likewise, we save this data at the end of each run

module.exports = (sequelize, Sequelize) => {
    const map_info = sequelize.define("map_info", {
        map_id: {
          type: Sequelize.INTEGER,
          primaryKey: true
        },
        map_size: {
          type: Sequelize.INTEGER
        },
        date_time: {
          type: Sequelize.DATE
        }
      });
    return map_info;
};