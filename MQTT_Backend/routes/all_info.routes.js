// what we want is a way to dump all the data from the map_info table into all_info

module.exports = app => {
    const all_info = require("../controllers/all_info.controller.js");

    const router = require("express").Router();
    
    router.get("/dump", all_info.dump);

    app.use('/api/all_info', router);
};