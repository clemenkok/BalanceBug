// We've to switch to MQTT due to the fact that (1) the ESP32 and Raspberry Pi do not have public static IPs.
// Thus a MQTT broker will act as an intermediary for all IoT devices and our Node.js server as well as React frontend.

const mqtt = require('mqtt');

module.exports = class mqttService {
  constructor() {
    const protocol = 'mqtt';
    const host = '35.173.232.18'; // MQTT Broker IP Address, i.e. EC2 Public IP
    const port = '1883'; // Assigned port for MQTT
    const clientId = `mqtt_${Math.random().toString(16).slice(3)}`; // Random name for device/server

    const connectUrl = `${protocol}://${host}:${port}`;

    this.client = mqtt.connect(connectUrl, {
      clientId,
      clean: true,
      connectTimeout: 4000,
      username: 'BalanceBug', // MQTT Broker connection username
      password: '123', // MQTT Broker connection password
      reconnectPeriod: 1000,
    });

    this.client.on('error', (err) => {
      console.log(err);
    });
    this.client.once('connect', () => {
      console.log('connected to MQTT server');
    });
  }
};

/*
distance payload to 'localise' topic
"red_str blue_str yellow_str current_x_str current_y_str"
"40 40 50 110.51 55.98"
int int int 2dp 2dp

red beacon is at 70, 0
blue at 130, 70
yellow at 130, 0

in localise (mqtt subscriber)
1)
check if string processing of payloads is correct
	- current_x and current_y should be correctly parsed back into the correct float
	- distanceArray should be an array of integers that correspond to [red_dist, blue_dist, yellow_dist] (same values as redstr bluestr etc above)
2) check that the trilateration gives a good result for the actual position (use desmos to check)

then, update_rover_coords is called to pass the data back to the esp. found in mqtt_publisher
1) check if string processing is correct
payloadString variable should be "Ax_result_coord, y_result_coord"
check if there is a dp limit (i didnt set)

if can receive the callback
use serial print to debug current_x and current _y
*/
