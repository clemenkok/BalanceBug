#include <Arduino.h>
#include "keepMQTTAlive.h"
#include "publishDeadreckoningData.h"
#include "uartToDistance.h"

// SemaphoreHandle_t messageSemaphore;

// for MQTT Subscribe
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

extern current_x, current_y;

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
    if (receivedPayload[0] == "A"){
        String coordStr = receivedPayload.substr(1);
        String delimiter = ",";
        String x_coord = coordStr.substr(0, coordStr.find(delimiter));
        String y_coord = coordStr.substr(coordStr.find(delimiter));

        current_x = std::stod(x_coord);
        current_y = std::stod(y_coord);
    }


}

void setup()
{

    // Setup function for UART to Distance
    uartToDistanceSetup();

    Serial.begin(115200);

    // Keep Alive can mess with MQTT Publish, requiring us to use a semaphore.
    sema_keepMQTTAlive = xSemaphoreCreateBinary();
    xSemaphoreGive(sema_keepMQTTAlive);

    MQTTclient.setCallback(callback);

    // task to connect to, and periodically check on MQTT/Wi-Fi
    xTaskCreatePinnedToCore(        // This pins the task to a fixed core
        keepMQTTAlive,              // Function to be called
        "Keep MQTT Alive",          // Name of task * for debugging *
        5000,                       // Stack size (bytes)
        NULL,                       // Parameter Passed
        3,                          // Priority
        NULL,                       // Task handle
        CONFIG_ARDUINO_RUNNING_CORE // Fix to running core
    );

    // task to obtain data from sensors, and publish to MQTT topic
    xTaskCreatePinnedToCore(
        publishDeadreckoningData,
        "Publish Deadreckoning Data",
        5000,
        NULL,
        4,
        NULL,
        CONFIG_ARDUINO_RUNNING_CORE);

    // Beacon UART to distance
    xTaskCreatePinnedToCore(
        uartToDistanceLoop,
        "Beacon UART to Distance",
        20000,
        NULL,
        5,
        NULL,
        CONFIG_ARDUINO_RUNNING_CORE);
}

void loop()
{
}