#ifndef HMC5883LSimple_h
#define HMC5883LSimple_h

QMC5883L compass;

#define DECLINATION 60

void compassSetup();
void compassLoop();

#endif
