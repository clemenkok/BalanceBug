#ifndef UART_TO_DISTANCE_H_
#define UART_TO_DISTANCE_H_

#include <WiFi.h>
#include <PubSubClient.h>

extern WiFiClient wifiClient;
extern PubSubClient MQTTclient;
extern SemaphoreHandle_t sema_keepMQTTAlive;

void uartToDistanceSetup();
long getBoxHeightInPixels(unsigned char (&myBuffer)[12]);
long getPixelCenterX(unsigned char (&myBuffer)[12]);
int convertDistanceCm(long bb_pixel_height);
bool takeReading(long pixel_center_x, long pixel_box_height);
void uartToDistanceLoop();
void setStartLocalisationTrue();

#endif