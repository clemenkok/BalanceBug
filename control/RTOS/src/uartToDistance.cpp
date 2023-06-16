#include "uartToDistance.h"
#include <HardwareSerial.h>

#define BAUDRATE 115200
#define RX_PIN 3
#define TX_PIN 1
HardwareSerial SerialPort(2);

// String msg_buf;
unsigned char myBuffer[12];

enum State
{
  WAITING,
  LOOKING_FOR_1ST_BALL,
  LOOKING_FOR_2ND_BALL,
  LOOKING_FOR_3RD_BALL,
  SEND_DISTANCES
};

State currentState = WAITING;
bool change_state = true;
int distance = 0;
int red_dist;
int blue_dist;
int yellow_dist;

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

void uartToDistanceLoop(void *parameters)
{
  for (;;)
  { // Serial.println("function is running");
    if (SerialPort.available() > 0)
    {
      // The serial data comes in one byte at a time
      // Read 4 bytes at the same time

      SerialPort.readBytes(myBuffer, 12);

      long pixel_box_height = getBoxHeightInPixels(myBuffer);
      long pixel_center_x = getPixelCenterX(myBuffer);

      if (currentState != WAITING && currentState != SEND_DISTANCES)
      {
        if (takeReading(pixel_center_x, pixel_box_height))
        {
          distance = convertDistanceCm(pixel_box_height);
          // move the state machine forward
          change_state = true;
        }
      }
      Serial.println(currentState);

      switch (currentState)
      {
      case WAITING:
        if (change_state)
        {
          change_state = false;
          // Transition to the next state based on some condition or event
          currentState = LOOKING_FOR_1ST_BALL;
          // Turn on light for the first ball
          MQTTclient.publish("red_beacon", "ON");
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
        }
        break;

      case SEND_DISTANCES:
        currentState = WAITING;
        // perform calculation
        // MQTTclient.publish("esp/localise", red_dist, blue_dist, yellow_dist);
        break;
      }
    }
    vTaskDelay(250 / portTICK_PERIOD_MS); // prevent interfering with watchdog counter
  }
  vTaskDelete(NULL);
}
 