#ifndef ROVER_STATE_CONTROL_H_
#define ROVER_STATE_CONTROL_H_

void roverSetup();
void roverStateLoop(void *parameters);
void startDrive();
void startRoverWait();
void startLocalise();
void printStackSpaceRover();

#endif