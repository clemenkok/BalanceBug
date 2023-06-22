#include "roverStateControl.h"
#include "uartToDistance.h"
#include "drive.h"

bool test_without_localisation = false;

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
    if (!test_without_localisation)
    {
        roverCurrState = LOCALISE;
        setStartLocalisationTrue();
        // flush the uart serial port
        Serial.println("Before Serial Flush");
        SerialPort.flush();
        Serial.println("After Serial Flush");
    }
    else
    {
        stopSpinClockwise();
        roverCurrState = DRIVE;
        driftCorrect = true;
    }
}

void roverSetup()
{
    uartToDistanceSetup();
}

void roverStateLoop()
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
        //MQTTclient.loop();
        break;

    default:
        break;
    }
}
