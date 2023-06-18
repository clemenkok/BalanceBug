#ifndef KEEPMQTTALIVE_H
#define KEEPMQTTALIVE_H

#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>

// function to connect to MQTT Broker
void connectToMQTT();

// function that assists with wifi debugging
void WiFiEvent(WiFiEvent_t event);

// function that connects ESP32 to wifi
void connectToWiFi();

// task that checks for MQTT connection status intermittently
void keepMQTTAlive(void *parameters);
void printStackSpaceMQTT();

#endif