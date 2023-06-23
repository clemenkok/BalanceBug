#include "controller.hpp"
#include <PID_v1.h>

double rollInput, rollOutput;
double veloInput, veloOutput;
// input is roll angle
// setpoint is roll angle
// output is motor speed in radians per sec

// setpoint means setpoint
// input is not error. input is the measured output from the plant
// output is what is fed into the plant

//set points
//rollSetpoint = -58; //setpoint without battery
//double rollSetpoint = -60.578; //setpoint with battery
double rollSetpoint = 3.9;  // good setpoint at 3.9 with multimeter lol or not idk
double veloSetpoint = 200; //60


// TUNE THIS FIRST
// double rollKp = 37;   // Pitch angle proportional gain 7.5
// double rollKi = 37;   // Pitch angle integral gain 0.82
// double rollKd = 9;   // Pi38h angle derivative gain

double rollKp = 3.0;  // Pitch angle proportional gain 3.0
double rollKi = 1;    // Pitch angle integral gain 1
double rollKd = 0.5;  // Pi38h angle derivative gain 0.5

int RollPIDsampletime = 150;
int velPIDsampletime = 180;

double veloKp = 10;  //1
double veloKi = 0.1;   //0.8
double veloKd = 3.2;  // 500
double accumulatedError = 0;
/*Best Roll Tuning Trials so far
Rate: According to Loop
kp: 0.53;
ki: 0.01;
// this might need more integral term, cannot recover when tipping over too much

Rate: According to Loop (THis one is not as good)
kp: 0.73;
ki: 0.5;

*/

PID rollPID(&rollInput, &rollOutput, &rollSetpoint, rollKp, rollKi, rollKd, DIRECT);
PID veloPID(&veloInput, &veloOutput, &veloSetpoint, veloKp, veloKi, veloKd, DIRECT);

//const float radius = 0.0337; // radius of wheel for velocity filter value
//const float length = 0.16; // length of robot

void controllerSetup() {
  //Determines how often the PID algorithm evaluates
  rollPID.SetSampleTime(RollPIDsampletime);
  veloPID.SetSampleTime(velPIDsampletime);

  // turn PID ON
  rollPID.SetMode(AUTOMATIC);
  //rollPID.SetOutputLimits(-5*2*3.1415, 5*2*3.1415);
  rollPID.SetOutputLimits(-700, 700);
  // set output limit to keep within 1000 steps per sec = 5 revolutions per sec
  veloPID.SetMode(AUTOMATIC);
  veloPID.SetOutputLimits(-4, 4);
  // set output limit to keep within a roll angle of 70deg?
}

double computeRollControllerOutput() {
  // the output is motor speed in radians per sec
  rollPID.Compute();
  return rollOutput;
}


void setRollSetpoint(double newSetpoint) {
  rollSetpoint = newSetpoint;
}

double getRollSetpoint() {
  return rollSetpoint;
}

void updateRollInput(double newInput) {
  rollInput = newInput;
}

double computeVeloControllerOutput() {
  veloPID.Compute();
  return veloOutput;
}

double getError() {
  double error = &rollSetpoint - &rollInput;
  accumulatedError += error;
  return accumulatedError;
}

void setVeloSetpoint(double newSetpoint) {
  veloSetpoint = newSetpoint;
}

void updateVeloInput(double newInput) {
  veloInput = newInput;
}

// Low Pass Filter
// https://docs.simplefoc.com/low_pass_filter

LowPassFilter::LowPassFilter(double time_constant, unsigned long current_time)
  : Tf(time_constant), timestamp_prev(current_time), y_prev(0) {
  ;
}

double LowPassFilter::operator()(double input, unsigned long current_time) {
  unsigned long timestamp = current_time;
  double dt = (timestamp - timestamp_prev) * 0.001;
  // quick fix for strange cases (micros overflow)
  if (dt < 0.0 || dt > 0.5) dt = 0.001;

  // calculate the filtering
  double alpha = Tf / (Tf + dt);
  double y = alpha * y_prev + (1.0 - alpha) * input;

  // save the variables
  y_prev = y;
  timestamp_prev = timestamp;
  return y;
}
