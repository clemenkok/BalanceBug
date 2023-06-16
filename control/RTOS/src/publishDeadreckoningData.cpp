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
      MQTTclient.publish(topicDistance, String(distance).c_str());
      vTaskDelay(2 / portTICK_PERIOD_MS); // give MQTT Broker time to receive and process msg
    }
    xSemaphoreGive(sema_keepMQTTAlive); // return Semaphore to keepMQTTAlive
    vTaskDelay(1000 / portTICK_PERIOD_MS); // adjust delay based off how often we want to send data. Here we wait 1s before restarting the inf loop.
  }

  vTaskDelete(NULL); // Delete task after end of infinite loop
}
