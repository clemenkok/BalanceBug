//https://www.hibit.dev/posts/92/complementary-filter-and-relative-orientation-with-mpu6050

#include <Wire.h>
//#include "I2C.h"
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include "math.h"

#define INTERVAL_MS_PRINT 100

#define G 9.80665

Adafruit_MPU6050 mpu;


struct gyroscope_raw {
  float x, y, z;
} rawGyroRate;

struct accelerometer_raw {
  float x, y, z;
} rawAccData;



struct {
  struct {
    float x, y, z;
  } accData, gyroRate;

  float temperature; //wtf is this?
} normalized;

struct angle {
  float x, y, z;
};

angle position; 

float velocity = 0.0;

unsigned long lastPrintMillis = 0;
unsigned long lastSampleMicros = 0;

void setup()
{
  Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

  balancersetup();

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

int printloopcount = 0;

float integral=0;
float previousValue = 0.0;

float acc_pitch = 0;
float acc_roll = 0;
float gyro_pitch = 0;
float gyro_roll = 0;

float alpha = 0.25; // accelerometer weight (gyro weight = 1-alpha)
float beta = 0.25;

int GYROINTERVAL = 100; // gyroscope 
float turningangularvel = 0.0;
float lastyaw = 0.0;

void loop()
{
  unsigned long currentMillis = millis();

  readRawImu();
  pitchrollfiltering();
  pitchAngleControlLoop();
  linearVelocityControlLoop();

  //if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT) {
  if (currentMillis - lastPrintMillis > GYROINTERVAL) {

    //CHANGE ME IF NEEDED BECAUSE IDK IF ITS GYROSCOPE.Z
    turningangularvel = getTurnAngularVel(abs(getYaw() - lastyaw), millis() - lastPrintMillis);
    lastyaw = getYaw();


    printloopcount ++;

    if(printloopcount >=5) // 5*GYROINTERVAL = 500ms
    {
      printloopcount = 0;
      // Serial.print("gyroscope_x*dt:");
      // Serial.print(temp3);
      // Serial.print(",");
      // Serial.print("acc_pitch:");
      // Serial.print(temp2);
      // Serial.print(",");
      // Serial.print("pitch:");
      // Serial.println(getPitch());

      float currentValue = rawGyroRate.x; // im not too sure about this part
      float timeStep = (currentMillis - lastPrintMillis)/1000;
      integral += ((previousValue + currentValue) / 2.0) * timeStep;
      previousValue = currentValue;

    }

    lastPrintMillis = currentMillis;
  }

}

void readRawImu()
{
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  rawAccData.x = a.acceleration.x;
  rawAccData.y = a.acceleration.y;
  rawAccData.z = a.acceleration.z;

  rawGyroRate.x = g.gyro.x;
  rawGyroRate.y = g.gyro.y;
  rawGyroRate.z = g.gyro.z;

  // gyroscope gives angular velocity measurements so i just named it as rate instead of angle
}


void normalizeGyroData(gyroscope_raw rawGyroRate)
{
  // Sensitivity Scale Factor (MPU datasheet page 8)
  normalized.gyroRate.x = rawGyroRate.x / 32.8;
  normalized.gyroRate.y = rawGyroRate.y / 32.8;
  normalized.gyroRate.z = rawGyroRate.z / 32.8;
}

void normalizeAccData(accelerometer_raw rawAccData)
{
  // Sensitivity Scale Factor (MPU datasheet page 9)
  normalized.accData.x = rawAccData.x * G / 16384;
  normalized.accData.y = rawAccData.y * G / 16384;
  normalized.accData.z = rawAccData.z * G / 16384;
}

angle calculateAccelerometerAngles()
{
  angle accAngle;

  accAngle.x = atan(normalized.accData.y / sqrt(sq(normalized.accData.x) + sq(normalized.accData.z)));
  accAngle.y = atan(-1 * normalized.accData.x / sqrt(sq(normalized.accData.y) + sq(normalized.accData.z)));
  accAngle.z = atan2(accAngle.y, accAngle.x);

  return accAngle;
}

angle calculateGyroscopeAngles(unsigned long sampleMicros)
{
  // integration done here to get gyro angles
  angle gyroAngle;

  gyroAngle.x = normalized.gyroRate.x * sampleMicros / 1000000;
  gyroAngle.y = normalized.gyroRate.y * sampleMicros / 1000000;
  gyroAngle.z = normalized.gyroRate.z * sampleMicros / 1000000;

  return gyroAngle;
}

bool pitchrollfiltering()
{
  unsigned long sampleMicros = (lastSampleMicros > 0) ? micros() - lastSampleMicros : 0;

  lastSampleMicros = micros();

  float raw_acc = rawAccData.x * G; // scaling raw data

  normalizeGyroData(rawGyroRate);
  normalizeAccData(rawAccData);

  angle accAngle = calculateAccelerometerAngles();
  angle gyroAngle = calculateGyroscopeAngles(sampleMicros);

  detectPitch(gyroAngle, accAngle);
  detectRoll(gyroAngle, accAngle);

  detectVelocity(raw_acc, getPitch(), 0);

  return true;
}

void detectPitch(angle gyroAngle, angle accAngle)
{
  position.x = (1-alpha) * (position.x + degrees(gyroAngle.x)) + alpha * degrees(accAngle.x);
  // position.x is just the pitch
}

double getPitch()
{
  return position.x;
}

void detectRoll(angle gyroAngle, angle accAngle)
{
  position.y = (1-alpha) * (position.y + degrees(gyroAngle.y)) + alpha * degrees(accAngle.y);
  // position.y is the roll
}

double getRoll()
{
  return position.y;
}

void detectYaw(angle gyroAngle, angle accAngle)
{
  position.z = (1-alpha) * (position.z + degrees(gyroAngle.z)) + alpha * degrees(accAngle.z);
  // position.z is the yaw
}

double getYaw()
{
  return position.z;
}



void detectVelocity(float raw_acc, double pitch, float motorvel){
  velocity = (1-beta) * (velocity + raw_acc * pitch) + beta * motorvel;
}

float getVelocity(){
  return velocity;
}


float getStraightAngularVel(){
  return velocity /21.2 * 2 * 3.14159265359;
}


float roverWidth = 10; 

float getTurnAngularVel(float deltaYaw, float deltaT){

  // CHNAGE the YAW, might not be correct

  //distance of the wheel travelled:
  //d = 2*pi*roverWidth* DeltaYaw/360
  //angular velocity of the wheel:
  //d / 21.2 * 2 * pi /deltaT

  float d = 2 * 3.14159265359 * roverWidth * deltaYaw /360;
  return d/ 21.2 * 2 * 3.14159265359 / deltaT;

}




