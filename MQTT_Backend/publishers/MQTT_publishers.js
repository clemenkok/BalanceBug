const { socketemit } = require('./socketstuff');

const { client } = new (require('../services/mqtt_service'))();

// Starts the rover (initiated by the Frontend)
function start_rover() {
  client.publish('start_rover', '1', { qos: 0, retain: false }, (error) => {
    console.log(`Rover Started`);
    if (error) {
      console.error(error);
    }
  });
}

// Starts the rover (initiated by the Frontend)
function stop_rover() {
  client.publish('stop_rover', '1', { qos: 0, retain: false }, (error) => {
    console.log(`Rover Stopped`);
    if (error) {
      console.error(error);
    }
  });
}

// this payload has the first letter A
function update_rover_coords(result_coordinates_x, result_coordinates_y) {
  payloadString =
    'A' +
    result_coordinates_x.toString() +
    ',' +
    result_coordinates_y.toString();

  client.publish(
    'rover_current_coords',
    payloadString,
    { qos: 0, retain: false },
    (error) => {
      console.log('Rover coordinates sent to esp32');
      if (error) {
        console.error(error);
      }
    }
  );
}

module.exports = {
  start_rover,
  stop_rover,
  update_rover_coords,
};
