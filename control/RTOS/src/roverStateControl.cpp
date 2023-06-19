#include "roverStateControl.h"
#include "uartToDistance.h"
#include "drive.h"
#include <esp_task_wdt.h>

enum RoverState
{
    DRIVE,
    LOCALISE,
    ROVERWAIT
};

RoverState roverCurrState = LOCALISE;

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
    roverCurrState = LOCALISE;
    setStartLocalisationTrue();
}

void roverSetup()
{
    uartToDistanceSetup();
    driveSetup();
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
        // printStackSpaceRover();
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

        /* if (MQTTclient.connected())
        {
            bool set = true;
            if (set)
            {
                MQTTclient.publish("deadreckoning_data", "0.57, -0.01, 358.28, 1, 0");
                MQTTclient.publish("deadreckoning_data", "1.14, -0.03, 356.61, 1, 0");
                MQTTclient.publish("deadreckoning_data", "1.71, -0.08, 355.01, 1, 0");
                MQTTclient.publish("deadreckoning_data", "2.28, -0.13, 353.72, 1, 0");
                MQTTclient.publish("deadreckoning_data", "2.80, -0.20, 352.49, 1, 0");
                MQTTclient.publish("deadreckoning_data", "3.36, -0.28, 351.42, 1, 0");
                MQTTclient.publish("deadreckoning_data", "3.88, -0.36, 350.64, 1, 0");
                MQTTclient.publish("deadreckoning_data", "4.44, -0.45, 350.06, 1, 0");
                MQTTclient.publish("deadreckoning_data", "5.00, -0.55, 349.70, 1, 0");
                MQTTclient.publish("deadreckoning_data", "5.51, -0.65, 349.50, 1, 0");
                MQTTclient.publish("deadreckoning_data", "6.08, -0.75, 349.50, 1, 0");
                MQTTclient.publish("deadreckoning_data", "6.59, -0.85, 349.71, 1, 0");
                MQTTclient.publish("deadreckoning_data", "7.15, -0.95, 350.08, 1, 0");
                MQTTclient.publish("deadreckoning_data", "7.72, -1.04, 350.63, 1, 0");
                MQTTclient.publish("deadreckoning_data", "8.23, -1.13, 351.20, 1, 0");
                MQTTclient.publish("deadreckoning_data", "8.80, -1.21, 351.86, 1, 0");
                MQTTclient.publish("deadreckoning_data", "9.36, -1.29, 352.57, 1, 0");
                MQTTclient.publish("deadreckoning_data", "9.93, -1.36, 353.28, 1, 0");
                MQTTclient.publish("deadreckoning_data", "10.45, -1.41, 354.12, 1, 0");
                MQTTclient.publish("deadreckoning_data", "11.02, -1.47, 354.98, 1, 0");
                MQTTclient.publish("deadreckoning_data", "11.54, -1.51, 355.76, 1, 0");
                MQTTclient.publish("deadreckoning_data", "12.10, -1.55, 356.62, 1, 0");
                MQTTclient.publish("deadreckoning_data", "12.67, -1.58, 357.48, 1, 0");
                MQTTclient.publish("deadreckoning_data", "13.24, -1.60, 358.27, 1, 0");
                MQTTclient.publish("deadreckoning_data", "13.76, -1.61, 359.13, 1, 0");
                MQTTclient.publish("deadreckoning_data", "14.33, -1.61, 359.94, 1, 0");
                MQTTclient.publish("deadreckoning_data", "14.91, -1.61, 0.72, 1, 0");
                MQTTclient.publish("deadreckoning_data", "15.43, -1.60, 1.44, 1, 0");
                MQTTclient.publish("deadreckoning_data", "16.00, -1.58, 2.15, 1, 0");
                MQTTclient.publish("deadreckoning_data", "16.57, -1.56, 2.82, 1, 0");
                set = false;
            }
        } */

        vTaskDelay(250 / portTICK_PERIOD_MS); // prevent interfering with watchdog counter
    }
    vTaskDelete(NULL);
}
