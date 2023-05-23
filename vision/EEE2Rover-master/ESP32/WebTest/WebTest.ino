#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <ESP32Servo.h>
#include <ArduinoJson.h>

const char* ssid = "EE-p4h4nb";
const char* password = "stop-serve-wet";

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

void drive() {
  if (server.args() > 0) {
    server.send(204);
    deserializeJson(doc,server.arg(0));
    int packetNumber = doc["count"];
    int X2 = doc["X2"];
    int Y2 = doc["Y2"];
    int Y1 = doc["Y1"];
    if (packetNumber > msgCount || packetNumber == 0){
      msgCount = packetNumber;
      setMotors(X2,100-Y2,100-Y1);
    }
    if (packetNumber % 5 == 0){
      Serial.print(packetNumber);
      Serial.print(':');
      Serial.print(' ');
      Serial.println(server.arg(0));
    }
  } else {
    server.send(400);
  }
}

void setup(void) {
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);
  Serial.begin(115200);
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

  server.on("/inline", []() {
    server.send(200, "text/plain", "this works as well");
  });

  server.on("/drive", drive);

  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");

  ESP32PWM::allocateTimer(0);
  ESP32PWM::allocateTimer(1);
  ESP32PWM::allocateTimer(2);
  ESP32PWM::allocateTimer(3);
  servoLeft.setPeriodHertz(50);
  servoRight.setPeriodHertz(50);
  servoLift.setPeriodHertz(50);
  servoLeft.attach(23);
  servoRight.attach(22);
  servoLift.attach(21);
  
  Serial.println("Servos initialised");
}

void loop(void) {
  server.handleClient();
}

void setMotors(int X, int Y, int Z){
  int left = (X < 50) ? Y : (Y * (100 - X) * 2) / 100;
  int right = (X > 50) ? Y : (Y * X * 2) / 100;
  int lift = Z;
  servoLeft.write(left);
  servoRight.write(right); 
  servoLift.write(lift);  
}
