#include "controller.hpp"
#include <PID_v1.h>

double rollSetpoint, rollInput, rollOutput;
// input is roll angle
// setpoint is roll angle
// output is motor speed in radians per sec

// setpoint means setpoint
// input is not error. input is the measured output from the plant
// output is what is fed into the plant

double rollKp = 0.55;   // Pitch angle proportional gain
double rollKi = 0.01;   // Pitch angle integral gain
double rollKd = 0;   // Pitch angle derivative gain

PID rollPID(&rollInput, &rollOutput, &rollSetpoint, rollKp, rollKi, rollKd, DIRECT);

//const float radius = 0.0337; // radius of wheel for velocity filter value
//const float length = 0.16; // length of robot

void controllerSetup(){
    rollSetpoint = 0;

    // turn PID ON
    rollPID.SetMode(AUTOMATIC);
    rollPID.SetOutputLimits(-5*2*3.1415, 5*2*3.1415);
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
