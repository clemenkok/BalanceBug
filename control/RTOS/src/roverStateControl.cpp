#include "roverStateControl.h"
#include "uartToDistance.h"
#include "drive.h"
#include <esp_task_wdt.h>

bool test_without_localisation = true;

enum RoverState
{
    DRIVE,
    LOCALISE,
    ROVERWAIT
};

RoverState roverCurrState = DRIVE;

bool end_localisation = false;
bool end_drive = false;

void startDrive()
{
    roverCurrState = DRIVE;
}
void startRoverWait()
{
    roverCurrState = ROVERWAIT;
}

void startLocalise()
{
    if (!test_without_localisation){
        roverCurrState = LOCALISE;
        setStartLocalisationTrue();
        // flush the uart serial port
        Serial.println("Before Serial Flush");
        SerialPort.flush();
        Serial.println("After Serial Flush");
    }else{
        stopSpinClockwise();
        roverCurrState = DRIVE;
        driftCorrect = true;
    }
}

void roverSetup()
{
    uartToDistanceSetup();
}

// print out remaining stack space
void printStackSpaceRover()
{
    UBaseType_t freeStack = uxTaskGetStackHighWaterMark(NULL) * sizeof(StackType_t);
    Serial.print("Free Stack Space (roverStateControl): ");
    Serial.print(freeStack);
    Serial.println(" bytes");
}

void roverStateLoop(void *parameters)
{
    for (;;)
    {
        switch (roverCurrState)
        {
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

        vTaskDelay(5 / portTICK_PERIOD_MS);
    }
    vTaskDelete(NULL);
}
