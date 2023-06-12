#include "stepper_motor_control.hpp"
#include <AccelStepper.h> 

// Define stepper motor connections
#define STEP_PIN1 26 
#define DIR_PIN1 32 
#define STEP_PIN2 33 
#define DIR_PIN2 25

#define STEPS_PER_REV 200

// Create an instance of AccelStepper
AccelStepper stepper1(1, STEP_PIN1, DIR_PIN1);
AccelStepper stepper2(1, STEP_PIN2, DIR_PIN2);

double stepSpeedToAngularVelo(double stepsPerSec){
  // converts steps per sec to radians per sec
  return stepsPerSec / STEPS_PER_REV * 3.1415 * 2; 
}

double angularVeloToStepSpeed(double angularVelo){
  return angularVelo * STEPS_PER_REV / 3.1415 / 2; 
}

void stepperMotorSetup() {
  // Set the maximum speed and acceleration
  stepper1.setMaxSpeed(1001);     // Set the maximum speed in steps per second
  stepper2.setMaxSpeed(1001);     // Set the maximum speed in steps per second
  
  // Set the initial speed
  stepper1.setSpeed(50);         // Set the constant speed in steps per second
  stepper2.setSpeed(-50);         // Set the constant speed in steps per second
}

void setMotorSpeedAngularVelo(double angularVelo, int motorNumber){
  if (motorNumber == 1){
    stepper1.setSpeed(angularVeloToStepSpeed(angularVelo));
  }
  else if (motorNumber == 2){
    stepper2.setSpeed(-angularVeloToStepSpeed(angularVelo));
  }
}

void runstepperMotors(){
  stepper1.run();
  stepper2.run();
}

double getMotorSpeedInSteps(){
  return stepper1.speed();
}

/*
void loop() {
  // Move the stepper motor continuously at a constant speed
  stepper1.runSpeed();
  stepper2.runSpeed();
}
*/
