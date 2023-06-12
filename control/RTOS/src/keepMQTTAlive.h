#ifndef KEEPMQTTALIVE_H
#define KEEPMQTTALIVE_H

#include <WiFi.h>
#include <Arduino.h>
#include <PubSubClient.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;
extern SemaphoreHandle_t sema_keepMQTTAlive;

// function to connect to MQTT Broker
void connectToMQTT();

// function that assists with wifi debugging
void WiFiEvent(WiFiEvent_t event);

// function that connects ESP32 to wifi
void connectToWiFi();

// task that checks for MQTT connection status intermittently
void keepMQTTAlive(void *parameters);

#endif