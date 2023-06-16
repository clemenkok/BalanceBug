#ifndef PUBLISHDEADRECKONINGDATA_H
#define PUBLISHDEADRECKONINGDATA_H

#include <WiFi.h>
#include <PubSubClient.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;
extern SemaphoreHandle_t sema_keepMQTTAlive;

// task that periodically publishes deadreckoning data to MQTT
void publishDeadreckoningData(void *parameters);

#endif