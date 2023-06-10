const subscribers = require('./subscribers/MQTT_subscribers.js');
const publishers = require('./publishers/MQTT_publishers.js');

subscribers.subscribe();
publishers.start_rover();