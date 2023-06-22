#ifndef HMC5883LSimple_h
#define HMC5883LSimple_h

#include <QMC5883L.h>

extern QMC5883L compass;


#define DECLINATION 60

void compassSetup();
void compassLoop();

#endif
