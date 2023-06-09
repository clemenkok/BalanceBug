/*
ESP Blue
35	A5
32	A4
33	A3
25	A2
*/

#include <AccelStepper.h>

// Define stepper motor connections
#define STEP_PIN1 26 
#define DIR_PIN1 32 
#define STEP_PIN2 33 
#define DIR_PIN2 25

// Create an instance of AccelStepper
AccelStepper stepper1(1, STEP_PIN1, DIR_PIN1);
AccelStepper stepper2(1, STEP_PIN2, DIR_PIN2);

void setup() {
  // Set the maximum speed and acceleration
  stepper1.setMaxSpeed(1000);     // Set the maximum speed in steps per second
  stepper1.setAcceleration(500);  // Set the acceleration in steps per second per second

  stepper2.setMaxSpeed(1000);     // Set the maximum speed in steps per second
  stepper2.setAcceleration(500);  // Set the acceleration in steps per second per second
  
  // Set the initial speed
  stepper1.setSpeed(100);         // Set the constant speed in steps per second
  stepper2.setSpeed(100);         // Set the constant speed in steps per second
}

void loop() {
  // Move the stepper motor continuously at a constant speed
  stepper1.runSpeed();
  stepper2.runSpeed();


}
