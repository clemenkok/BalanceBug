#include "drive.h"
#include <AccelStepper.h>
#include <PID_v1.h>
#include "roverStateControl.h"
#include <cstring>
// #include <cmath>
#include <math.h>

const double PIVAL = 3.1415927;
#define WHEELBASE 14;

// esp32 pins
const int ledPinL = 27; // 2 pins for 2 LEDs
const int ledPinR = 26;
const int ldrLPin = 33; // pin for left front LED
const int ldrRPin = 35; // pin for right front LED
const int ldrFPin = 32; // pin for front LED

// Define stepper motor connections
const int stepPinR = 16; // 9 ON ESP BOARD
const int dirPinR = 4;   // 11
const int stepPinL = 15; // 12
const int dirPinL = 2;   // 13

// Define the constants for PID control
double Kp = 1.5; // Proportional gain
double Ki = 0.0; // Integral gain
double Kd = 0.0; // Derivative gain

// Define the input, output, and setpoint variables
double PIDinput = 0.0;  // Current position
double PIDoutput = 0.0; // Control output
double setpoint = 80.0; // Desired position

// calibration variables
bool newCalibrate = false;
int LMax, LMin, RMax, RMin, FMax, FMin;
int ldrLVal, ldrRVal, ldrFVal;
int oldLMax = 2352;
int oldLMin = 379;
int oldRMax = 2411;
int oldRMin = 491;
int oldFMax = 2160;
int oldFMin = 253;
///////////////////////////////////////////////

int brightThr = 70;
int darkThr = 30;
int turnDur = 2000;
int curDur = 0;
int cruiseSpeed = 90;
int speedL = 0, speedR = 0;

// Variables to store the current position and orientation
double posX = 0.0;     // X coordinate
double posY = 0.0;     // Y coordinate
double thetaRad = 0.0; // Orientation angle
double thetaDeg = 0.0;
int positionUpdatePeriod = 5;
unsigned long prevPositionUpdateTime = 0;
int loop_count = 0;

// to be sent to server
// bool leftWall = false; // '1' if we drive and see a left wall
// bool rightWall = false; // '1' if we drive and see a right wall
bool transmitDataToCloud = false;
;
const int ARRAY_SIZE = 30;
int dataIndex = 0;
double prevLocalisation[2] = {0.0};
double currLocalisation[2] = {0.0};

double posXArr[ARRAY_SIZE] = {0.0};
double posYArr[ARRAY_SIZE] = {0.0};
double thetaArr[ARRAY_SIZE] = {0.0};
bool leftWallArr[ARRAY_SIZE] = {0};
bool rightWallArr[ARRAY_SIZE] = {0};

bool driftCorrect = false;
int driftCorrectSendIndex = 0;

enum DriveState
{
    STOP,
    LOOK_FOR_WALL,
    FOLLOW_WALL,
    TURN_90_DEG
    // localise maybe
};

// Create an instance of AccelStepper
AccelStepper stepperR(1, stepPinR, dirPinR);
AccelStepper stepperL(1, stepPinL, dirPinL);

// Define the PID controller object
PID myPID(&PIDinput, &PIDoutput, &setpoint, Kp, Ki, Kd, DIRECT);

DriveState currDriveState = FOLLOW_WALL;
bool followLeft = true;
bool followRight = !followLeft;
int polarity = 1;

void driveSetup()
{
    // analogReadResolution(12);  // Set ADC resolution (0-4095)
    Serial.println("start drive setup");

    pinMode(ledPinL, OUTPUT);
    pinMode(ledPinR, OUTPUT);
    pinMode(ldrLPin, INPUT);
    pinMode(ldrRPin, INPUT);
    pinMode(ldrFPin, INPUT);

    // set max speed for the motors
    stepperL.setMaxSpeed(500);
    stepperR.setMaxSpeed(500);

    // Set the PID parameters
    myPID.SetOutputLimits(-60, 60); // Adjust the output limits based on your motor control range
    myPID.SetMode(AUTOMATIC);

    // both LEDs turn on for 5s, before turning off to signal start of calibration
    digitalWrite(ledPinL, HIGH);
    digitalWrite(ledPinR, HIGH);
    delay(3000);
    digitalWrite(ledPinL, LOW);
    digitalWrite(ledPinR, LOW);
    delay(1000);

    // initiate calibration
    if (newCalibrate)
    {
        int testNo = 0;
        calibrate(LMax, LMin, ldrLPin, testNo);
        Serial.print("LMax: ");
        Serial.println(LMax);
        Serial.print("LMin: ");
        Serial.println(LMin);

        testNo = 1;
        calibrate(RMax, RMin, ldrRPin, testNo);
        Serial.print("RMax: ");
        Serial.println(RMax);
        Serial.print("RMin: ");
        Serial.println(RMin);

        testNo = 2;
        calibrate(FMax, FMin, ldrFPin, testNo);
        Serial.print("FMax: ");
        Serial.println(FMax);
        Serial.print("FMin: ");
        Serial.println(FMin);
    }
    else
    {
        Serial.println("Use old calibration");
        LMax = oldLMax;
        LMin = oldLMin;
        RMax = oldRMax;
        RMin = oldRMin;
        FMax = oldFMax;
        FMin = oldFMin;
    }
    delay(2000);
}

