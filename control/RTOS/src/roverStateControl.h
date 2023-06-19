#ifndef ROVER_STATE_CONTROL_H_
#define ROVER_STATE_CONTROL_H_

#include <WiFi.h>
#include <PubSubClient.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;

extern SemaphoreHandle_t mutex_v;

void roverSetup();
void roverStateLoop(void *parameters);
void startDrive();
void startRoverWait();
void startLocalise();
void printStackSpaceRover();

#endif