#ifndef STEPPER_MOTOR_CONTROL_HPP_
#define STEPPER_MOTOR_CONTROL_HPP_

double stepSpeedToAngularVelo(double stepsPerSec);
double angularVeloToStepSpeed(double angularVelo);
void stepperMotorSetup();
void runstepperMotors();
void setMotorSpeedAngularVelo(double angularVelo, int motorNumber);
double getMotorSpeedInSteps();

#endif