void driveLoop()
{
    if (driftCorrect){
        Serial.print("driftCorrectSendIndex");
        Serial.print(driftCorrectSendIndex);
        Serial.print(" Mutex ");
        char deadreckoning_payload[50] = {0};
        char pos_x_str[8];
        std::sprintf(pos_x_str, "%.2f", posXArr[driftCorrectSendIndex]);
        char pos_y_str[8];
        std::sprintf(pos_y_str, "%.2f", posYArr[driftCorrectSendIndex]);
        char theta_deg[8];
        std::sprintf(theta_deg, "%.2f", thetaArr[driftCorrectSendIndex]);
        char left_wall_str[8];
        std::sprintf(left_wall_str, "%d", leftWallArr[driftCorrectSendIndex]);
        char right_wall_str[8];
        std::sprintf(right_wall_str, "%d", rightWallArr[driftCorrectSendIndex]);

        std::strcat(deadreckoning_payload, pos_x_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, pos_y_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, theta_deg);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, left_wall_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, right_wall_str);

        Serial.println("deadreckoning_payload");
        Serial.println(deadreckoning_payload);

        xSemaphoreTake(mutex_v, portMAX_DELAY);
        MQTTclient.publish("deadreckoning_data", deadreckoning_payload);
        xSemaphoreGive(mutex_v);

        if (driftCorrectSendIndex == ARRAY_SIZE-1){
            driftCorrectSendIndex = 0;
            driftCorrect = false;
        } else{
            driftCorrectSendIndex += 1;
        }
    }
    else{
        transmitDataToCloud = false;
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
        // Serial.println("Curr Drive State");
        // Serial.println(currDriveState);
        switch (currDriveState)
        {
        case STOP:
            // dont move at all
            speedL = 0;
            speedR = 0;

        case FOLLOW_WALL:
            // follow left wall
            if (followLeft)
            {
                PIDinput = ldrLVal;
                polarity = 1;

                if (ldrFVal > brightThr && ldrLVal > brightThr)
                {
                    // turn 90 deg to right
                    currDriveState = TURN_90_DEG;
                    curDur = 0;
                }
            }

            else if (followRight)
            { // case where following right wall
                PIDinput = ldrRVal;
                polarity = -1;

                if (ldrFVal > brightThr && ldrRVal > brightThr)
                {
                    // turn 90 deg to left
                    currDriveState = TURN_90_DEG;
                    curDur = 0;
                }
            }

            // if its dark and gets lost, look for wall again
            if ((ldrLVal < darkThr) && (ldrFVal < darkThr) && (ldrRVal < darkThr))
            {
                currDriveState = LOOK_FOR_WALL; // rover is far from wall so do not execute PID yet
            }

            myPID.Compute();
            speedL = (cruiseSpeed - PIDoutput) * polarity;
            speedR = (cruiseSpeed + PIDoutput) * polarity;
            break;

        case TURN_90_DEG: // case to turn 90deg away from cur wall

            if (followLeft)
            {
                polarity = 1;
            }
            else
            {
                polarity = -1;
            }

            speedL = cruiseSpeed * polarity;
            speedR = -cruiseSpeed * polarity;
            curDur++;

            if (curDur >= turnDur)
            {
                currDriveState = FOLLOW_WALL;
            }

            break;

        // case where rover is far from wall (dark spot)
        case LOOK_FOR_WALL:
            // for now just move straight and see if hit a wall
            speedL = cruiseSpeed;
            speedR = cruiseSpeed;
            followLeft = false;
            followRight = false;

            // if front LED meets wall, turn 90 deg to the left
            if (ldrFVal > brightThr)
            {
                currDriveState = TURN_90_DEG;
                followLeft = true;
                followRight = false;
                curDur = 0;
            }

            // if the left sees a wall close by
            else if (ldrLVal > setpoint - 20)
            {
                followLeft = true;
                followRight = false;
                currDriveState = FOLLOW_WALL;
            }
            else if (ldrRVal > setpoint - 20)
            {
                followLeft = false;
                followRight = true;
                currDriveState = FOLLOW_WALL;
            }

            break;

            // when localise stop sending stuff
            // when not in the driving state stop sending stuff
        }

        unsigned long curTime = millis();

        if (curTime - prevPositionUpdateTime > positionUpdatePeriod)
        {
            if (prevPositionUpdateTime != 0)
            {
                updatePosition(curTime - prevPositionUpdateTime);
                stepperL.setSpeed(-speedL);
                stepperR.setSpeed(speedR);
                prevPositionUpdateTime = curTime;
            }
            else
            {
                prevPositionUpdateTime = curTime;
            }
        }

        stepperL.runSpeed();
        stepperR.runSpeed();
        /*
        if (loop_count >= 10000) {
        Serial.println("-----------------------");
        Serial.println(currDriveState);
        Serial.println(ldrLVal);
        Serial.println(ldrRVal);
        Serial.println(ldrFVal);
        Serial.println("-----------------------");
        }
        */
        transmitDataToCloud = (currDriveState == LOOK_FOR_WALL) ||
                            (currDriveState == FOLLOW_WALL) ||
                            (currDriveState == TURN_90_DEG);
        // Serial.println("Transmit Data To Cloud");
        // Serial.println(transmitDataToCloud);
        if (loop_count >= 50 && transmitDataToCloud)
        {
            Serial.println("Curr Drive State");
            Serial.println(currDriveState);
            Serial.println("Transmit Data To Cloud");
            Serial.println(transmitDataToCloud);
            Serial.print(speedL);
            Serial.print(", ");
            Serial.print(speedR);
            Serial.print(", ");
            Serial.print(posX);
            Serial.print(", ");
            Serial.print(posY);
            Serial.print(", ");
            Serial.print(thetaDeg);
            Serial.print(", ");
            Serial.print(followLeft);
            Serial.print(", ");
            Serial.println(followRight);
            collectData(); // record 5 new values in the 5 arrays

            loop_count = 0;
        }
        loop_count++;
    }
}

