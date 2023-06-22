/*
ESP Blue
35	A5
32	A4
33	A3
25	A2
*/

// calibrate LDRs, drive to follow walls using PID
// added functionality of being able to follow the left or right wall
// added case to find a wall when it's dark (just go straight)

#include <AccelStepper.h>
#include <PID_v1.h>

// esp32 pins
const int ledPinL = 27; // 2 pins for 2 LEDs
const int ledPinR = 26;
const int ldrLPin = 33; // pin for left front LED
const int ldrRPin = 35; // pin for right front LED
const int ldrFPin = 32; // pin for front LED

// Define stepper motor connections
const int stepPinR = 16;
const int dirPinR = 4;
const int stepPinL = 15;
const int dirPinL = 2;

const double PIVAL = 3.1415927;
int command = 0; // 0 to initialize PID and drive normally, 4 to go straight forever
bool followLeft = true; // follow left wall by default
int polarity = 1;

// Define the constants for PID control
double Kp = 1.7;   // Proportional gain
double Ki = 0.0;   // Integral gain
double Kd = 0.0;   // Derivative gain

// Define the input, output, and setpoint variables
double PIDinput = 0.0;       // Current position
double PIDoutput = 0.0;      // Control output
double setpoint = 75.0;  // Desired position: last time it was80

// calibration variables
bool newCalibrate = false; // change depedning on whether we want to calibrate
int VMax = 0;
int VMin = 0;
int LMax, LMin, RMax, RMin, FMax, FMin;
int ldrLVal, ldrRVal, ldrFVal;
int oldLMax = 1766;
int oldLMin = 307;
int oldRMax = 374;
int oldRMin = 277;
int oldFMax = 1506;
int oldFMin = 151;

int count = 0;
int brightThr = 70;
int darkThr = -1;
int turnDur = 2000;
int curDur = 0;
int cruiseSpeed = 60;
int speedL = 0, speedR = 0;
unsigned long startTime = 0, curTime = 0, printTime = 0;

// Define the robot parameters
const float WHEELBASE = 14;   // Wheelbase in centimeters

// Define the time step (adjust according to your requirements)
double delta_time = 0.0;  // Time step in seconds

// Variables to store the current position and orientation
double posX = 0.0;        // X coordinate
double posY = 0.0;        // Y coordinate
double thetaRad = 0.0; // Orientation angle
double thetaDeg = 0.0;
int updatePeriod = 5;
bool leftWall = false; // '1' if we drive and see a left wall
bool rightWall = false; // '1' if we drive and see a right wall


// testing variables
int targetDeg = 90;

// Create an instance of AccelStepper
AccelStepper stepperR(1, stepPinR, dirPinR);
AccelStepper stepperL(1, stepPinL, dirPinL);

// Define the PID controller object
PID myPID(&PIDinput, &PIDoutput, &setpoint, Kp, Ki, Kd, DIRECT);

// Function to update the position and orientation using the RK4 method
void updatePosition(int timeElapsed) {
  delta_time = timeElapsed / 1000.0; // time elapsed in seconds

  // compute wheel speed in cm/s
  double Lcms = speedL * 0.107; // 200 steps on 21.4 cm circumference => 0.107 cm per step
  double Rcms = speedR * 0.107;

  // Compute the linear and angular velocities
  double linearVelocity = (Lcms + Rcms) / 2.0;
  double angularVelocity = (Rcms - Lcms) / WHEELBASE;

  // Runge-Kutta 4th order integration
  double k1x, k2x, k3x, k4x;
  double k1y, k2y, k3y, k4y;
  double k1theta, k2theta, k3theta, k4theta;

  k1x = linearVelocity * cos(thetaRad);
  k1y = linearVelocity * sin(thetaRad);
  k1theta = angularVelocity;

  k2x = linearVelocity * cos(thetaRad + 0.5 * k1theta * delta_time);
  k2y = linearVelocity * sin(thetaRad + 0.5 * k1theta * delta_time);
  k2theta = angularVelocity;

  k3x = linearVelocity * cos(thetaRad + 0.5 * k2theta * delta_time);
  k3y = linearVelocity * sin(thetaRad + 0.5 * k2theta * delta_time);
  k3theta = angularVelocity;

  k4x = linearVelocity * cos(thetaRad + k3theta * delta_time);
  k4y = linearVelocity * sin(thetaRad + k3theta * delta_time);
  k4theta = angularVelocity;

  // Update the position and orientation
  posX += (k1x + 2 * k2x + 2 * k3x + k4x) * delta_time / 6.0;
  posY += (k1y + 2 * k2y + 2 * k3y + k4y) * delta_time / 6.0;
  thetaRad += (k1theta + 2 * k2theta + 2 * k3theta + k4theta) * delta_time / 6.0;
  if (thetaRad > PIVAL * 2){
    thetaRad -= (PIVAL * 2);
  }
  else if (thetaRad < 0){
    thetaRad += (PIVAL * 2);
  }
}


