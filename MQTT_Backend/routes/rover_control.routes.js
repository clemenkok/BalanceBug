module.exports = (app) => {
  const rover_control = require("../controllers/rover_control.controllers.js");

  const router = require("express").Router();

  router.post("/start", rover_control.start);
  router.post("/stop", rover_control.stop);

  app.use("/api/rover_control", router);
};
