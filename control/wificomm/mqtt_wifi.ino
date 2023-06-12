#include <WiFi.h>
#include <PubSubClient.h>

unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE  (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

WiFiClient espClient;
PubSubClient client(espClient);
const char* mqtt_server = "3.83.118.212"; // Change this to the MQTT Broker EC2 Public IP.

// This function initiates the connection to the Wi-Fi connection.
void initWiFi() {
  const char* ssid = "myhotspot";
  const char* password = "racemicracemate";
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi ..");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
  Serial.println(WiFi.localIP());
}

// This function prints out the output from the subscribed MQTT Topic.
void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();

  // Switch on the LED if an 1 was received as first character
  if ((char)payload[0] == '1') {
    digitalWrite(LED_BUILTIN, LOW);   // Turn the LED on (Note that LOW is the voltage level
    // but actually the LED is on; this is because
    // it is active low on the ESP-01)
  } else {
    digitalWrite(LED_BUILTIN, HIGH);  // Turn the LED off by making the voltage HIGH
  }
}

// This function reconnects to the MQTT client if the connection is not established yet
// Here, whne connected, we publish to the topic 'outTopic' that we have connected, saying 'hello world'.
// In this example, we also subscribe to the topic 'inTopic'. Then as data is sent into it by publishers, we print the data via setCallBack().
void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (client.connect(clientId.c_str()), "BalanceBug", "123") {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("outTopic", "hello world");
      // ... and resubscribe
      client.subscribe("inTopic");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
  initWiFi();
}

void loop() {

  // Here, we establish the MQTT connection.
  if (!client.connected()) {
    reconnect();
    
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  }
  client.loop();

  // Here, we periodically publish 'keep alive' messages to the 'outTopic' topic. If we do not publish keep alive messages, we may be disconnected from the MQTT server (TODO: verify).
  unsigned long now = millis();
  if (now - lastMsg > 2000) {
    lastMsg = now;
    ++value;
    snprintf (msg, MSG_BUFFER_SIZE, "hello world #%ld", value);
    Serial.print("Publish message: ");
    Serial.println(msg);
    client.publish("outTopic", msg);
  }
}