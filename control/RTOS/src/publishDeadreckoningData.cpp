#include <Arduino.h>
#include "publishDeadreckoningData.h"

void publishDeadreckoningData(void *parameters)
{
  // await MQTT Connection
  while (!MQTTclient.connected())
  {
    vTaskDelay(250 / portTICK_PERIOD_MS);
  }

  for (;;)
  {
    const char *topicDistance = "deadreckoning_data";
    double distance = 4.0; // dummy data, to replace with sensor 
    xSemaphoreTake(sema_keepMQTTAlive, portMAX_DELAY); // take semaphore from keepMQTTAlive to prevent conflicts
    if (MQTTclient.connected())
    {
       // Here, we implement a blocking function to identify if subscribing has interfered with it
       // it hasn't, but subscribe prints are delayed very slightly 
      // Serial.println("Printing");
      // delay(1000); 
      // MQTTclient.publish(topicDistance, String(distance).c_str());
      // why does removing this vTaskDelay make a difference?
      vTaskDelay(2 / portTICK_PERIOD_MS); // give MQTT Broker time to receive and process msg
    }
    xSemaphoreGive(sema_keepMQTTAlive); // return Semaphore to keepMQTTAlive
    vTaskDelay(250 / portTICK_PERIOD_MS); // adjust delay based off how often we want to send data. Here we wait 1s before restarting the inf loop.
    // Works: 250, 500, 1000
  }

  vTaskDelete(NULL); // Delete task after end of infinite loop
}
