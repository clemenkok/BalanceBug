const { client } = new (require("../services/mqtt_service"))();

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

module.exports = {
    start_rover,
    stop_rover
};