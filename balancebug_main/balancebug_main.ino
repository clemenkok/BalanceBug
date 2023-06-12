#include "imu_processing.hpp"
#include "stepper_motor_control.hpp"
#include "controller.hpp"

#define INTERVAL_MS_PRINT 200
#define OUTER_VELO_LOOP_ON 1

// LPF Vars
LowPassFilter wheelSpeedFilter = LowPassFilter(0.001, millis()); // Tf = 1ms (filter time constant)
double filteredWheelSpeed = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

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
  
  if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT && OUTER_VELO_LOOP_ON) {
    // update the velo PID (have to change the rate of this controller)
  
    // compute the current velo based on wheel speed
    // 21.2cm per 200 steps
    // motor speed is in steps per sec
    // do velo in cm/s
    // curr velo = motorspeed/200*21.2

    double currentMotorSpeedInSteps = filteredWheelSpeed;
    double currentVelo =  currentMotorSpeedInSteps / 200 * 21.2;
    Serial.println(currentMotorSpeedInSteps);
    //Serial.println(currentVelo);
    
    updateVeloInput(currentVelo);

    // This should already be covered under the controller
    double veloControllerOutput = computeVeloControllerOutput();
    setRollSetpoint(veloControllerOutput);
  }
  
  // update the roll PID
  updateRollInput(getRoll());
  double motorSpeedAngularVelo = computeRollControllerOutput();
  //Serial.println(getRoll());
  setMotorSpeedAngularVelo(motorSpeedAngularVelo, 1);
  setMotorSpeedAngularVelo(motorSpeedAngularVelo, 2);
  runstepperMotors();

  // put the current wheel speed into the LPF
  filteredWheelSpeed = wheelSpeedFilter(getMotorSpeedInSteps(), millis());
  
}
