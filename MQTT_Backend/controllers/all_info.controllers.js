const db = require("../models");
const All_info = db.all_info;
const Live_database = db.live_database;

// On pressing 'save map' in the frontend, dump data from live_database to all_info
// An async-await model makes sense here because this is a computational intensive operation
exports.dump = async (req, res) => {
  try {
    // Retrieve data from the source table
    const sourceData = await Live_database.findAll();

    // Insert data into the destination table
    await All_info.bulkCreate(sourceData);

    res.send("Saved Map Successfully!");
  } catch (error) {
    console.error(error);
    res.status(500).send("An error occurred");
  }
};

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */
