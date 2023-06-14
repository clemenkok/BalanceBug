
#include <WiFi.h>
#include <PubSubClient.h>

// DEBUGGING
// Is it a problem with your Wifi connection?
// Is it a problem with the MQTT Broker? (try connecting to a public MQTT Broker)
// Is it a problem with your code? (revert to golden copy -  c9be18f1819a253eeeb39f96fd38fb76d81006e6)

// Configuration Variables
const char *ssid = "myhotspot";
const char *password = "racemicracemate";
const char *mqttServer = "3.84.3.59";
const int mqttPort = 1883;
const char *mqttUser = "BalanceBug";
const char *mqttPassword = "123";

// for MQTT Subscribe
unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

WiFiClient espClient;
PubSubClient client(espClient);

void connectToWifi()
{
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }

  Serial.println("Connected to the WiFi network");
}

void connectToMQTT()
{
  client.setServer(mqttServer, mqttPort);

  while (!client.connected())
  {
    Serial.println("Connecting to MQTT...");

    if (client.connect("ESP32Client", mqttUser, mqttPassword))
    {

      Serial.println("connected");
    }
    else
    {

      Serial.print("failed with state ");
      Serial.print(client.state());
      delay(2000);
    }
  }

  client.publish("esp/test", "Hello from ESP32");
  client.subscribe("esp/receive");
}

// Print messages from subscribed topics
void callback(char *topic, byte *payload, unsigned int length)
{
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++)
  {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}

void setup()
{

  Serial.begin(115200);
  connectToWifi();
  connectToMQTT();
}

void loop()
{
  client.setCallback(callback);
  client.loop();
}