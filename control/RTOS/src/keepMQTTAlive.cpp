#include <Arduino.h>
#include <PubSubClient.h>
#include <WiFi.h>

// semaphore declaration to prevent conflicts
SemaphoreHandle_t mutex_v;

// configs
#define WIFI_NETWORK "myhotspot2"
#define WIFI_PASSWORD "racemicracemate"
#define MQTT_USERNAME "BalanceBug"
#define MQTT_PASSWORD "123"

const char *MQTT_SERVER = "54.204.201.39";
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
  MQTTclient.subscribe("test_topic");           // added subscribe upon connection. TO EXECUTE FN: go to callback

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
  WiFi.disconnect();
  while (WiFi.status() != WL_CONNECTED)
  {
    // WiFi.disconnect();
    WiFi.begin(WIFI_NETWORK, WIFI_PASSWORD);
    Serial.println("wifi connecting");
    log_i(" waiting on wifi connection");
    vTaskDelay(4000 / portTICK_PERIOD_MS);
  }
  Serial.println("Connected to WiFi");
  WiFi.onEvent(WiFiEvent);
}

void printStackSpaceMQTT()
{
  UBaseType_t freeStack = uxTaskGetStackHighWaterMark(NULL) * sizeof(StackType_t);
  Serial.print("Free Stack Space (keepMQTTAlive): ");
  Serial.print(freeStack);
  Serial.println(" bytes");
}

// called in setup()
void connectionSetup()
{
  connectToWiFi();
  connectToMQTT();
}

// task that connects to and keeps MQTT connection alive through intermittent checks
void keepMQTTAlive(void *parameters)
{
  // setting must be set before a MQTT connection is made
  MQTTclient.setKeepAlive(90); // setting keep alive to 90 seconds makes for a very reliable connection, must be set before the 1st connection is made.
  for (;;)
  {
    // printStackSpaceMQTT();
    // check for a is-connected and if the WiFi 'thinks' its connected, found checking on both is more realible than just a single check
    if ((wifiClient.connected()) && (WiFi.status() == WL_CONNECTED))
    {
      xSemaphoreTake(mutex_v, portMAX_DELAY);
      MQTTclient.loop();
      MQTTclient.publish("keep_alive", "ESP32 connected to MQTT");
      xSemaphoreGive(mutex_v);
      // MQTTclient.publish("alive_topic", "Alive"); // NEW ADDITION - MONITOR ESP32 status via CLI
    }
    else
    {
      log_i("MQTT keep alive found MQTT status %s WiFi status %s", String(wifiClient.connected()), String(WiFi.status()));
      if (!(WiFi.status() == WL_CONNECTED))
      {
        connectToWiFi();
      }
      if (!MQTTclient.connected()) // WE dont want to reconnect after end of other tasks
      {
        Serial.println("I was disconnected");
        connectToMQTT();
      }
    }
    vTaskDelay(250 / portTICK_PERIOD_MS); // task runs approx every 250 ms
  }
  vTaskDelete(NULL);
}