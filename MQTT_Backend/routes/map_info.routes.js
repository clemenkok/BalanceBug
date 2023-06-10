module.exports = app => {
    const map_info = require("../controllers/map_info.controller.js");

    var router = require("express").Router();

    app.use('/api/map_info', router);
}