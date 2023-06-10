const { client } = new (require("../services/mqttService"))();

function subscribe() {
    topics = ['deadreckoning_data', 'initaited_localisation']
    client.subscribe(topics);

    client.on('message', (deadreckoning_data, payload) => {
        // TODO: processing when we receive deadreckoning data from ESP32
        console.log('Received Message:', deadreckoning_data, payload.toString())

        // TODO: build map

        // TODO: log into the database map data (tile information)

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