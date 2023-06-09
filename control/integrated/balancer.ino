#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_MPU6050.h>

// Constants
const int motorLPin = 1;  // Left motor PWM pin
const int motorRPin = 2;  // Right motor PWM pin
const int angleSensorPin = A0;  // Pitch angle sensor analog pin

// PID Constants
// have to be changed based on mass, length and other params of our actual robot
const float pitchKp = 1347.43260385301;   // Pitch angle proportional gain
const float pitchKi = 8116.84712570619;   // Pitch angle integral gain
const float pitchKd = 25.4046839009897;   // Pitch angle derivative gain
const float velocityKp = 0.00521143498243029;   // Linear velocity proportional gain
const float velocityKi = 0.00225434547288991;   // Linear velocity integral gain
const float velocityKd = 0.00267679521781729;  // Linear velocity derivative gain
const float angularVelocityKp = 0.5;   // Angular velocity proportional gain
const float angularVelocityKi = 0.05;  // Angular velocity integral gain
const float angularVelocityKd = 0.02;  // Angular velocity derivative gain
const float radius = 0.0337; // radius of wheel for velocity filter value
const float length = 0.16; // length of robot

// Filter Constants
const float velocityFilterAlpha = radius/2;  // Velocity filter alpha value
const float angularVelocityConst = radius/length;

// Setpoints
float pitchSetpoint = 0.0;   // Pitch angle setpoint
float velocitySetpoint = 0.1;   // Linear velocity setpoint
float angularVelocitySetpoint = 0.1;  // Angular velocity setpoint

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
float angularVelocityL = 0.0;
float angularVelocityR = 0.0;
float leftMotorVoltage = 0.0;
float rightMotorVoltage = 0.0;
String dir = "";

// Objects
// Adafruit_MPU6050 mpu;

// Function prototypes
void updateSensors();
void updateControl();
void applyMotorVoltages(float leftVoltage, float rightVoltage);

void balancersetup() {
  //Serial.begin(9600);

  // Set motor pins as output
  pinMode(motorLPin, OUTPUT);
  pinMode(motorRPin, OUTPUT);
}

void pitchAngleControlLoop() {
  // Update sensor readings
  updateSensors();

  // Update control loops
  updatePitchControl();

  // Apply motor voltages
  applyMotorVoltages(leftMotorVoltage, rightMotorVoltage);
  delay(10); // freq to be tested and retuned

}

void linearVelocityControlLoop(){
  updateLinearControl();
  delay(20); // freq to be tested and retuned
}

void updateSensors() {
  // Read pitch angle from analog sensor
  int sensorValue = getPitch();
  pitchAngle = map(sensorValue, 0, 1023, -90, 90);  // Map sensor value to pitch angle range

  // get angular velocity
  // probably need to do smth about the turning part (how will i know when it wants to turn)
  // if going straight 
  //dir = getDirection(); //this requires the LDR part, so just put dir as straight for testing 
  // for testing purpose
  dir = "straight";

  if (dir == "straight"){
    angularVelocityL = getStraightAngularVel();
    angularVelocityR = getStraightAngularVel();
    // or maybe just use velocity? idk can test and see if theres a difference?
  }
  else if (dir == "left"){
    angularVelocityR = getTurnAngularVel(abs(getYaw() - lastyaw), millis() - lastPrintMillis);
    angularVelocityL = 0;
  }
  else if (dir == "right"){
    angularVelocityL = getTurnAngularVel(abs(getYaw() - lastyaw), millis() - lastPrintMillis);
    angularVelocityR = 0;
  }
  //for all cases
  angularVelocity = angularVelocityConst * (angularVelocityR - angularVelocityL);
  linearVelocity = angularVelocityL + angularVelocityR;

}

void updatePitchControl() {
  // Pitch angle control (inner loop)
  float pitchError = pitchSetpoint - pitchAngle;
  float pitchErrorDelta = pitchError - lastPitchError;
  pitchErrorSum += pitchError;

  // Calculate pitch angle PID control output
  float pitchOutput = pitchKp * pitchError + pitchKi * pitchErrorSum + pitchKd * pitchErrorDelta;

  // Angular velocity control
  float angularVelocityError = angularVelocitySetpoint - angularVelocity;
  float angularVelocityErrorDelta = angularVelocityError - lastAngularVelocityError;
  angularVelocityErrorSum += angularVelocityError;

  // Calculate angular velocity PID control output
  float angularVelocityOutput = angularVelocityKp * angularVelocityError + angularVelocityKi * angularVelocityErrorSum + angularVelocityKd * angularVelocityErrorDelta;

  // Calculate left and right motor voltages based on the control outputs
  float leftMotorVoltage = pitchOutput - angularVelocityOutput;
  float rightMotorVoltage = pitchOutput + angularVelocityOutput;

  // Store current errors for the next iteration
  lastPitchError = pitchError;
  lastAngularVelocityError = angularVelocityError;
}

void updateLinearControl() {
  // Linear velocity control
  float velocityError = velocitySetpoint - linearVelocity;
  float velocityErrorDelta = velocityError - lastVelocityError;
  velocityErrorSum += velocityError;

  // Calculate linear velocity PID control output
  float velocityOutput = velocityKp * velocityError + velocityKi * velocityErrorSum + velocityKd * velocityErrorDelta;

  lastVelocityError = velocityError;
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
