#ifndef ROVER_STATE_CONTROL_H_
#define ROVER_STATE_CONTROL_H_

#include <WiFi.h>
#include <PubSubClient.h>
#include "uartToDistance.h"
#include<HardwareSerial.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;

extern SemaphoreHandle_t mutex_v;

extern HardwareSerial SerialPort;

void roverSetup();
void roverStateLoop(void *parameters);
void startDrive();
void startRoverWait();
void startLocalise();
void printStackSpaceRover();

#endif