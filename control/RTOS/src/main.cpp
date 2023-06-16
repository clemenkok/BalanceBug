#include <Arduino.h>
#include "keepMQTTAlive.h"
#include "publishDeadreckoningData.h"
#include "uartToDistance.h"

void setup()
{

  // Setup function for UART to Distance
  uartToDistanceSetup();
  // Serial.begin(115200);

  // Keep Alive can mess with MQTT Publish, requiring us to use a semaphore.
  sema_keepMQTTAlive = xSemaphoreCreateBinary();
  xSemaphoreGive(sema_keepMQTTAlive);

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
  // NOTE: Tasks within the same "state" should not be in separate tasks
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