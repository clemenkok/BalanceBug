#include "Wire.h"
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include "math.h"

#include "imu_processing.hpp"

#define G 10.3 // Based on the measurements taken

Adafruit_MPU6050 mpu;

// Defining Data Types and variables for the different readings ///////////////////////////////////
data_reading_t gyroscopeRawData;
data_reading_t accelerometerRawData;

angle_t position;

//float linear_velocity = 0;

/////////////////////////////////////////////////////////////////////////////////////////

// Define variables for complementary filter 

float alpha = 0.25;
float beta = 0.25;

///////////////////////////////////////////////////////////////////////////////////////


// READ RAW DATA FROM THE GYROSCOPE AND ACCEL /////////////////

void readRawImu()
{
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  accelerometerRawData.x = a.acceleration.x;
  accelerometerRawData.y = a.acceleration.y;
  accelerometerRawData.z = a.acceleration.z;

  gyroscopeRawData.x = g.gyro.x;
  gyroscopeRawData.y = g.gyro.y;
  gyroscopeRawData.z = g.gyro.z;

}
////////////////////////////////////////////////////////////////////


// Use the normalized data to find the angles from the acc and gyro
angle_t calculateAccelerometerAngles()
{
  angle_t accelerometerAngle;

  accelerometerAngle.x = atan(accelerometerRawData.y / sqrt(sq(accelerometerRawData.x) + sq(accelerometerRawData.z)));
  accelerometerAngle.y = atan(-1 * accelerometerRawData.x / sqrt(sq(accelerometerRawData.y) + sq(accelerometerRawData.z)));
  //accelerometerAngle.z = atan2(accelerometerAngle.y, accelerometerAngle.x);
  accelerometerAngle.z = 0; //not used

  return accelerometerAngle;
}

angle_t calculateGyroscopeAngles(unsigned long sampleMicros)
{
  angle_t gyroscopeAngle;

  gyroscopeAngle.x = gyroscopeRawData.x * sampleMicros / 1000000;
  gyroscopeAngle.y = gyroscopeRawData.y * sampleMicros / 1000000;
  gyroscopeAngle.z = gyroscopeRawData.z * sampleMicros / 1000000;

  return gyroscopeAngle;
}

////////////////////////////////////////////////////////////////////


float drift = 0;
// Calculate Pitch and Roll angles using Complementary Filter
void detectPitch(angle_t gyroscopeAngleVar, angle_t accelerometerAngleVar)
{

  //show my fucking drift
  Serial.print("fromGyroscope:");
  Serial.print(drift);
  Serial.print(" ");
  Serial.print("fromAccel:");
  Serial.print(degrees(accelerometerAngleVar.x));
  Serial.print(" ");
  drift = (drift + degrees(gyroscopeAngleVar.x));//(1-alpha) * (position.x + degrees(gyroscopeAngleVar.x))+ alpha * degrees(accelerometerAngleVar.x);


  //normal
  // Serial.print("fromGyroscope:");
  // Serial.print(position.x);
  // Serial.print(" ");
  // Serial.print("fromAccel:");
  // Serial.print(degrees(accelerometerAngleVar.x));
  // Serial.print(" ");
  position.x = (1-alpha) * (position.x + degrees(gyroscopeAngleVar.x))+ alpha * degrees(accelerometerAngleVar.x);
  Serial.print("CompFiltered:");
  Serial.println(position.x);

}
double getPitch()
{
  return position.x;
}

void detectRoll(angle_t gyroscopeAngleVar, angle_t accelerometerAngleVar)
{
  position.y = (1-alpha) * (position.y + degrees(gyroscopeAngleVar.y)) + alpha * degrees(accelerometerAngleVar.y);
}
double getRoll()
{
  return position.y;
}

/*

////////////////////////////////////////////////////////////////////

// To find linear velocity, what we will do is to remove the effect of gravity from each axis

// To remove effect of gravity, we first must split gravity into the 3 components using trigo
// Based on the roll and pitch angles
//https://stackoverflow.com/questions/2986628/accelerometer-gravity-components

// To check if this was correct, it was compared to readings from the accel with no external accel applied

void updateAccelerometerGravityRemoved(){
  accelerometerGravityRemoved.x = accelerometerRawData.x + G*cos(getPitch()*71/4068)*sin(getRoll()*71/4068); // Pitch
  accelerometerGravityRemoved.y = accelerometerRawData.y - G*sin(getPitch()*71/4068); // Roll
  accelerometerGravityRemoved.z = accelerometerRawData.z - G*cos(getPitch()*71/4068)*cos(getRoll()*71/4068); // Yaw
}

// Calculate Linear Velocity assuming the the pitch of accel is the vector facing front of the robot
// and that roll stays constant

void detectLinearAcceleration(unsigned long sampleMicros){
  // Use the accelerator reading with gravity removed in the pitch and yaw axis of the IMU
  //float linearAccel = accelerometerGravityRemoved.z;
  //float linearAccel = accelerometerGravityRemoved.x * cos(getPitch()*71/4068);// - accelerometerGravityRemoved.z * cos((180-getPitch())*71/4068);
  float linearAccel = 0;
  if (accelerometerGravityRemoved.x >= 0 && accelerometerGravityRemoved.z >= 0) 
    linearAccel = sqrt(sq(accelerometerGravityRemoved.x) + sq(accelerometerGravityRemoved.z));
  else
    linearAccel = - sqrt(sq(accelerometerGravityRemoved.x) + sq(accelerometerGravityRemoved.z));
  linear_velocity += linearAccel * G * sampleMicros / 1000000;
  //Serial.println(linear_velocity);
}

*/

float getYawRate(){
  return gyroscopeRawData.z;
}




// Use all of the helper functions above to perform the complementary filtering ////////////////////////

unsigned long lastSampleMicros = 0;

bool updateImuReadings()
{
  // if (isImuReady() == false) {
  //   return false;
  // }
  readRawImu();
  
  unsigned long sampleMicros = (lastSampleMicros > 0) ? micros() - lastSampleMicros : 0;

  lastSampleMicros = micros();

  angle_t accelerometerAngle = calculateAccelerometerAngles();
  angle_t gyroscopeAngle = calculateGyroscopeAngles(sampleMicros);

  detectPitch(gyroscopeAngle, accelerometerAngle);
  detectRoll(gyroscopeAngle, accelerometerAngle);

  //updateAccelerometerGravityRemoved();

  //detectLinearAcceleration(sampleMicros);

  //detectVelocity(raw_acc, getPitch(), 0);

  return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////


void imuSetup() {
  // put your setup code here, to run once:
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


/*
void loop() {
  // put your main code here, to run repeatedly:
  unsigned long currentMillis = millis();

  // Read Raw Data and Perform Complementary Filter
  
  updateImuReadings();
  
  //balancerloop();

  if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT) {
    
    Serial.print("pitch:");
    Serial.println(getPitch());
    Serial.print("roll:");
    Serial.println(getRoll());
    

    //Serial.println("Yaw Rate");
    //Serial.println(getYawRate());
    
    Serial.println("---Accel Readings --------------------");
    Serial.println(accelerometerRawData.x); // Pitch 
    Serial.println(accelerometerRawData.y); // Roll
    Serial.println(accelerometerRawData.z); // Yaw

    Serial.println("---Accel with Gravity Removed----");
    Serial.println(accelerometerGravityRemoved.x); // Pitch
    Serial.println(accelerometerGravityRemoved.y); // Roll
    Serial.println(accelerometerGravityRemoved.z); // Yaw
    
    
    //Serial.println(linear_velocity);
  }
}
*/
