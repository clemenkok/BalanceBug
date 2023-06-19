#include <Arduino.h>
#include "keepMQTTAlive.h"
#include "uartToDistance.h"
#include "roverStateControl.h"
#include "drive.h"

// for MQTT Subscribe
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

extern SemaphoreHandle_t mutex_v;
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

    /*
    // Check if the received payload matches a specific condition
    if (receivedPayload == "1")
    {
        // Call the corresponding function or execute the desired code
        Serial.println("Execute Function");
    }
    */
   
    // if first letter of the payload is an A, then we know it is the coord update
    if (receivedPayload[0] == 'A'){
        String coordStr = receivedPayload.substring(1);
        String delimiter = ",";
        String x_coord = coordStr.substring(0, coordStr.indexOf(delimiter));
        String y_coord = coordStr.substring(coordStr.indexOf(delimiter)+1, coordStr.length());
        current_x = x_coord.toDouble();
        current_y = y_coord.toDouble();
        Serial.println(current_x);
        Serial.println(current_y);
        // have to add a function
        updateLocalisation(current_x, current_y);
    }


}

void setup()
{

    // Setup function for Rover Control Task
    roverSetup();
    
    Serial.begin(115200);

    // Keep Alive can mess with MQTT Publish, requiring us to use a semaphore.
    mutex_v = xSemaphoreCreateMutex();
    // xSemaphoreGive(mutex_v); - This makes...no sense.

    MQTTclient.setCallback(callback);

    /* // task to connect to, and periodically check on MQTT/Wi-Fi
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
        CONFIG_ARDUINO_RUNNING_CORE);  */
}

void loop()
{
}