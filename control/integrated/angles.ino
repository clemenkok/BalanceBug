
angle calculateAccelerometerAngles()
{
  angle accelerometer;

  accelerometer.x = atan(normalized.accelerometer.y / sqrt(sq(normalized.accelerometer.x) + sq(normalized.accelerometer.z)));
  accelerometer.y = atan(-1 * normalized.accelerometer.x / sqrt(sq(normalized.accelerometer.y) + sq(normalized.accelerometer.z)));
  accelerometer.z = atan2(accelerometer.y, accelerometer.x);

  return accelerometer;
}

angle calculateGyroscopeAngles(unsigned long sampleMicros)
{
  angle gyroscope;

  gyroscope.x = normalized.gyroscope.x * sampleMicros / 1000000;
  gyroscope.y = normalized.gyroscope.y * sampleMicros / 1000000;
  gyroscope.z = normalized.gyroscope.z * sampleMicros / 1000000;

  return gyroscope;
}

void detectPitch(angle gyroscope, angle accelerometer)
{
  temp1 = degrees(gyroscope.x);
  temp2 = degrees(accelerometer.x);
  temp3 = (position.x + degrees(gyroscope.x));
  position.x = (1-alpha) * (position.x + degrees(gyroscope.x)) + alpha * degrees(accelerometer.x);
}

double getPitch()
{
  return position.x;
}

void detectRoll(angle gyroscope, angle accelerometer)
{
  position.y = 0.98 * (position.y + degrees(gyroscope.y)) + 0.02 * degrees(accelerometer.y);
}

double getRoll()
{
  return position.y;
}


void detectVelocity(float raw_acc, angle pitch, float motorvel){
  velocity = (1-beta) * (velocity + raw_acc * pitch) + beta * motorvel;

  //21.2/200 = 0.106cm = 0.00106m
}

float getVelocity(){
  return velocity;
}


float getSraightAngularVel(float linearvel){

  // angular velocity of the wheel = linearvel / 21.2 * 2 * pi

  return linearvel /21.2 * 2 * 3.14159265359;
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