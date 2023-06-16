const publishers = require("../publishers/MQTT_publishers.js");

exports.start = (req, res) => {
  publishers
    .start_rover()
    .then(() => {
      //console.log(data)
      res.send("rover started");
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message,
      });
    });
};

exports.stop = (req, res) => {
  publishers
    .stop_rover()
    .then(() => {
      //console.log(data)
      res.send("rover stopped");
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message,
      });
    });
};
