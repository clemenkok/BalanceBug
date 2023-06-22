const { client } = new (require('../services/mqtt_service'))();
const { mazeMap, rover, funcCaseA } = require('../services/mapping');
const { trilateration } = require('../services/trilateration');
const { update_rover_coords } = require('../publishers/MQTT_publishers');
const db = require('../models');
const Live_database = db.live_database;

const { socketemit } = require('../publishers/socketshit');

function subscribe() {
  // subscribing to an array of topics may cause unintended side effects
  client.subscribe('deadreckoning_data');
  client.subscribe('red_beacon');
  client.subscribe('blue_beacon');
  client.subscribe('yellow_beacon');
  client.subscribe('localise');
  client.subscribe('echo');

  /* -------------------------------------------------------------------------------------------------------------------------------------------------- */

  // Handler function that is called when ANY packet comes in

  client.on('message', function (topic, message, packet) {
    // processing when we receive deadreckoning data from ESP32
    if (topic === 'deadreckoning_data') {
      console.log(message.toString());
      let data = message.toString().split(',');

      // extract data
      let x = parseFloat(data[0]);
      let y = parseFloat(data[1]);
      let bearing = parseFloat(data[2]);
      let leftWall = data[3] === '1';
      let rightWall = data[4] === '1';
      
      if (leftWall === '1') {
        wallDirection = 'left';
      } else if (rightWall === '1') {
        wallDirection = 'right';
      } else {
        wallDirection = 'none';
      }

      //change me it might not be right
      socketemit('rover_current_coords', [
        x,
        y,
        wallDirection,
      ]);

      /*  

      let tile = funcCaseA(mazeMap, rover, x, y, bearing, leftWall, rightWall);
      tile_num = tile[0];
      tile_info = tile[1];
      // }

      // updates global 35x35 map in memory.
      global.globalMap[tile_num[0]][tile_num[1]] = tile_info;

      const live_database = {
        tile_num: tile_num,
        tile_info: tile_info
    };

    Live_database.create(live_database)
        .then(data => {
            console.log("added tile data to database:" + data);
        })
        .catch(err => {
            console.log({
                message:
                    err.message || "Some error occurred while creating the live_database Table."
            });
        }); */
    }

    /* -------------------------------------------------------------------------------------------------------------------------------------------------- */

    if (topic === 'echo') {
      // TODO: processing when we have been notified that red_beacon is to turn on
      console.log('Received Message:', message.toString());
    }

    /* -------------------------------------------------------------------------------------------------------------------------------------------------- */

    if (topic === 'red_beacon') {
      // TODO: processing when we have been notified that red_beacon is to turn on
      console.log('Received Message (red_beacon):', message.toString());
    }

    if (topic === 'blue_beacon') {
      // TODO: processing when we have been notified that red_beacon is to turn on
      console.log('Received Message (blue_beacon):', message.toString());
    }
    if (topic === 'yellow_beacon') {
      // TODO: processing when we have been notified that red_beacon is to turn on
      console.log('Received Message (yellow_beacon):', message.toString());
    }
    if (topic === 'localise') {
      // TODO: processing when we have been notified that red_beacon is to turn on
      console.log('Received Message  (localise):', message.toString());
      const payloadStrArray = message.toString().split(' ');
      const distanceArray = payloadStrArray
        .slice(0, 3)
        .map((value) => parseInt(value));
      const current_x = parseFloat(payloadStrArray[3]);
      const current_y = parseFloat(payloadStrArray[4]);

      console.log(payloadStrArray, distanceArray, current_x, current_y);

      // Hardcode the beacon x and y positions
      //        red       blue      yellow    rover rotate in clockwise direction
      const x = [
        [225, 350],
        [225, 0],
        [0, 350],
      ];
      // error here. Need to stringify before parsing
      const trilateration_result = JSON.parse(
        JSON.stringify(trilateration(x, distanceArray, [current_x, current_y]))
      );
      const result_coordinates_x = parseFloat(
        trilateration_result.parameterValues[0]
      );
      const result_coordinates_y = parseFloat(
        trilateration_result.parameterValues[1]
      );
      // send back to the esp32
      console.log(result_coordinates_x, result_coordinates_y);
      update_rover_coords(result_coordinates_x, result_coordinates_y);
    }
  });
}

module.exports = {
  subscribe,
};

// Log the updated map
// console.log('Updated Map:', global.globalMap);

// Log into the database map data (tile information) - this is important so we can save history from different maps.
// Plus the frontend will also poll and receive data this way. Why not send directly to the frontend (minimising read/writes)? We want to implement 'separation of responsibilities' here.

/*      const live_database = {
            tile_num: tile_info,
            tile_info: tile_num
        };

        Live_database.create(live_database)
            .then(data => {
                console.log("added tile data to database:" + data);
            })
            .catch(err => {
                console.log({
                    message:
                        err.message || "Some error occurred while creating the live_database Table."
                });
            });

    // Input points (x,y) 
    const x = [[0, 0],[0, 2],[2, 2]] an array of (x, y) coordinates that are the center of the circle
    const y = [1, 1.5, 2];  // the distance of the beacons from the rover

    // Parameter values to use for first iteration
    const initialValues = [2, -1]; // i.e., y = x
    // {
    //   parameterValues: [1.9999986750084096, -1.9999943899435104]
    //   parameterError: 6.787132159723697e-11
    //   iterations: 2
    // }
    */
