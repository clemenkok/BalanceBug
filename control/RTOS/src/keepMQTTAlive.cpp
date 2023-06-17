#include <Arduino.h>
#include <PubSubClient.h>
#include <WiFi.h>

// semaphore declaration to prevent conflicts
SemaphoreHandle_t sema_keepMQTTAlive;

// configs
#define WIFI_NETWORK "myhotspot"
#define WIFI_PASSWORD "racemicracemate"
#define MQTT_USERNAME "BalanceBug"
#define MQTT_PASSWORD "123"

const char *MQTT_SERVER = "35.173.232.18";
uint16_t MQTT_PORT = 1883;

WiFiClient wifiClient;
PubSubClient MQTTclient(MQTT_SERVER, MQTT_PORT, wifiClient);

// function to connect to MQTT Broker
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

  // SUBSCRIBED TOPICS GO HERE (JUST COPY AND PASTE BELOW)
  MQTTclient.subscribe("rover_current_coords"); // added subscribe upon connection. TO EXECUTE FN: go to callback

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

// function to connect to wifi AP
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

// task that connects to and keeps MQTT connection alive through intermittent checks
void keepMQTTAlive(void *parameters)
{
  // setting must be set before a MQTT connection is made
  MQTTclient.setKeepAlive(90); // setting keep alive to 90 seconds makes for a very reliable connection, must be set before the 1st connection is made.
  for (;;)
  {
    // check for a is-connected and if the WiFi 'thinks' its connected, found checking on both is more realible than just a single check
    if ((wifiClient.connected()) && (WiFi.status() == WL_CONNECTED))
    {
      MQTTclient.loop();
    }
    else
    {
      log_i("MQTT keep alive found MQTT status %s WiFi status %s", String(wifiClient.connected()), String(WiFi.status()));
      if (!(WiFi.status() == WL_CONNECTED))
      {
        xSemaphoreTake(sema_keepMQTTAlive, portMAX_DELAY); // while MQTTclient.loop() is running no other mqtt operations should be in process
        connectToWiFi();
        xSemaphoreGive(sema_keepMQTTAlive);
      }
      connectToMQTT();
    }
    vTaskDelay(250 / portTICK_PERIOD_MS); // task runs approx every 250 ms
  }
  vTaskDelete(NULL);
}