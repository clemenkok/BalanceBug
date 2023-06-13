module.exports = app => {
    // const map_info = require("../controllers/map_info.controllers.js");

    const router = require("express").Router();

    app.use('/api/map_info', router);
};