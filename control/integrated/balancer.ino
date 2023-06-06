#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_LSM6DS33.h>

// Constants
const int motorLPin = ?;  // Left motor PWM pin
const int motorRPin = ?;  // Right motor PWM pin
const int angleSensorPin = ??;  // Pitch angle sensor analog pin

// PID Constants
// have to be changed based on mass, length and other params of our actual robot
const float pitchKp = 2.0;   // Pitch angle proportional gain
const float pitchKi = 0.2;   // Pitch angle integral gain
const float pitchKd = 0.1;   // Pitch angle derivative gain
const float velocityKp = 1.0;   // Linear velocity proportional gain
const float velocityKi = 0.1;   // Linear velocity integral gain
const float velocityKd = 0.05;  // Linear velocity derivative gain
const float angularVelocityKp = 0.5;   // Angular velocity proportional gain
const float angularVelocityKi = 0.05;  // Angular velocity integral gain
const float angularVelocityKd = 0.02;  // Angular velocity derivative gain

// Filter Constants
const float velocityFilterAlpha = 0.2;  // Velocity filter alpha value

// Setpoints
float pitchSetpoint = 0.0;   // Pitch angle setpoint
float velocitySetpoint = 0.0;   // Linear velocity setpoint
float angularVelocitySetpoint = 0.0;  // Angular velocity setpoint

// Variables
float pitchAngle = 0.0;   // Current pitch angle
float linearVelocity = 0.0;   // Current linear velocity
float angularVelocity = 0.0;  // Current angular velocity
float lastPitchError = 0.0;   // Previous pitch angle error
float pitchErrorSum = 0.0;    // Pitch angle error sum
float lastVelocityError = 0.0;   // Previous linear velocity error
float velocityErrorSum = 0.0;    // Linear velocity error sum
float lastAngularVelocityError = 0.0;  // Previous angular velocity error
float angularVelocityErrorSum = 0.0;   // Angular velocity error sum

// Objects
Adafruit_LSM6DS33 lsm6ds33;

// Function prototypes
void updateSensors();
void updateControl();
void applyMotorVoltages(float leftVoltage, float rightVoltage);

void balancersetup() {
  //Serial.begin(9600);
  
  // Initialize LSM6DS33
  if (!lsm6ds33.begin()) {
    Serial.println("Failed to initialize LSM6DS33!");
    while (1);
  }

  // Set motor pins as output
  pinMode(motorLPin, OUTPUT);
  pinMode(motorRPin, OUTPUT);
}

void balancerloop() {
  // Update sensor readings (need to integrate with the comp filter file)
  updateSensors();

  // Update control loops
  updateControl();

  // Apply motor voltages
  applyMotorVoltages(leftMotorVoltage, rightMotorVoltage);


  // velocity
  // getPitch()
  // getRoll()
  // gyroscope.x (raw data)
  // gyroscope.y
  // gyroscope.z

  //test print raw data
  Serial.print("gyroscope.x:");
  Serial.print(gyroscope.x);
}

void updateSensors() {
  // Read pitch angle from analog sensor
  int sensorValue = analogRead(angleSensorPin);
  pitchAngle = map(sensorValue, 0, 1023, -90, 90);  // Map sensor value to pitch angle range

  // Read linear velocity from LSM6DS33 accelerometer
  sensors_event_t accelEvent;
  lsm6ds33.getEvent(&accelEvent);
  linearVelocity = accelEvent.acceleration.x;

  // Read angular velocity from LSM6DS33 gyroscope
  sensors_event_t gyroEvent;
  lsm6ds33.getEvent(&gyroEvent);
  angularVelocity = gyroEvent.gyro.x;
}

void updateControl() {
  // Pitch angle control
  float pitchError = pitchSetpoint - pitchAngle;
  float pitchErrorDelta = pitchError - lastPitchError;
  pitchErrorSum += pitchError;

  // Calculate pitch angle PID control output
  float pitchOutput = pitchKp * pitchError + pitchKi * pitchErrorSum + pitchKd * pitchErrorDelta;
  
  // Linear velocity control
  float velocityError = velocitySetpoint - linearVelocity;
  float velocityErrorDelta = velocityError - lastVelocityError;
  velocityErrorSum += velocityError;

  // Calculate linear velocity PID control output
  float velocityOutput = velocityKp * velocityError + velocityKi * velocityErrorSum + velocityKd * velocityErrorDelta;

  // Angular velocity control
  float angularVelocityError = angularVelocitySetpoint - angularVelocity;
  float angularVelocityErrorDelta = angularVelocityError - lastAngularVelocityError;
  angularVelocityErrorSum += angularVelocityError;

  // Calculate angular velocity PID control output
  float angularVelocityOutput = angularVelocityKp * angularVelocityError + angularVelocityKi * angularVelocityErrorSum + angularVelocityKd * angularVelocityErrorDelta;

  // Calculate left and right motor voltages based on the control outputs
  float leftMotorVoltage = velocityOutput + angularVelocityOutput;
  float rightMotorVoltage = velocityOutput - angularVelocityOutput;

  // Store current errors for the next iteration
  lastPitchError = pitchError;
  lastVelocityError = velocityError;
  lastAngularVelocityError = angularVelocityError;
}

void applyMotorVoltages(float leftVoltage, float rightVoltage) {
  // Apply voltage limits
  leftVoltage = constrain(leftVoltage, -255, 255);
  rightVoltage = constrain(rightVoltage, -255, 255);

  // Apply low-pass filter to linear velocity
  linearVelocity = linearVelocity * (1 - velocityFilterAlpha) + linearVelocity * velocityFilterAlpha;

  // Apply voltages to motors
  analogWrite(motorLPin, abs(leftVoltage));
  analogWrite(motorRPin, abs(rightVoltage));

  // Set motor directions
  if (leftVoltage > 0) {
    digitalWrite(motorLPin + 1, HIGH);
  } else {
    digitalWrite(motorLPin + 1, LOW);
  }

  if (rightVoltage > 0) {
    digitalWrite(motorRPin + 1, HIGH);
  } else {
    digitalWrite(motorRPin + 1, LOW);
  }
}
