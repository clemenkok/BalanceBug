

#include <Arduino.h>

// PLEASE NOTE!
// The Arduino IDE is a bit braindead, even though we include Wire.h here, it does nothing
// you must include Wire.h in your main sketch, the Arduino IDE will not include Wire
// in the build process otherwise.
#include <QMC5883L.h>
#include <Wire.h>
#include "compass.h"

eQMC5883L compass;


// my added fucking functions
void compassSetup()
{
  compass.init();
  compass.setSamplingRate(50);
  int heading = compass.readHeading();
  int compassCalibCount = 0;
  while (compassCalibCount < 10000 || heading == 0){
    /* Still calibrating, so measure but don't print */
    Serial.println("calibrating compass");
  }
}
void compassLoop()
{
  int heading = compass.readHeading();
  if (heading == 0)
  {
    /* Still calibrating, so measure but don't print */
    Serial.println("calibrating compass");
  }
  else
  {
    int temp = heading + DECLINATION;
    temp = temp > 360 ? temp - 360 : temp;
    Serial.println(temp);
  }
}