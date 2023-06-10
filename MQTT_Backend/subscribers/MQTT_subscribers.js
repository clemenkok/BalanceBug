const { client } = new (require("../services/mqtt_service"))();
const db = require("../models");
const Live_database = db.live_database;

// MQTT is not request-response based (it is a message queue)! So server-side delays (e.g. DB writes) do not hold up board-side processing!
function subscribe() {
    topics = ['deadreckoning_data', 'initaited_localisation']
    client.subscribe(topics);

    // Handler function that is called when deadreckoning data comes in
    client.on('message', (deadreckoning_data, payload) => {
        // TODO: processing when we receive deadreckoning data from ESP32 (convert distance travelled, wall data, angle -> tile_info and tile_num: @Yomna)
        console.log('Received Message:', deadreckoning_data, payload.toString())

        // Placeholder Data
        let tile_info = [1, 0, 0, 0, 1]
        let tile_num = [0, 0]

        // updates global 35x35 map in memory. TODO: relook at parsing JSON data from ESP32
        globalMap[tile_num[0]][tile_num[1]] = tile_info;

        // Log the updated map
        console.log('Updated Map:', globalMap);

        // Log into the database map data (tile information) - this is important so we can save history from different maps. 
        // Plus the frontend will also poll and receive data this way. Why not send directly to the frontend (minimising read/writes)? We want to implement 'separation of responsibilities' here.
        const live_database = {
            tile_num: tile_info,
            tile_info: tile_num
        };

        Live_database.create(live_database)
            .then(data => {
                res.send("added tile data to database:" + data);
            })
            .catch(err => {
                res.status(500).send({
                    message:
                        err.message || "Some error occurred while creating the live_database Table."
                });
            });

    })

    client.on('message', (initiated_localisation, payload) => {
        // TODO: processing when we have been notified that localisation is happening from ESP32
        console.log('Received Message:', initiated_localisation, payload.toString())

        // TODO: turn on beacon 1
        client.publish(beacon_1_control, '1', { qos: 0, retain: false }, (error) => {
            console.log(`Beacon 1 turned on`)
            if (error) {
                console.error(error)
            }
        })

        // TODO: add height data into histogram


        // TODO: check if max height has been reached, if so then turn off beacon 1 and turn on beacon 2


        // TODO: check if distances from all 3 beacons have been obtained and then perform NLSR to localise


        // TODO: Update the map


    })

}

module.exports = {
    subscribe
};