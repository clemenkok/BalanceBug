#include "controller.hpp"
#include <PID_v1.h>

double rollSetpoint, rollInput, rollOutput;
double veloSetpoint, veloInput, veloOutput;
// input is roll angle
// setpoint is roll angle
// output is motor speed in radians per sec

// setpoint means setpoint
// input is not error. input is the measured output from the plant
// output is what is fed into the plant

double rollKp = 0.53;   // Pitch angle proportional gain
double rollKi = 0.01;   // Pitch angle integral gain
double rollKd = 0;   // Pitch angle derivative gain

double veloKp = 0;
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
PID veloPID(&veloInput, &veloOutput, &veloSetpoint, veloKp, 0, 0, DIRECT);

//const float radius = 0.0337; // radius of wheel for velocity filter value
//const float length = 0.16; // length of robot

void controllerSetup(){
    rollSetpoint = 0;
    veloSetpoint = 0;

    // turn PID ON
    rollPID.SetMode(AUTOMATIC);
    rollPID.SetOutputLimits(-5*2*3.1415, 5*2*3.1415);
    // set output limit to keep within 1000 steps per sec = 5 revolutions per sec
    veloPID.SetMode(AUTOMATIC);
    veloPID.SetOutputLimits(-70, 70);
    // set output limit to keep within a roll angle of 70deg?
}

double computeRollControllerOutput(){
    // the output is motor speed in radians per sec
    rollPID.Compute();
    return rollOutput;
}

void setRollSetpoint(double newSetpoint){
    rollSetpoint = newSetpoint;
}

void updateRollInput(double newInput){
    rollInput = newInput;
}

double computeVeloControllerOutput(){
    veloPID.Compute();
    return veloOutput;
}

void setVeloSetpoint(double newSetpoint){
  veloSetpoint = newSetpoint;
}

void updateVeloInput(double newInput){
  veloInput = newInput;
}

// Low Pass Filter
// https://docs.simplefoc.com/low_pass_filter

LowPassFilter::LowPassFilter(double time_constant, unsigned long current_time)
    : Tf(time_constant)
    , timestamp_prev(current_time)
    , y_prev(0)
    {
      ;
    }

double LowPassFilter::operator() (double input, unsigned long current_time){
  unsigned long timestamp = current_time;
  double dt = (timestamp - timestamp_prev)*0.001;
  // quick fix for strange cases (micros overflow)
  if (dt < 0.0 || dt > 0.5) dt = 0.001;

  // calculate the filtering 
  double alpha = Tf/(Tf + dt);
  double y = alpha*y_prev + (1.0 - alpha)*input;

  // save the variables
  y_prev = y;
  timestamp_prev = timestamp;
  return y;
}
