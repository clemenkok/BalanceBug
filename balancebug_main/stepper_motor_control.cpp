#include "stepper_motor_control.hpp"
#include <AccelStepper.h> 
#include <FastAccelStepper.h>

// Define stepper motor connections
#define STEP_PIN1 32 
#define DIR_PIN1 33 
#define STEP_PIN2 25 
#define DIR_PIN2 26

#define STEPS_PER_REV 200

// Create an instance of AccelStepper
AccelStepper stepper1(1, STEP_PIN1, DIR_PIN1);
AccelStepper stepper2(1, STEP_PIN2, DIR_PIN2);
// FastAccelStepperEngine engine1 = FastAccelStepperEngine();
// FastAccelStepperEngine engine2 = FastAccelStepperEngine();
// FastAccelStepper *stepper1 = NULL;
// FastAccelStepper *stepper2 = NULL;

double stepSpeedToAngularVelo(double stepsPerSec){
  // converts steps per sec to radians per sec
  return stepsPerSec / STEPS_PER_REV * 3.1415 * 2; 
}

double angularVeloToStepSpeed(double angularVelo){
  return angularVelo * STEPS_PER_REV / 3.1415 / 2; 
}

void stepperMotorSetup() {
  //Set the maximum speed and acceleration
  stepper1.setMaxSpeed(1001);     // Set the maximum speed in steps per second
  stepper2.setMaxSpeed(1001);     // Set the maximum speed in steps per second
  
  //Set the initial speed
  stepper1.setSpeed(100);         // Set the constant speed in steps per second
  stepper2.setSpeed(-100);         // Set the constant speed in steps per second
  /*
  engine1.init();
  engine2.init();
  stepper1 = engine1.stepperConnectToPin(STEP_PIN1);
  stepper2 = engine2.stepperConnectToPin(STEP_PIN2);
  if (stepper1) {
    stepper1->setDirectionPin(DIR_PIN1);
    stepper1->setEnablePin(1);
    stepper1->setAutoEnable(true);
    stepper1->setSpeedInUs(1000); }
  if (stepper2) {
    stepper2->setDirectionPin(DIR_PIN2);
    stepper2->setEnablePin(1);
    stepper2->setAutoEnable(true);
    stepper2->setSpeedInUs(1000); }

  stepper1->setSpeedInHz(1001); // Set the maximum speed in Hz
  stepper2->setSpeedInHz(1001); // Set the maximum speed in Hz

  //Set the initial speed
  stepper1->setSpeedInHz(100);  // Set the constant speed in Hz
  stepper2->setSpeedInHz(-100); // Set the constant speed in Hz
*/
}

void setMotorSpeedAngularVelo(double angularVelo, int motorNumber){
  if (motorNumber == 1){
    stepper1.setSpeed(angularVeloToStepSpeed(angularVelo));
    //Serial.println(-angularVeloToStepSpeed(angularVelo));
  }
  else if (motorNumber == 2){
    stepper2.setSpeed(-angularVeloToStepSpeed(angularVelo));
    //stepper2->setSpeedInHz(-angularVeloToStepSpeed(angularVelo));
  }
}

void simpleSetSpeed(double angularVelo, int motorNumber){
  if (motorNumber == 1){
    stepper1.setSpeed(angularVelo);
    //Serial.println(-angularVeloToStepSpeed(angularVelo));
  }
  else if (motorNumber == 2){
    stepper2.setSpeed(-angularVelo);
    //stepper2->setSpeedInHz(-angularVeloToStepSpeed(angularVelo));
  }
}

void runstepperMotors(){
  stepper1.run();
  stepper2.run();
  // stepper1->runForward();
  // stepper2->runForward();
}

double getMotorSpeedInSteps(){
  return stepper1.speed();
}

void turningMotors(double angularVelo, int motorNumber){
  if (motorNumber == 1){
      stepper1.setSpeed(0);
      stepper2.setSpeed(0);
      stepper1.setSpeed(angularVelo);
  }
  else if (motorNumber == 2){
      stepper1.setSpeed(0);
      stepper2.setSpeed(0);
      stepper2.setSpeed(angularVelo);
  }
  stepper1.run();
  stepper2.run();
}


/*
void loop() {
  // Move the stepper motor continuously at a constant speed
  stepper1.runSpeed();
  stepper2.runSpeed();
}
*/
