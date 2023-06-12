#ifndef CONTROLLER_HPP_
#define CONTROLLER_HPP_

void controllerSetup();
double computeRollControllerOutput();
void setRollSetpoint(double newSetpoint);
void updateRollInput(double newInput);

#endif