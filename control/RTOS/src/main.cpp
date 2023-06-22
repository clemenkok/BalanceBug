#include <Arduino.h>
#include "keepMQTTAlive.h"
#include "uartToDistance.h"
#include "roverStateControl.h"
#include "drive.h"
#include <cstring>

// for MQTT Subscribe
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

extern double current_x, current_y;

// Print messages from subscribed topics
// Include a semaphore to guard against race conditions in the event where multiple tasks
// access the same data
void callback(char *topic, byte *payload, unsigned int length)
{
    // Handle the received message payload
    String receivedPayload = "";
    for (int i = 0; i < length; i++)
    {
        receivedPayload += (char)payload[i];
    }

    /*     // Check if the received payload matches a specific condition
        if (receivedPayload == "1")
        {
            // Call the corresponding function or execute the desired code
            Serial.println("Execute Function");
        } */

    // if first letter of the payload is an A, then we know it is the coord update
    if (receivedPayload[0] == 'A')
    {
        String coordStr = receivedPayload.substring(1);
        String delimiter = ",";
        String x_coord = coordStr.substring(0, coordStr.indexOf(delimiter));
        String y_coord = coordStr.substring(coordStr.indexOf(delimiter) + 1, coordStr.length());
        current_x = x_coord.toDouble();
        current_y = y_coord.toDouble();
        Serial.println(current_x);
        Serial.println(current_y);
        // have to add a function
        updateLocalisation(current_x, current_y);
    }
    /*
     // if first letter of the payload is a B, then we know that we have to break out of the loop
    if (receivedPayload[0] == 'B')
    {
        // TODO: Response
        setRoverStop();
    }

     // if first letter of the payload is a C, then we know it is the new undiscovered coord
    if (receivedPayload[0] == 'C')
    {
        String coordStr = receivedPayload.substring(1);
        String delimiter = ",";
        String index_string = coordStr.substring(0, coordStr.indexOf(delimiter));
        String new_x_string = coordStr.substring(coordStr.indexOf(delimiter) + 1, coordStr.indexOf(delimiter) + 2);
        String new_y_string = coordStr.substring(coordStr.indexOf(delimiter) + 2, coordStr.length());
        double index = index_string.toDouble();
        double new_x = new_x_string.toDouble();
        double new_y = new_y_string.toDouble();
        Serial.println(new_x);
        Serial.println(new_y);
        updateWaypointBuffer(index, new_x, new_y);
        
        // have to add a function
    }

    if (receivedPayload[0] == 'D')
    {
        // TODO: Add a function
        setRoverCalculateNextCoord();
    }
    */
}

void setup()
{

    // Setup function for Rover Control Task
    roverSetup();

    Serial.begin(115200);

    connectionSetup();
    compassSetup();
    driveSetup();

    MQTTclient.setCallback(callback);
    /*
         // task to connect to, and periodically check on MQTT/Wi-Fi
        xTaskCreatePinnedToCore(        // This pins the task to a fixed core
            keepMQTTAlive,              // Function to be called
            "Keep MQTT Alive",          // Name of task * for debugging *
            20000,                       // Stack size (bytes)
            NULL,                       // Parameter Passed
            4,                          // Priority
            NULL,                       // Task handle
            CONFIG_ARDUINO_RUNNING_CORE // Fix to running core
        );

        // Beacon UART to distance
        xTaskCreatePinnedToCore(
            roverStateLoop,
            "Rover Control",
            20000,
            NULL,
            5,
            NULL,
            CONFIG_ARDUINO_RUNNING_CORE);   */
}

void loop()
{
    MQTTclient.loop();
    // publishCompassReading();

    roverStateLoop();
}