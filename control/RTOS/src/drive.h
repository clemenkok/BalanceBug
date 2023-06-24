#ifndef DRIVE_H_
#define DRIVE_H_

#define DECLINATION 60

void calibrate(int& VMax, int& VMin, int sensorPin, int testNo);
void driveSetup();
void driveLoop();
void updatePosition(unsigned long positionElapsedTime);
void spinClockwise();
void stopSpinClockwise();
void collectData();
void driftCorrection();
void updateLocalisation(double new_x, double new_y);

double calculateDistanceBetwCoord(double x1, double y1, double x2, double y2);
double calculateAngleBetwCoord(double x1, double y1, double x2, double y2);

void setRoverStop();
void setRoverCalculateNextCoord();
void updateWaypointBuffer(int index, double wayX, double wayY);



void compassSetup();
int getCompassHeading();
void publishCompassReading();
double calculateDistanceBetwCoord(double x1, double y1, double x2, double y2);
double calculateAngleBetwCoord(double x1, double y1, double x2, double y2);
bool turnBackWallFunction();

#endif