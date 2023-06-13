/*
  Calibration

  Demonstrates one technique for calibrating sensor input. The sensor readings
  during the first five seconds of the sketch execution define the minimum and
  maximum of expected values attached to the sensor pin.

  The sensor minimum and maximum initial values may seem backwards. Initially,
  you set the minimum high and listen for anything lower, saving it as the new
  minimum. Likewise, you set the maximum low and listen for anything higher as
  the new maximum.

*/

#include <AccelStepper.h>
#include <PID_v1.h>

/*
// esp32 pins
int ledPin1 = 18; // 2 pins for 2 LEDs
int ledPin2 = 19;
int ldrLPin = 27; // pin for left front LED
int ldrRPin = 4; // pin for right front LED
int ldrFPin = 35; // pin for front LED
*/

// arduino pins
const int ledPin1 = 7; // 2 pins for 2 LEDs
const int ledPin2 = 6;
const int ldrLPin = A0; // pin for left front LED
const int ldrRPin = A2; // pin for right front LED
const int ldrFPin = A1; // pin for front LED

const int dirPin1 = 1;
const int stepPin1 = 2;
const int dirPin2 = 3;
const int stepPin2 = 4;

/*
// moving average variables
const int numVals = 5; // number of readings for moving average
int LVals[numVals], RVals[numVals], FVals[numVals]; // arrays to store previous values
int LTotal = 0, RTotal = 0, FTotal = 0, curIdx = 0;
int LAve, RAve, FAve;
*/

// calibration variables
int VMax = 0;
int VMin = 0;
int LFMax, LFMin, RFMax, RFMin, FMax, FMin;
int ldrLVal, ldrRVal, ldrFVal;

// driving command variables
// thresholds to determine state - input values vary from 0 to 100 (dark to bright)
int brightThr = 85;
int darkThr = 60;
int reentryThr = 75;
bool leftWall = 1; // 1 for left, 0 for right wall. default follow left wall.
int turnDir = 0; // 0 for left turn, 1 for right turn;
int count = 0;
int state = 2;

// PID variables
double Kp = 5.0;   // Proportional gain
double Ki = 0.0;   // Integral gain
double Kd = 0.0;   // Derivative gain

// Define the input, output, and setpoint variables
double PIDinput = 0.0;       // Current position
double PIDoutput = 0.0;      // Control output
double setpoint = 75;  // Desired position

int cruiseSpeed = 50;
int speedL = 0;
int speedR = 0;
unsigned long startTime;
unsigned long curTime;

// Define the PID controller object
PID myPID(&PIDinput, &PIDoutput, &setpoint, Kp, Ki, Kd, DIRECT);

// create instances of AccelStepper
AccelStepper stepperL(1, stepPin1, dirPin1);
AccelStepper stepperR(1, stepPin2, dirPin2);

void calibrate(int& VMax, int& VMin, int sensorPin, int testNo){

  int sensorValue = 0;   // the sensor value
  VMin = 4095;  // minimum sensor value
  VMax = 0;     // maximum sensor value

  switch(testNo){
    case 0: 
      digitalWrite(ledPin1, HIGH);
      digitalWrite(ledPin2, LOW);
      Serial.println("entering testcase 0");
      break;
    case 1:
      digitalWrite(ledPin1, LOW);
      digitalWrite(ledPin2, HIGH);
      Serial.println("entering testcase 1");
      break;
    case 2:
      digitalWrite(ledPin1, HIGH);
      digitalWrite(ledPin2, HIGH);
      Serial.println("entering testcase 2");
      break;
  }

  startTime = millis();
  curTime = startTime;

  while (curTime - startTime < 5000){

    Serial.println("getting calibration values...");
    delay(300);

    curTime = millis();
    sensorValue = analogRead(sensorPin);
    Serial.println(sensorValue);

    if (sensorValue > VMax){
      VMax = sensorValue;
    }
    if (sensorValue < VMin){
      VMin = sensorValue;
    }
  }

  digitalWrite(ledPin1, LOW);
  digitalWrite(ledPin2, LOW);

  delay(2000);
}

void followWall(){

  Serial.println("executing PID to follow line");
  int polarity;

  if (leftWall){ // following left wall
    PIDinput = ldrLVal;
    polarity = 1;
  }
  else{ // following right wall
    PIDinput = ldrRVal;
    polarity = -1;
  }
  myPID.Compute(); // this changes the variable 'PIDoutput'

  speedL = cruiseSpeed - (polarity * PIDoutput);
  speedR = cruiseSpeed + (polarity * PIDoutput);

  stepperL.setSpeed(speedL);
  stepperR.setSpeed(speedR);

  startTime = millis();
  curTime = startTime;

  while (curTime - startTime < 100){ // run for 100 ms
    stepperL.runSpeed();
    stepperR.runSpeed();
  }

  return;
}

