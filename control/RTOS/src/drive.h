#ifndef DRIVE_H_
#define DRIVE_H_

#include <WiFi.h>
#include <PubSubClient.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;

void calibrate(int& VMax, int& VMin, int sensorPin, int testNo);
void driveSetup();
void driveLoop();
void updatePosition(unsigned long positionElapsedTime);
void spinClockwise();
void stopSpinClockwise();
void collectData();
void driftCorrection();


#endif