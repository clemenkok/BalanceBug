#include "roverStateControl.h"
#include "uartToDistance.h"
#include "drive.h"
#include <esp_task_wdt.h>

enum RoverState{
    DRIVE,
    LOCALISE,
    ROVERWAIT
};

RoverState roverCurrState = LOCALISE;

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
    setStartLocalisationTrue();
}

void roverSetup(){
    uartToDistanceSetup();
    driveSetup();
}

// print out remaining stack space
void printStackSpaceRover() {
  UBaseType_t freeStack = uxTaskGetStackHighWaterMark(NULL) * sizeof(StackType_t);
  Serial.print("Free Stack Space (roverStateControl): ");
  Serial.print(freeStack);
  Serial.println(" bytes");
}

void roverStateLoop(void *parameters)
{
  for (;;){
    // printStackSpaceRover();
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