void turn90(){

  int polarity;

  Serial.println("turn by 90 degrees");
  delay(500);

  if (leftWall){ //following left wall: turn right
    polarity = 1;
  }
  else{
    polarity = -1;
  }

  speedL = cruiseSpeed * polarity;
  speedR = cruiseSpeed * polarity * -1;
  stepperL.setSpeed(speedL);
  stepperR.setSpeed(speedR);

  // planning to move at 50 steps a second: move for 4 sec to complete 1 rev
  startTime = millis();
  curTime = startTime;

  while (curTime - startTime < 4000){
    stepperL.runSpeed();
    stepperR.runSpeed();
  }
  
  return;
}

void turn180(){


  Serial.println("turn by 180 degrees");
  delay(500);

  speedL = cruiseSpeed;
  speedR = -cruiseSpeed;
  stepperL.setSpeed(speedL);
  stepperR.setSpeed(speedR);

  // planning to move at 50 steps a second: move for 8 sec to complete 2 revs
  startTime = millis();
  curTime = startTime;

  while (curTime - startTime < 8000){
    stepperL.runSpeed();
    stepperR.runSpeed();
  }
  
  return;
}


void command(){
  /*
  LAve = movingAve(L, LVals, LTotal);
  RAve = movingAve(R, RVals, RTotal);
  FAve = movingAve(F, FVals, FTotal);
  */
  int oppVal;
  if (leftWall){
    oppVal = ldrRPin;
  }
  else{
    oppVal = ldrLPin;
  }

  if (ldrFVal < brightThr && oppVal < brightThr){
    followWall(); // command robot to follow wall if there are no obstructions
  }
  else if (ldrFVal > brightThr){
    turn90();
  }
  else if (ldrRVal > brightThr){
    turn180();
  }
  else{
    followWall(); // extra case to catch errors and shit
  }
  
}

void setup() {

  Serial.begin(115200);
  //analogReadResolution(12);  // Set ADC resolution (0-4095)
  Serial.println("start setup");

  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ldrLPin, INPUT);
  pinMode(ldrRPin, INPUT);
  pinMode(ldrFPin, INPUT);

  // set max speed for the motors
  stepperL.setMaxSpeed(500);
  stepperR.setMaxSpeed(500);

  // Set the PID parameters
  myPID.SetOutputLimits(-50, 50);  // Adjust the output limits based on your motor control range
  myPID.SetMode(AUTOMATIC);

  // both LEDs turn on for 5s, before turning off to signal start of calibration
  digitalWrite(ledPin1, HIGH);
  digitalWrite(ledPin2, HIGH);
  delay(5000);
  digitalWrite(ledPin1, LOW);
  digitalWrite(ledPin2, LOW);
  delay(1000);

  // initiate calibration loop
  VMax = 0;
  VMin = 0;

  int testNo = 0;
  calibrate(VMax, VMin, ldrLPin, testNo);
  LFMax = VMax; // store min and max voltage values
  LFMin = VMin;
  Serial.print("LFMax: ");
  Serial.println(LFMax);
  Serial.print("LFMin: ");
  Serial.println(LFMin);

  testNo = 1;
  calibrate(VMax, VMin, ldrRPin, testNo);
  RFMax = VMax;
  RFMin = VMin;
  Serial.print("RFMax: ");
  Serial.println(RFMax);
  Serial.print("RFMin: ");
  Serial.println(RFMin);

  testNo = 2;
  calibrate(VMax, VMin, ldrFPin, testNo);
  FMax = VMax;
  FMin = VMin;
  Serial.print("FMax: ");
  Serial.println(FMax);
  Serial.print("FMin: ");
  Serial.println(FMin);

}

void loop() {
  
  // read the sensor:
  ldrLVal = analogRead(ldrLPin);
  ldrRVal = analogRead(ldrRPin);
  ldrFVal = analogRead(ldrFPin);

  /*
  Serial.print("LF: ");
  Serial.println(ldrLVal);
  Serial.print("RF: ");
  Serial.println(ldrRVal);
  Serial.print("F: ");
  Serial.println(ldrFVal);
  Serial.print("");
  */

  // in case the sensor value is outside the range seen during calibration
  ldrLVal = constrain(ldrLVal, LFMin, LFMax);
  ldrRVal = constrain(ldrRVal, RFMin, RFMax);
  ldrFVal = constrain(ldrFVal, FMin, FMax);

  // apply the calibration to the sensor reading (scale it from 0 - 100)
  ldrLVal = map(ldrLVal, LFMin, LFMax, 0, 100);
  ldrRVal = map(ldrRVal, RFMin, RFMax, 0, 100);
  ldrFVal = map(ldrFVal, FMin, FMax, 0, 100);

  // command the robot to drive and shit
  command();

  // print to serial monitor 
  if (count >= 40){
    Serial.print("ldrLVal: ");
    Serial.println(ldrLVal);
    Serial.print("ldrRVal: ");
    Serial.println(ldrRVal);
    Serial.print("ldrFVal: ");
    Serial.println(ldrFVal);
    count = 0;
  }
  
  count++;
  delay(50);

}