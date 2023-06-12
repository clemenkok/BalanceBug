#include "imu_processing.hpp"
#include "stepper_motor_control.hpp"
#include "controller.hpp"

#define INTERVAL_MS_PRINT 100

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

  updateImuReadings();
  /*
  if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT) {
    
    Serial.print("pitch:");
    Serial.println(getPitch());
    Serial.print("roll:");
    Serial.println(getRoll());
  }
  */
  updateRollInput(getRoll());
  double motorSpeedAngularVelo = computeRollControllerOutput();
  Serial.println(getRoll());
  //Serial.println(motorSpeedAngularVelo);
  //Serial.println(angularVeloToStepSpeed(motorSpeedAngularVelo));
  setMotorSpeedAngularVelo(motorSpeedAngularVelo, 1);
  setMotorSpeedAngularVelo(motorSpeedAngularVelo, 2);
  runstepperMotors();
  delay(5);
}
