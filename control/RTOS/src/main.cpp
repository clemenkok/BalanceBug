#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>

// configs
#define WIFI_NETWORK "myhotspot"
#define WIFI_PASSWORD "racemicracemate"
#define MQTT_USERNAME "BalanceBug"
#define MQTT_PASSWORD "123"

const char *MQTT_SERVER = "44.201.248.191";
uint16_t MQTT_PORT = 1883;

WiFiClient wifiClient;
PubSubClient MQTTclient(MQTT_SERVER, MQTT_PORT, wifiClient);

SemaphoreHandle_t sema_keepMQTTAlive;

void connectToMQTT()
{

  // create clientID
  String clientID = "ESP32Client-";
  clientID += String(random(0xffff), HEX);
  while (!MQTTclient.connected())
  {
    MQTTclient.connect(clientID.c_str(), MQTT_USERNAME, MQTT_PASSWORD);
    Serial.println("connecting to MQTT");
    vTaskDelay(250 / portTICK_PERIOD_MS); // task runs approx every 250 mS
  }
  Serial.println("MQTT Connected");
}

// function to help with debugging Wifi
void WiFiEvent(WiFiEvent_t event)
{
  switch (event)
  {
  case SYSTEM_EVENT_STA_CONNECTED:
    Serial.println("Connected to access point");
    break;
  case SYSTEM_EVENT_STA_DISCONNECTED:
    Serial.println("Disconnected from WiFi access point");
    break;
  case SYSTEM_EVENT_AP_STADISCONNECTED:
    Serial.println("WiFi client disconnected");
    break;
  default:
    break;
  }
}

void connectToWiFi()
{
  Serial.println("connect to wifi");
  while (WiFi.status() != WL_CONNECTED)
  {
    WiFi.disconnect();
    WiFi.begin(WIFI_NETWORK, WIFI_PASSWORD);
    log_i(" waiting on wifi connection");
    vTaskDelay(4000 / portTICK_PERIOD_MS);
  }
  Serial.println("Connected to WiFi");
  WiFi.onEvent(WiFiEvent);
}

// connect to and keep MQTT connection alive
void keepMQTTAlive(void *parameters)
{
  // setting must be set before a mqtt connection is made
  MQTTclient.setKeepAlive(90); // setting keep alive to 90 seconds makes for a very reliable connection, must be set before the 1st connection is made.
  for (;;)
  {
    // check for a is-connected and if the WiFi 'thinks' its connected, found checking on both is more realible than just a single check
    if ((wifiClient.connected()) && (WiFi.status() == WL_CONNECTED))
    {
      xSemaphoreTake(sema_keepMQTTAlive, portMAX_DELAY); // whiles MQTTlient.loop() is running no other mqtt operations should be in process
      MQTTclient.loop();
      xSemaphoreGive(sema_keepMQTTAlive);
    }
    else
    {
      log_i("MQTT keep alive found MQTT status %s WiFi status %s", String(wifiClient.connected()), String(WiFi.status()));
      if (!(WiFi.status() == WL_CONNECTED))
      {
        connectToWiFi();
      }
      connectToMQTT();
    }
    vTaskDelay(250 / portTICK_PERIOD_MS); // task runs approx every 250 ms
  }
  vTaskDelete(NULL);
}

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
    xSemaphoreTake(sema_keepMQTTAlive, portMAX_DELAY);
    if (MQTTclient.connected())
    {
      MQTTclient.publish(topicDistance, String(distance).c_str());
      vTaskDelay(2 / portTICK_PERIOD_MS); // give MQTT Broker time to receive and process msg
    }
    xSemaphoreGive(sema_keepMQTTAlive); // return Semaphore to keepMQTTAlive
    vTaskDelay(1000 * 15 / portTICK_PERIOD_MS); // adjust delay based off how often we want to send data
  }

  vTaskDelete(NULL); // TODO: Identify why we have to delete Task
}

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);

  // Keep Alive can mess with MQTT Publish, thus requiring us to use a semaphore.
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
  xTaskCreatePinnedToCore(
      publishDeadreckoningData,
      "Publish Deadreckoning Data",
      5000,
      NULL,
      4,
      NULL,
      CONFIG_ARDUINO_RUNNING_CORE
  );

  // TODO: Research about Symmetric Multiprocessing and how we can use 1 core to do control, permanently
}

void loop()
{
  // put your main code here, to run repeatedly:
}
