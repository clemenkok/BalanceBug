#ifndef IMU_PROCESSING_HPP_
#define IMU_PROCESSING_HPP_

typedef struct 
{
    double x;
    double y;
    double z;
} data_reading_t;

typedef struct
{
    double x = 0;
    double y = 0;
    double z = 0;
} angle_t;

void readRawImu();
angle_t calculateAccelerometerAngles();
angle_t calculateGyroscopeAngles(unsigned long sampleMicros);
void detectPitch(angle_t gyroscopeAngleVar, angle_t accelerometerAngleVar);
double getPitch();
void detectRoll(angle_t gyroscopeAngleVar, angle_t accelerometerAngleVar);
double getRoll();
float getYawRate();
bool updateImuReadings();
void imuSetup();

#endif