void calibrate(int &VMax, int &VMin, int sensorPin, int testNo)
{
    int sensorValue = 0; // the sensor value
    VMin = 4095;         // minimum sensor value
    VMax = 0;            // maximum sensor value

    switch (testNo)
    {
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

    unsigned long startTime = millis();
    unsigned long curTime = startTime;

    while (curTime - startTime < 3500)
    {

        Serial.println("getting calibration values...");
        delay(100);

        curTime = millis();
        sensorValue = analogRead(sensorPin);
        Serial.println(sensorValue);

        if (sensorValue > VMax)
        {
            VMax = sensorValue;
        }
        if (sensorValue < VMin)
        {
            VMin = sensorValue;
        }
    }
    digitalWrite(ledPinL, LOW);
    digitalWrite(ledPinR, LOW);

    delay(2000);
}

// Function to update the position and orientation using the RK4 method
void updatePosition(unsigned long positionElapsedTime)
{
    // Compute time elapsed
    double delta_time = positionElapsedTime / 1000.0; // time elapsed in seconds

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
    if (thetaRad > PIVAL * 2)
    {
        thetaRad -= (PIVAL * 2);
    }
    else if (thetaRad < 0)
    {
        thetaRad += (PIVAL * 2);
    }
}

void updateLocalisation(double new_x, double new_y)
{
    prevLocalisation[0] = currLocalisation[0];
    prevLocalisation[1] = currLocalisation[1];
    currLocalisation[0] = new_x;
    currLocalisation[1] = new_y;

    Serial.println("Updated Localisation");

    // after localisation has been updated, do drift correction
    driftCorrection();
}

void driftCorrection()
{
    // this only happens after localisation is done and the prev and curr localization are updated
    Serial.println("prevLocalisation");
    Serial.println(prevLocalisation[0]);
    Serial.println(prevLocalisation[1]);
    Serial.println("currLocalisation");
    Serial.println(currLocalisation[0]);
    Serial.println(currLocalisation[1]);
    // before sending data to the topic, we need to drift-correct the data
    double a[2] = {prevLocalisation[0] - currLocalisation[0], prevLocalisation[1] - currLocalisation[1]};
    double m[2] = {posXArr[0] - posXArr[ARRAY_SIZE - 1], posYArr[0] - posYArr[ARRAY_SIZE - 1]};
    double magnitude_a = sqrt(sq(a[0]) + sq(a[1]));
    double magnitude_b = sqrt(sq(m[0]) + sq(m[1]));
    double alpha = atan2(a[1], a[0]) - atan2(m[1], m[0]);
    double beta = magnitude_a / magnitude_b;

    driftCorrect = true;
    
    for (int j = 1; j < ARRAY_SIZE; j++)
    {
        //posXArr[j] = prevLocalisation[0] + beta * (cos(alpha) * (posXArr[j] - prevLocalisation[0]) - sin(alpha) * (posYArr[j] - prevLocalisation[1]));
        //posYArr[j] = prevLocalisation[1] + beta * (sin(alpha) * (posXArr[j] - prevLocalisation[0]) + cos(alpha) * (posYArr[j] - prevLocalisation[1]));
        double tempPosX = posXArr[j];
        double tempPosY = posYArr[j];
        posXArr[j] = prevLocalisation[0] + beta * (cos(alpha) * (tempPosX - posXArr[0]) - sin(alpha) * (tempPosY - posYArr[0]));
        posYArr[j] = prevLocalisation[1] + beta * (sin(alpha) * (tempPosX - posXArr[0]) + cos(alpha) * (tempPosY - posYArr[0]));
    }
    Serial.println("Reached before Mutex");

    /*
    xSemaphoreTake(mutex_v, portMAX_DELAY);
    // send all the data to the topic
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        Serial.print(i);
        Serial.print(" Mutex ");
        char deadreckoning_payload[50] = {0};
        char pos_x_str[8];
        std::sprintf(pos_x_str, "%.2f", posXArr[i]);
        char pos_y_str[8];
        std::sprintf(pos_y_str, "%.2f", posYArr[i]);
        char theta_deg[8];
        std::sprintf(theta_deg, "%.2f", thetaArr[i]);
        char left_wall_str[8];
        std::sprintf(left_wall_str, "%d", leftWallArr[i]);
        char right_wall_str[8];
        std::sprintf(right_wall_str, "%d", rightWallArr[i]);

        std::strcat(deadreckoning_payload, pos_x_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, pos_y_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, theta_deg);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, left_wall_str);
        std::strcat(deadreckoning_payload, ",");
        std::strcat(deadreckoning_payload, right_wall_str);

        Serial.println("deadreckoning_payload");
        Serial.println(deadreckoning_payload);

        // xSemaphoreTake(mutex_v, portMAX_DELAY);
        MQTTclient.publish("deadreckoning_data", deadreckoning_payload);
        // delay(50); // small delay in between each publish
        // xSemaphoreGive(mutex_v);
       // delay(50); // small delay in between each publish
       
    }
    */
    //xSemaphoreGive(mutex_v);
    // after all the dead reckoning data has been drift corrected and published
    // start driving again
    startDrive();
}

void collectData()
{

    if (dataIndex >= ARRAY_SIZE)
    {
        // stop collecting data because it has been filled
        // this means stop driving, go do localisation, and then process the data after localisation before going back to driving

        dataIndex = 0;
        Serial.println("Finished collecting 30 pos points");
        startLocalise();
    }
    else
    {
        posXArr[dataIndex] = posX;
        posYArr[dataIndex] = posY;
        thetaArr[dataIndex] = thetaDeg;
        leftWallArr[dataIndex] = followLeft;
        rightWallArr[dataIndex] = followRight;

        dataIndex++;
        Serial.println("Data Index");
        Serial.println(dataIndex);
    }
}

void spinClockwise()
{
    stepperL.setSpeed(50);
    stepperR.setSpeed(50);
    stepperL.runSpeed();
    stepperR.runSpeed();
}

void stopSpinClockwise()
{
    stepperL.stop();
    stepperR.stop();
}