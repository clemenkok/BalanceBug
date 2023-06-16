const { client } = new (require("../services/mqtt_service"))();
const { rover, mazeMap, caseA } = require('../services/mapping')
// const db = require("../models");
// const Live_database = db.live_database;

// MQTT is not request-response based (it is a message queue)! So server-side delays (e.g. DB writes) do not hold up board-side processing!
function subscribe() {
    let topics = ['deadreckoning_data', 'initaited_localisation', 'red_beacon', 'blue_beacon', 'yellow_beacon', 'localise'];
    client.subscribe(topics);

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

    // Handler function that is called when deadreckoning data comes in
    client.on('message', (deadreckoning_data, payload) => {
        // TODO: processing when we receive deadreckoning data from ESP32 (convert distance travelled, wall data, angle -> tile_info and tile_num: @Yomna)
        console.log('Received Message:', deadreckoning_data, payload.toString());
        // Placeholder Data
        let tile_info = [0, 0, 0, 0, 0];
        let tile_num = [0, 0];
        if(deadreckoning_data === topics[0]){
            let data = payload.toString().split(',');

            // extract data
            let x = parseFloat(data[0]);
            let y = parseFloat(data[1]);
            let bearing = parseFloat(data[2]);
            let leftWall = (data[3] === '1');
            let rightWall = (data[4] === '1');
            tile = caseA(mazeMap, rover, x, y, bearing, leftWall, rightWall)
            tile_num = tile[0]
            tile_info = tile[1]
        }

        // updates global 35x35 map in memory. TODO: relook at parsing JSON data from ESP32
        global.globalMap[tile_num[0]][tile_num[1]] = tile_info;

        // Log the updated map
        console.log('Updated Map:', global.globalMap);

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
*/
    });

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

    client.on('message', (initiated_localisation, payload) => {
        // TODO: processing when we have been notified that localisation is happening from ESP32
        console.log('Received Message:', initiated_localisation, payload.toString());

        // TODO: turn on beacon 1
        client.publish('beacon_1_control', '1', { qos: 0, retain: false }, (error) => {
            console.log(`Beacon 1 turned on`);
            if (error) {
                console.error(error);
            }
        });

        // TODO: add height data into histogram


        // TODO: check if max height has been reached, if so then turn off beacon 1 and turn on beacon 2


        // TODO: check if distances from all 3 beacons have been obtained and then perform NLSR to localise


        // TODO: Update the map


    });

/* -------------------------------------------------------------------------------------------------------------------------------------------------- */

    client.on('message', (red_beacon, payload) => {
        // TODO: processing when we have been notified that red_beacon is to turn on
        console.log('Received Message:', red_beacon, payload.toString());

    });

    client.on('message', (blue_beacon, payload) => {
        // TODO: processing when we have been notified that red_beacon is to turn on
        console.log('Received Message:', blue_beacon, payload.toString());

    });

    client.on('message', (yellow_beacon, payload) => {
        // TODO: processing when we have been notified that red_beacon is to turn on
        console.log('Received Message:', yellow_beacon, payload.toString());

    });

    client.on('message', (localise, payload) => {
        // TODO: processing when we have been notified that red_beacon is to turn on
        console.log('Received Message:', localise, payload.toString());

    });

}

module.exports = {
    subscribe
};