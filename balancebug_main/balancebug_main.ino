#include "imu_processing.hpp"
#include "stepper_motor_control.hpp"
#include "controller.hpp"

const int MS_PIN1 = 4;
const int MS_PIN2 = 15;
const int MS_PIN3 = 27;
#define INTERVAL_MS_PRINT 200
#define OUTER_VELO_LOOP_ON 0

// LPF Vars
LowPassFilter wheelSpeedFilter = LowPassFilter(0.001, millis()); // Tf = 1ms (filter time constant)
double filteredWheelSpeed = 0;

int speed = 0;
double currRoll = 0.0;
int count = 0;
double veloControllerOutput;
double currentVelo;

// LowPassFilter rollFilter = LowPassFilter(0.25, millis()); // Tf = 1ms (filter time constant)
// double filteredRoll = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

  pinMode(MS_PIN1, OUTPUT);
  pinMode(MS_PIN2, OUTPUT);
  pinMode(MS_PIN3, OUTPUT);
  imuSetup();
  stepperMotorSetup();
  controllerSetup();

}

unsigned long lastPrintMillis = 0;

void loop() {
  // put your main code here, to run repeatedly:
  unsigned long currentMillis = millis();
  //Serial.println("loop");
  
  updateImuReadings();
  
  //if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT && OUTER_VELO_LOOP_ON) {
  if (OUTER_VELO_LOOP_ON){
    // update the velo PID (have to change the rate of this controller)
  
    // compute the current velo based on wheel speed
    // 21.2cm per 200 steps
    // motor speed is in steps per sec
    // do velo in cm/s
    // curr velo = motorspeed/200*21.2

    double currentMotorSpeedInSteps = filteredWheelSpeed;
    //double currentMotorSpeedInSteps = speed;
    currentVelo =  currentMotorSpeedInSteps / 200 * 21.2;
    // Serial.println("current motor speed in steps");
    // Serial.println(currentMotorSpeedInSteps);
    // Serial.println("current velocity");
    // Serial.println(currentVelo);
    updateVeloInput(currentVelo);

    // This should already be covered under the controller
    veloControllerOutput = computeVeloControllerOutput();
    setRollSetpoint(veloControllerOutput);





    // Serial.println("roll setpoint from veloPID");
    // Serial.println(veloControllerOutput);
  }


  // if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT){
  //   // update the roll PID
  //   filteredRoll = rollFilter(getRoll(), millis());
  //   updateRollInput(filteredRoll);
  //   double motorSpeedAngularVelo = computeRollControllerOutput(); //
  //   Serial.println(filteredRoll);
  //   setMotorSpeedAngularVelo(-motorSpeedAngularVelo, 1);
  //   setMotorSpeedAngularVelo(-motorSpeedAngularVelo, 2);
  // }

  //filteredRoll = rollFilter(getRoll(), millis());
  //updateRollInput(filteredRoll);


  // veloPID will output rollPID setpoint
  // rollPID input will be currRoll
  // 

  currRoll = getRoll();
  updateRollInput(currRoll);
  // Serial.print("ROLL: ");
  // Serial.println(currRoll);
  
  double motorSpeedSteps = computeRollControllerOutput(); 
  //Serial.println(filteredRoll);
  //Serial.println(getRoll());
  //Serial.println(getError());

  // Serial.print("motorspeedsteps: ");
  // Serial.println(motorSpeedSteps);
  if (abs(motorSpeedSteps) <= 50){ // move in 16th steps
  //if (abs(currRoll-setpoint)<=3){
    // configure le three pins
    digitalWrite(MS_PIN1, HIGH);
    digitalWrite(MS_PIN2, HIGH);
    digitalWrite(MS_PIN3, HIGH);
    speed = motorSpeedSteps * 16;

  }
  else if (abs(motorSpeedSteps) <= 100){
    // configure three pins to move in 8th steps
    speed = motorSpeedSteps * 8;
    digitalWrite(MS_PIN1, HIGH);
    digitalWrite(MS_PIN2, HIGH);
    digitalWrite(MS_PIN3, LOW);
  }
  else if (abs(motorSpeedSteps) <= 200){
    // configure three pins to move in quarter steps
    speed = motorSpeedSteps * 4;
    digitalWrite(MS_PIN1, LOW);
    digitalWrite(MS_PIN2, HIGH);
    digitalWrite(MS_PIN3, LOW);
  }
  else if (abs(motorSpeedSteps) <= 400){
    // configure three pins to move in half steps
    speed = motorSpeedSteps * 2;
    digitalWrite(MS_PIN1, HIGH);
    digitalWrite(MS_PIN2, LOW);
    digitalWrite(MS_PIN3, LOW);
  }
  else{ // case where speed is really fast
    speed = motorSpeedSteps;
    digitalWrite(MS_PIN1, LOW);
    digitalWrite(MS_PIN2, LOW);
    digitalWrite(MS_PIN3, LOW);
  }
  
  //Serial.println(speed);
  // if (speed<0){
  //   simpleSetSpeed(speed-1000,1);
  //   simpleSetSpeed(speed-1000,2);
  //   digitalWrite(MS_PIN1, HIGH);
  //   digitalWrite(MS_PIN2, HIGH);
  //   digitalWrite(MS_PIN3, LOW);
  // }
  // else{
  //   simpleSetSpeed(speed, 1);
  //   //Serial.println(motorSpeedAngularVelo);
  //   simpleSetSpeed(speed, 2);
  // }
  simpleSetSpeed(speed, 1);
  // //Serial.println(motorSpeedAngularVelo);
  simpleSetSpeed(speed, 2);
  // Serial.println(currRoll);
  runstepperMotors();
  
  // if (currentMillis - lastPrintMillis > 200 ){
  //   Serial.println("turn?");
  //   turningMotors(speed, 1);
  // }


  // put the current wheel speed into the LPF
  filteredWheelSpeed = wheelSpeedFilter(motorSpeedSteps, millis());

  if (count >= 20){
    Serial.print("veloInput, veloOutput/roll setpoint, rollInput, rollOutput, speed: ");
    Serial.print(currentVelo);
    Serial.print(", ");
    Serial.print(veloControllerOutput);
    Serial.print(", ");
    Serial.print(currRoll);
    Serial.print(", ");
    Serial.print(motorSpeedSteps);
    Serial.print(", ");
    Serial.println(speed);

    // Serial.print(potVal);
    // Serial.print(", ");
    // Serial.print(Kp);
    // Serial.print(", ");
    // Serial.print(Ki);
    // Serial.print(", ");
    // Serial.println(Kd);
    count = 0;
  }
  count++;
  
  
}
