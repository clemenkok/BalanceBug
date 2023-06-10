module.exports = (sequelize, Sequelize) => {
    const deadreckoning_data = sequelize.define("deadreckoning_data", {
        distance_travelled: {
          type: Sequelize.INTEGER,
        },
        angle: {
          type: Sequelize.INTEGER
        }
      });
    return deadreckoning_data;
};