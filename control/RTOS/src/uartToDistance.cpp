#include "uartToDistance.h"
#include <HardwareSerial.h>
#include <stdio.h>
#include <cstring>
#include "drive.h"

#define BAUDRATE 115200
#define RX_PIN 3
#define TX_PIN 1
HardwareSerial SerialPort(2);

// String msg_buf;
unsigned char myBuffer[12];

enum LocalisationState
{
  WAITING,
  LOOKING_FOR_1ST_BALL,
  LOOKING_FOR_2ND_BALL,
  LOOKING_FOR_3RD_BALL,
  SEND_DISTANCES
};

// need to subscribe topic
// 1) Receive new coordinates

LocalisationState currentState = WAITING;

// state controllers
bool start_localisation = false; // controlled by main rover state control
bool change_state = false;

int red_dist;
int blue_dist;
int yellow_dist;

double current_x = 0; // current robot x coord
double current_y = 0;

void uartToDistanceSetup()
{
  SerialPort.begin(BAUDRATE, SERIAL_8N1, RX_PIN, TX_PIN);
}
 
long getBoxHeightInPixels(unsigned char (&myBuffer)[12])
{
  // myBuffer[0] is
  //   1: red
  //   2: blue
  //   3: yellow
  int color_id = myBuffer[0];

  // {11110, y_max} is given by buffer[8] + buffer[9]<<8
  // so y_max is (buffer[8] + buffer[9]<<8) - 15<<9
  long y_max = (myBuffer[8] + (myBuffer[9] << 8)) - (61440);

  // {00000, y_min} given by buffer[4] + buffer[5]<<8
  long y_min = (myBuffer[4] + (myBuffer[5] << 8));

  if (y_max - y_min < 0)
    return 0;
  return y_max - y_min;
}

long getPixelCenterX(unsigned char (&myBuffer)[12])
{

  // {11110, x_max} is given by buffer[8] + buffer[9]<<8
  // so y_max is (buffer[10] + buffer[11]<<8) - 15<<9
  long x_max = (myBuffer[10] + (myBuffer[11] << 8)) - (15 << 8);

  long x_min = (myBuffer[6] + (myBuffer[7] << 8));

  return x_min + (x_max - x_min) / 2;
}

int convertDistanceCm(long bb_pixel_height)
{
  return 5206.6 / bb_pixel_height;
}

bool takeReading(long pixel_center_x, long pixel_box_height)
{
  // take the height reading when the pixel center is about 1/3 from the left
  // there are a total of 640 width pixels
  // take one single reading when center is within the range of 210-20 to 210+20
  if (pixel_box_height == 0)
    return false;
  return 190 < pixel_center_x < 230;
}

void setStartLocalisationTrue(){
  start_localisation = true;
}

void uartToDistanceLoop()
{
    // make the rover turn clockwise if it is looking for ball
    if (currentState == LOOKING_FOR_1ST_BALL || currentState == LOOKING_FOR_2ND_BALL || currentState == LOOKING_FOR_3RD_BALL ){
      spinClockwise();
    }

    if (SerialPort.available() > 11)
    {
      // The serial data comes in one byte at a time
      // Read 4 bytes at the same time

      SerialPort.readBytes(myBuffer, 12);
      for (int i = 0; i < 12; i++){
        Serial.print(myBuffer[i], HEX);
        Serial.print(" ");
      }
      Serial.println();

      long pixel_box_height = getBoxHeightInPixels(myBuffer);
      long pixel_center_x = getPixelCenterX(myBuffer);

      int distance;

      if (currentState != WAITING && currentState != SEND_DISTANCES)
      {
        if (takeReading(pixel_center_x, pixel_box_height))
        {
          distance = convertDistanceCm(pixel_box_height);
          // move the state machine forward
          if (currentState == LOOKING_FOR_1ST_BALL && myBuffer[0] == 1) change_state = true;
          else if (currentState == LOOKING_FOR_2ND_BALL && myBuffer[0] == 2) change_state = true;
          else if (currentState == LOOKING_FOR_3RD_BALL && myBuffer[0] == 3) change_state = true;
        }
      }
      Serial.println(currentState);

      switch (currentState)
      {
      case WAITING:
        if (start_localisation)
        {
          change_state = false;
          // Transition to the next state based on some condition or event
          currentState = LOOKING_FOR_1ST_BALL;
          // Turn on light for the first ball
          MQTTclient.publish("red_beacon", "ON");
          start_localisation = false;
        }
        break;

      case LOOKING_FOR_1ST_BALL:
        if (change_state)
        {
          change_state = false;
          red_dist = distance;
          distance = 0;
          // Transition to the next state based on some condition or event
          currentState = LOOKING_FOR_2ND_BALL;
          // Turn on light for the second ball
          MQTTclient.publish("red_beacon", "OFF");
          MQTTclient.publish("blue_beacon", "ON");
        }
        break;

      case LOOKING_FOR_2ND_BALL:
        if (change_state)
        {
          change_state = false;
          blue_dist = distance;
          distance = 0;
          // Transition to the next state based on some condition or event
          currentState = LOOKING_FOR_3RD_BALL;
          // Turn on light for the third ball
          MQTTclient.publish("blue_beacon", "OFF");
          MQTTclient.publish("yellow_beacon", "ON");
        }
        break;

      case LOOKING_FOR_3RD_BALL:
        if (change_state)
        {
          change_state = false;
          yellow_dist = distance;
          distance = 0;
          // Transition to the next state based on some condition or event
          currentState = SEND_DISTANCES;
          MQTTclient.publish("yellow_beacon", "OFF");

          // once found looking for third ball, stop spinning
          stopSpinningClockwise();
        }
        break;

      case SEND_DISTANCES:
        // the payload is a string of the form "red_dist blue_dist yellow_dist current_x current_y"
        // current_x and current_y is the current coordinates based on deadreckoning
        // and they are to be updated after trilateration is performed.
        // current_x and current_y helps act as a initial guess for more accurate linear regression
        currentState = WAITING;
        char distance_payload[24];

        char red_str[8];
        std::sprintf(red_str, "%d", red_dist);
        char blue_str[8];
        std::sprintf(blue_str, "%d", blue_dist);
        char yellow_str[8];
        std::sprintf(yellow_str, "%d", yellow_dist);
        char current_x_str[8];
        std::sprintf(current_x_str, "%.2f", current_x);
        char current_y_str[8];
        std::sprintf(current_y_str, "%.2f", current_y);


        std::strcat(distance_payload, red_str);
        std::strcat(distance_payload, " ");
        std::strcat(distance_payload, blue_str);
        std::strcat(distance_payload, " ");
        std::strcat(distance_payload, yellow_str);
        std::strcat(distance_payload, " ");
        std::strcat(distance_payload, current_x_str);
        std::strcat(distance_payload, " ");
        std::strcat(distance_payload, current_y_str);

        // perform calculation
        MQTTclient.publish("localise",  distance_payload );
        // make the rover wait
        startRoverWait();
        break;
      }

    }
}
 