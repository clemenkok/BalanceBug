#ifndef ROVER_STATE_CONTROL_H_
#define ROVER_STATE_CONTROL_H_

#include <WiFi.h>
#include <PubSubClient.h>
#include "uartToDistance.h"
#include "drive.h"
#include <HardwareSerial.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;

extern HardwareSerial SerialPort;

extern bool driftCorrect;

void roverSetup();
void roverStateLoop();
void startDrive();
void startRoverWait();
void startLocalise();

#endif