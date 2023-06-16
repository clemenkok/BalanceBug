/*
ESP Blue
35	A5
32	A4
33	A3
25	A2
*/

// goal is to read LDR and control speed based on that
// when we drive we want to measure change in distance and angle
// so that we can update the new position and bearing

#include <AccelStepper.h>
#include <PID_v1.h>

/*
// esp32 pins
int ledPinL = 18; // 2 pins for 2 LEDs
int ledPinR = 19;
int ldrLPin = 27; // pin for left front LED
int ldrRPin = 4; // pin for right front LED
int ldrFPin = 35; // pin for front LED
*/

// arduino pins
const int ledPinL = 7; // 2 pins for 2 LEDs
const int ledPinR = 6;
const int ldrLPin = A0; // pin for left front LED
const int ldrRPin = A2; // pin for right front LED
const int ldrFPin = A1; // pin for front LED

// Define stepper motor connections
#define stepPinR 2
#define dirPinR 3
#define stepPinL 4
#define dirPinL 5

const double PIVAL = 3.1415927;
int command = 0; // 0 to drive normally, 1 for 90deg turn, 2 for 180deg turn; 3 to go straight forever

// Define the constants for PID control
double Kp = 1.5;   // Proportional gain
double Ki = 0.0;   // Integral gain
double Kd = 0.0;   // Derivative gain

// Define the input, output, and setpoint variables
double PIDinput = 0.0;       // Current position
double PIDoutput = 0.0;      // Control output
double setpoint = 80.0;  // Desired position

// calibration variables
bool newCalibrate = false; // change depedning on whether we want to calibrate
int VMax = 0;
int VMin = 0;
int LFMax, LFMin, RFMax, RFMin, FMax, FMin;
int ldrLVal, ldrRVal, ldrFVal;
int oldLMax = 598;
int oldLMin = 173;
int oldRMax = 640;
int oldRMin = 308;
int oldFMax = 637;
int oldFMin = 336;

int count = 0;
int brightThr = 70;
int turnDur = 2000;
int curDur = 0;
int cruiseSpeed = 90;
int speedL = 0, speedR = 0;
unsigned long startTime = 0, curTime = 0, printTime = 0;

// Define the robot parameters
const float WHEEL_RADIUS = 3.374;  // Wheel radius in centimeters
const float WHEELBASE = 14;   // Wheelbase in centimeters

// Define the time step (adjust according to your requirements)
double delta_time = 0.0;  // Time step in seconds

// Variables to store the current position and orientation
double posX = 0.0;        // X coordinate
double posY = 0.0;        // Y coordinate
double thetaRad = 0.0; // Orientation angle
double thetaDeg = 0.0;
int updatePeriod = 5;
bool leftWall = false;
bool rightWall = false;

// testing variables
int targetDeg = 90;

// Create an instance of AccelStepper
AccelStepper stepperR(1, stepPinR, dirPinR);
AccelStepper stepperL(1, stepPinL, dirPinL);

// Define the PID controller object
PID myPID(&PIDinput, &PIDoutput, &setpoint, Kp, Ki, Kd, DIRECT);

// Function to update the position and orientation using the RK4 method
void updatePosition() {
  // Compute time elapsed
  delta_time = updatePeriod / 1000.0; // time elapsed in seconds

  // compute wheel speed in cm/s
  double Lcms = speedL * 0.106; // 200 steps on 21.2 cm circumference => 0.106 cm per step
  double Rcms = speedR * 0.106;

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

  digitalWrite(ledPinL, LOW);
  digitalWrite(ledPinR, LOW);

  delay(2000);
}


void setup() {

  Serial.begin(9600);
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
  stepperL.setAcceleration(200);
  stepperR.setAcceleration(200);

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
  else{
    LFMax = oldLMax;
    LFMin = oldLMin;
    RFMax = oldRMax;
    RFMin = oldRMin;
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
  ldrLVal = constrain(ldrLVal, LFMin, LFMax);
  ldrRVal = constrain(ldrRVal, RFMin, RFMax);
  ldrFVal = constrain(ldrFVal, FMin, FMax);

  // apply the calibration to the sensor reading (scale it from 0 - 100)
  ldrLVal = map(ldrLVal, LFMin, LFMax, 0, 100);
  ldrRVal = map(ldrRVal, RFMin, RFMax, 0, 100);
  ldrFVal = map(ldrFVal, FMin, FMax, 0, 100);

  thetaDeg = thetaRad / PIVAL * 180.0;

  switch(command){

    case 0:
      leftWall = true; 
      PIDinput = ldrLVal;
      myPID.Compute();
      speedL = cruiseSpeed - PIDoutput;
      speedR = cruiseSpeed + PIDoutput;

      if (ldrRVal > brightThr && ldrLVal > brightThr){
        // turn 180 deg
        command = 0; // ignore right walls for now
        //targetDeg = thetaDeg + 180;
        curDur = 0;
      }
      else if (ldrFVal > brightThr && ldrLVal > brightThr){
        // turn 90 deg to right
        command = 2;
        //targetDeg = thetaDeg + 90;
        curDur = 0;
      }

      break;

    case 1:
      speedL = cruiseSpeed;
      speedR = -cruiseSpeed;

      
      curDur++;

      if (curDur >= 2*turnDur){
        command = 0;
      }

      break;

    case 2:
      speedL = cruiseSpeed;
      speedR = -cruiseSpeed;

      
      curDur++;

      if (curDur >= turnDur){
        command = 0;
      }
      

      break;

    case 3:
      // test case to drive in a straight line forever
      speedL = cruiseSpeed + 20;
      speedR = cruiseSpeed - 20;
      break;


    case 4:
      rightWall = true; 
      PIDinput = ldrRVal;
      myPID.Compute();
      speedL = cruiseSpeed + PIDoutput;
      speedR = cruiseSpeed - PIDoutput;

      if (ldrRVal > brightThr && ldrLVal > brightThr){
        // turn 180 deg
        command = 4; // ignore left walls for now
        //targetDeg = thetaDeg + 180;
        curDur = 0;
      }
      else if (ldrFVal > brightThr && ldrRVal > brightThr){
        // turn 90 deg to right
        command = 5;
        //targetDeg = thetaDeg + 90;
        curDur = 0;
      }

      break;

    case 5: // case of turning 90 when following R wall
      speedL = -cruiseSpeed;
      speedR = cruiseSpeed;

      
      curDur++;

      if (curDur >= turnDur){
        command = 4;
      }
      
      break;


  }

  curTime = millis();

  if (curTime - startTime > updatePeriod){

    startTime = curTime;
    updatePosition();
    stepperL.setSpeed(-speedL);
    stepperR.setSpeed(speedR);

  }

  stepperL.runSpeed();
  stepperR.runSpeed();

  if (count >= 100){
   
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