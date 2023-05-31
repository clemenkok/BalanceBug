// -------------------------------------------------
// Copyright (c) 2023 HiBit <https://www.hibit.dev>
// -------------------------------------------------

#include "Wire.h"
#include "I2C.h"
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>


#define INTERVAL_MS_PRINT 200

#define G 9.80665

Adafruit_MPU6050 mpu;


struct gyroscope_raw {
  float x, y, z;
} gyroscope;

struct accelerometer_raw {
  float x, y, z;
} accelerometer;



struct {
  struct {
    float x, y, z;
  } accelerometer, gyroscope;

  float temperature;
} normalized;

struct angle {
  float x, y, z = 0;
};

angle position;

unsigned long lastPrintMillis = 0;
unsigned long lastSampleMicros = 0;

void setup()
{
   Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

  Serial.println("Adafruit MPU6050 test!");

  // Try to initialize!
  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }
  Serial.println("MPU6050 Found!");

  mpu.setAccelerometerRange(MPU6050_RANGE_8_G);
  Serial.print("Accelerometer range set to: ");
  switch (mpu.getAccelerometerRange()) {
  case MPU6050_RANGE_2_G:
    Serial.println("+-2G");
    break;
  case MPU6050_RANGE_4_G:
    Serial.println("+-4G");
    break;
  case MPU6050_RANGE_8_G:
    Serial.println("+-8G");
    break;
  case MPU6050_RANGE_16_G:
    Serial.println("+-16G");
    break;
  }
  mpu.setGyroRange(MPU6050_RANGE_500_DEG);
  Serial.print("Gyro range set to: ");
  switch (mpu.getGyroRange()) {
  case MPU6050_RANGE_250_DEG:
    Serial.println("+- 250 deg/s");
    break;
  case MPU6050_RANGE_500_DEG:
    Serial.println("+- 500 deg/s");
    break;
  case MPU6050_RANGE_1000_DEG:
    Serial.println("+- 1000 deg/s");
    break;
  case MPU6050_RANGE_2000_DEG:
    Serial.println("+- 2000 deg/s");
    break;
  }

  mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);
  Serial.print("Filter bandwidth set to: ");
  switch (mpu.getFilterBandwidth()) {
  case MPU6050_BAND_260_HZ:
    Serial.println("260 Hz");
    break;
  case MPU6050_BAND_184_HZ:
    Serial.println("184 Hz");
    break;
  case MPU6050_BAND_94_HZ:
    Serial.println("94 Hz");
    break;
  case MPU6050_BAND_44_HZ:
    Serial.println("44 Hz");
    break;
  case MPU6050_BAND_21_HZ:
    Serial.println("21 Hz");
    break;
  case MPU6050_BAND_10_HZ:
    Serial.println("10 Hz");
    break;
  case MPU6050_BAND_5_HZ:
    Serial.println("5 Hz");
    break;
  }

  Serial.println("");

delay(1000);
}



float integral=0;
float previousValue = 0.0;

float acc_pitch = 0;
float acc_roll = 0;
float gyro_pitch = 0;
float gyro_roll = 0;


float temp1;
float temp2;

float alpha = 0.05;


void loop()
{
  unsigned long currentMillis = millis();

  readSample();

  if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT) {


    //Serial.print("Pitch:\t");
    //Serial.print(getPitch());
    //Serial.print("\xC2\xB0"); //Print degree symbol
    //Serial.println();
    //Serial.print(" ");

    //Serial.print("Roll:\t");
    //Serial.print(getRoll());
    //Serial.print("\xC2\xB0"); //Print degree symbol
    //Serial.println();


    Serial.print("gyroscope_x:");
    Serial.print(temp1);
    Serial.print(",");
    Serial.print("acc_pitch:");
    Serial.print(acc_pitch);
    Serial.print(",");
    Serial.print("accX:");
    Serial.print(degrees(accelerometer.x));
    Serial.print(",");
    Serial.print("accY:");
    Serial.print(accelerometer.y);
    Serial.print(",");
    Serial.print("pitch:");
    Serial.print(getPitch());
    Serial.print(",");
    Serial.print("getRoll:");
    Serial.println(getRoll());

    float currentValue = gyroscope.x;
    float timeStep = (currentMillis - lastPrintMillis)/1000;
    integral += ((previousValue + currentValue) / 2.0) * timeStep;
    previousValue = currentValue;

    // Serial.print("accX:");
    // Serial.print(accelerometer.x);
    // Serial.print(",");
    // Serial.print("gyX:");
    // Serial.print(gyroscope.x);
    // Serial.print(",");
    // Serial.print("Integration_gyX:");
    // Serial.println(-integral);


    // acc_pitch = atan2(accelerometer.x, sqrt( sq(accelerometer.y) + sq(accelerometer.z)));
    // acc_roll = atan2(accelerometer.y, sqrt(sq(accelerometer.x) + sq(accelerometer.z)));

    // gyro_pitch = gyro_pitch + gyroscope.x * timeStep;
    // gyro_roll = gyro_roll + gyroscope.y * timeStep;

    // Serial.print("acc pitch:");
    // Serial.print(acc_pitch);
    // Serial.print(",");
    // Serial.print("acc roll:");
    // Serial.println(acc_roll);

    // Serial.print("gyro pitch:");
    // Serial.print(gyro_pitch);
    // Serial.print(",");
    // Serial.print("gyro roll:");
    // Serial.println(gyro_roll);



    lastPrintMillis = currentMillis;
  }
}




bool readSample()
{
  // if (isImuReady() == false) {
  //   return false;
  // }

  unsigned long sampleMicros = (lastSampleMicros > 0) ? micros() - lastSampleMicros : 0;

  lastSampleMicros = micros();

  readRawImu();

  normalize(gyroscope);
  normalize(accelerometer);

  angle accelerometer = calculateAccelerometerAngles();
  angle gyroscope = calculateGyroscopeAngles(sampleMicros);

  detectPitch(gyroscope, accelerometer);
  detectRoll(gyroscope, accelerometer);

  return true;
}
