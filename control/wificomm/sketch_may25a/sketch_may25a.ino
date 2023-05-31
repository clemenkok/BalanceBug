#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <ESP32Servo.h>
#include <ArduinoJson.h>
#include <HTTPClient.h>



const char* ssid = "Kobe Dog Iphone";
const char* password = "12345688";

//Your Domain name with URL path or IP address with path
const char* serverName = "http://172.20.10.11:3000/";


WebServer server(80);
DynamicJsonDocument doc(1024);

Servo servoLeft;
Servo servoRight;
Servo servoLift;

const int led = 13;

int wcount = 0;
int msgCount = 0;


void handleRoot() {
  digitalWrite(led, 1);
  server.send(200, "text/plain", "hello from esp32!");
  digitalWrite(led, 0);
}

void handleNotFound() {
  digitalWrite(led, 1);
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  digitalWrite(led, 0);
}


void setup(void) {

  pinMode(led, OUTPUT);
  digitalWrite(led, 0);
  Serial.begin(115200);

  StaticJsonDocument<200> doc;
   doc["sensor"] = "gps";
   doc["time"] = 1351824120;
  String json_string;
  serializeJson(doc, json_string);
  Serial.println(json_string);
  


  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  if (MDNS.begin("esp32")) {
    Serial.println("MDNS responder started");
  }

  server.on("/", handleRoot);


  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");

  ESP32PWM::allocateTimer(0);
  ESP32PWM::allocateTimer(1);
  ESP32PWM::allocateTimer(2);
  ESP32PWM::allocateTimer(3);
  // servoLeft.setPeriodHertz(50);
  // servoRight.setPeriodHertz(50);
  // servoLift.setPeriodHertz(50);
  // servoLeft.attach(23);
  // servoRight.attach(22);
  // servoLift.attach(21);
  
  Serial.println("Servos initialised");



  WiFiClient client;
  HTTPClient http;

  // Your Domain name with URL path or IP address with path
  http.begin(client, serverName);
  
  // If you need Node-RED/server authentication, insert user and password below
  //http.setAuthorization("REPLACE_WITH_SERVER_USERNAME", "REPLACE_WITH_SERVER_PASSWORD");
  
  http.addHeader("Content-Type", "application/json");

  // //int httpResponseCode = http.POST("{\"api_key\":\"tPmAT5Ab3j7F9\",\"sensor\":\"BME280\",\"value1\":\"24.25\",\"value2\":\"49.54\",\"value3\":\"1005.14\"}");         

  int httpResponseCode = http.POST(json_string);
  
  // // If you need an HTTP request with a content type: text/plain
  // http.addHeader("Content-Type", "text/plain");
  // int httpResponseCode = http.POST(json_string);


  Serial.print("HTTP Response code: ");
  Serial.println(httpResponseCode);
    



  // Free resources
  http.end();




}

void loop(void) {
  server.handleClient();
}
