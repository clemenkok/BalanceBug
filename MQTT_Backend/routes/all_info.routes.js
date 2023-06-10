module.exports = app => {
    const all_info = require("../controllers/all_info.controller.js");

    var router = require("express").Router();

    app.use('/api/all_info', router);
}