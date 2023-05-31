

void readRawImu()
{
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);


  // // Accelerometer, create 16 bits values from 8 bits data
  // accelerometer.x = g.gyro.x;
  // accelerometer.y = g.gyro.y;
  // accelerometer.z = g.gyro.z;
  
  // // Gyroscope, create 16 bits values from 8 bits data
  // gyroscope.x = a.acceleration.x;
  // gyroscope.y = a.acceleration.y;
  // gyroscope.z = a.acceleration.z;

  accelerometer.x = a.acceleration.x;
  accelerometer.y = a.acceleration.y;
  accelerometer.z = a.acceleration.z;

  gyroscope.x = g.gyro.x;
  gyroscope.y = g.gyro.y;
  gyroscope.z = g.gyro.z;

}
