#include "roverStateControl.h"
#include "uartToDistance.h"
#include "drive.h"

enum RoverState{
    DRIVE,
    LOCALISE,
    ROVERWAIT
};

RoverState roverCurrState = DRIVE;

bool end_localisation = false;
bool end_drive = false;

void startDrive(){
    roverCurrState = DRIVE;
}
void startRoverWait(){
    roverCurrState = ROVERWAIT;
}

void startLocalise(){
    roverCurrState = LOCALISE;
    setStartLocalisationTrue()
}

void roverSetup(){
    uartToDistanceSetup();
    driveSetup();
}

void roverStateLoop(void *parameters)
{
  for (;;){
    switch (roverCurrState){
        case DRIVE:
            driveLoop();
            break;
        
        case LOCALISE:
            uartToDistanceLoop();
            break;

        case ROVERWAIT:
            break;

        default:
            break;
    }

    vTaskDelay(250 / portTICK_PERIOD_MS); // prevent interfering with watchdog counter
  }
  vTaskDelete(NULL);
}