void calibrate(int& VMax, int& VMin, int sensorPin, int testNo){

  int sensorValue = 0;   // the sensor value
  VMin = 4095;  // minimum sensor value
  VMax = 0;     // maximum sensor value

  switch(testNo){
    case 0: 
      digitalWrite(ledPinL, HIGH);
      digitalWrite(ledPinR, LOW);
      Serial.println("entering testcase 0");
      break;
    case 1:
      digitalWrite(ledPinL, LOW);
      digitalWrite(ledPinR, HIGH);
      Serial.println("entering testcase 1");
      break;
    case 2:
      digitalWrite(ledPinL, HIGH);
      digitalWrite(ledPinR, HIGH);
      Serial.println("entering testcase 2");
      break;
  }

  startTime = millis();
  curTime = startTime;

  while (curTime - startTime < 3500){

    Serial.println("getting calibration values...");
    delay(100);

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

  digitalWrite(ledPinL, LOW);
  digitalWrite(ledPinR, LOW);

  delay(2000);
}


void setup() {

  Serial.begin(115200);
  //analogReadResolution(12);  // Set ADC resolution (0-4095)
  Serial.println("start setup");

  pinMode(ledPinL, OUTPUT);
  pinMode(ledPinR, OUTPUT);
  pinMode(ldrLPin, INPUT);
  pinMode(ldrRPin, INPUT);
  pinMode(ldrFPin, INPUT);

  // set max speed for the motors
  stepperL.setMaxSpeed(500);
  stepperR.setMaxSpeed(500);

  // Set the PID parameters
  myPID.SetOutputLimits(-60, 60);  // Adjust the output limits based on your motor control range
  myPID.SetMode(AUTOMATIC);

  // both LEDs turn on for 5s, before turning off to signal start of calibration
  digitalWrite(ledPinL, HIGH);
  digitalWrite(ledPinR, HIGH);
  delay(3000);
  digitalWrite(ledPinL, LOW);
  digitalWrite(ledPinR, LOW);
  delay(1000);

  // initiate calibration loop
  VMax = 0;
  VMin = 0;

  if (newCalibrate){
    int testNo = 0;
    calibrate(VMax, VMin, ldrLPin, testNo);
    LMax = VMax; // store min and max voltage values
    LMin = VMin;
    Serial.print("LMax: ");
    Serial.println(LMax);
    Serial.print("LMin: ");
    Serial.println(LMin);

    testNo = 1;
    calibrate(VMax, VMin, ldrRPin, testNo);
    RMax = VMax;
    RMin = VMin;
    Serial.print("RMax: ");
    Serial.println(RMax);
    Serial.print("RMin: ");
    Serial.println(RMin);

    testNo = 2;
    calibrate(VMax, VMin, ldrFPin, testNo);
    FMax = VMax;
    FMin = VMin;
    Serial.print("FMax: ");
    Serial.println(FMax);
    Serial.print("FMin: ");
    Serial.println(FMin);
  }
  else{
    LMax = oldLMax;
    LMin = oldLMin;
    RMax = oldRMax;
    RMin = oldRMin;
    FMax = oldFMax;
    FMin = oldFMin;
  }
  
}

void loop() {
  // read the sensor:
  ldrLVal = analogRead(ldrLPin);
  ldrRVal = analogRead(ldrRPin);
  ldrFVal = analogRead(ldrFPin);

  // in case the sensor value is outside the range seen during calibration
  ldrLVal = constrain(ldrLVal, LMin, LMax);
  ldrRVal = constrain(ldrRVal, RMin, RMax);
  ldrFVal = constrain(ldrFVal, FMin, FMax);

  // apply the calibration to the sensor reading (scale it from 0 - 100)
  ldrLVal = map(ldrLVal, LMin, LMax, 0, 100);
  ldrRVal = map(ldrRVal, RMin, RMax, 0, 100);
  ldrFVal = map(ldrFVal, FMin, FMax, 0, 100);

  thetaDeg = thetaRad / PIVAL * 180.0;

  switch(command){

    case 0:

      if (followLeft){
        leftWall = true;
        rightWall = false;
        PIDinput = ldrLVal;
        polarity = 1;

        if (ldrFVal > brightThr && ldrLVal > brightThr){
        // turn 90 deg to right
        command = 1;
        curDur = 0;
        }
      }

      else{ // case where following right wall
        leftWall = false;
        rightWall = true;
        PIDinput = ldrRVal;
        polarity = -1;

        if (ldrFVal > brightThr && ldrRVal > brightThr){
        // turn 90 deg to left
        command = 1;
        curDur = 0;
        }
      }

      if ( (ldrLVal < darkThr) && (ldrFVal < darkThr) && (ldrRVal < darkThr) ){
        command = 2; // rover is far from wall so do not execute PID yet
      }

      myPID.Compute();
      speedL = (cruiseSpeed - PIDoutput) * polarity;
      speedR = (cruiseSpeed + PIDoutput) * polarity;    
      break;

    case 1: // case to turn 90deg away from cur wall

      if (followLeft){
        polarity = 1;
      }
      else{
        polarity = -1;
      }

      speedL = cruiseSpeed * polarity;
      speedR = -cruiseSpeed * polarity;
      curDur++;

      if (curDur >= turnDur){
        command = 0;
      }

      break;

    // case where rover is far from wall (dark spot)
    case 2:
      speedL = cruiseSpeed;
      speedR = cruiseSpeed;

      // avoid ramming into front wall
      if (ldrFVal > brightThr){
        command = 1;
        curDur = 0;
      }

      else if (ldrLVal > setpoint - 20){
        followLeft = true;
        command = 0;
      }
      else if (ldrRVal > setpoint - 20){
        followLeft = false;
        command = 0;
      }

      break;

    case 3: // case to localize

      if (followLeft){
        polarity = 1;
      }
      else{
        polarity = -1;
      }

      speedL = cruiseSpeed * polarity;
      speedR = -cruiseSpeed * polarity;
      curDur++;

      if (curDur >= turnDur*4){ // turn for 360 degrees hopefully!
        command = 0;
      }

      break;

    case 4:
      // test case to drive in a straight line forever
      speedL = cruiseSpeed;
      speedR = cruiseSpeed;
      break;
  }

  curTime = millis();

  if (curTime - startTime > updatePeriod){

    updatePosition(curTime - startTime);
    startTime = curTime;
    stepperL.setSpeed(-speedL);
    stepperR.setSpeed(speedR);

  }

  stepperL.runSpeed();
  stepperR.runSpeed();

  if (count >= 500){
   
    Serial.print(posX);
    Serial.print(", ");
    Serial.print(posY);
    Serial.print(", ");
    Serial.print(thetaDeg);
    Serial.print(", ");
    Serial.print(leftWall);
    Serial.print(", ");
    Serial.println(rightWall);

    count = 0;
  }
  count++;

/*
  // print to serial monitor 
  if (count >= 2500){ // print every X milliseconds

    printTime = curTime;

    
    Serial.print("command, PID output: ");
    Serial.print(command);
    Serial.print(", ");
    Serial.println(PIDoutput);
    
    Serial.print("speed L, R: ");
    Serial.print(speedL);
    Serial.print(", ");
    Serial.println(speedR);

    Serial.print("LDR values L, R, F: ");
    Serial.print(ldrLVal);
    Serial.print(", ");
    Serial.print(ldrRVal);
    Serial.print(", ");
    Serial.println(ldrFVal);

    // Print the current position and orientation
    Serial.print("Position (x, y): ");
    Serial.print(posX);
    Serial.print(", ");
    Serial.println(posY);
    Serial.print("Orientation (thetaDeg): ");
    Serial.println(thetaDeg, 4);
    Serial.print("time elapsed: ");
    Serial.println(delta_time, 4);

    Serial.println("");
    count = 0;
  }
  count++;

*/
  
}