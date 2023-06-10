const { client } = new (require("../services/mqttService"))();

function start_rover() {
    client.publish('initiate_rover', 'start', { qos: 0, retain: false }, (error) => {
        console.log(`Rover Started`)
        if (error) {
        console.error(error)
        }
    })
}

module.exports = {
    start_rover
}