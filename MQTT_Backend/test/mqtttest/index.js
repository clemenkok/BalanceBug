// We've to switch to MQTT due to the fact that (1) the ESP32 and Raspberry Pi do not have public static IPs.
// Thus a MQTT broker will act as an intermediary for all IoT devices and our Node.js server as well as React frontend.

const mqtt = require('mqtt');

class mqttService {
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
      console.log('connected to MQTT server (test)');
    });
    
  }
};


const mqttServiceInstance = new mqttService();

mqttServiceInstance.client.subscribe('reacttest', function (err) {
    if (!err) {
      // Publish a message to a topic
      console.log("subscribed to reacttest");

      mqttServiceInstance.client.on('message', function (topic, message) {
        // message is Buffer
        console.log(topic.toString())
        console.log(message.toString())
        //client.end()
      })


    }
  })

