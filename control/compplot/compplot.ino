#include "imu_processing.hpp"


#define INTERVAL_MS_PRINT 800


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

  imuSetup();
  Serial.println("starting bitch");

}

unsigned long lastPrintMillis = 0;





// void loop() {
//   // put your main code here, to run repeatedly:
//   unsigned long currentMillis = millis();
//   //Serial.println("loop");
  
//   updateImuReadings();
  
//   if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT && OUTER_VELO_LOOP_ON) {
//     // update the velo PID (have to change the rate of this controller)
  
//     // compute the current velo based on wheel speed
//     // 21.2cm per 200 steps
//     // motor speed is in steps per sec
//     // do velo in cm/s
//     // curr velo = motorspeed/200*21.2

//     double currentMotorSpeedInSteps = filteredWheelSpeed;
//     double currentVelo =  currentMotorSpeedInSteps / 200 * 21.2;
//     Serial.println(currentMotorSpeedInSteps);
//     //Serial.println(currentVelo);
    
//     updateVeloInput(currentVelo);

//     // This should already be covered under the controller
//     double veloControllerOutput = computeVeloControllerOutput();
//     setRollSetpoint(veloControllerOutput);
//   }
//   // if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT){
//   //   // update the roll PID
//   //   filteredRoll = rollFilter(getRoll(), millis());
//   //   updateRollInput(filteredRoll);
//   //   double motorSpeedAngularVelo = computeRollControllerOutput(); //
//   //   Serial.println(filteredRoll);
//   //   setMotorSpeedAngularVelo(-motorSpeedAngularVelo, 1);
//   //   setMotorSpeedAngularVelo(-motorSpeedAngularVelo, 2);
//   // }

//   filteredRoll = rollFilter(getRoll(), millis());
//   //updateRollInput(filteredRoll);
//   updateRollInput(getRoll());
//   double motorSpeedAngularVelo = computeRollControllerOutput(); //
//   //Serial.println(filteredRoll);
//   Serial.println(getRoll());
//   //Serial.println(getError());

  
//   setMotorSpeedAngularVelo(motorSpeedAngularVelo, 1);
//   //Serial.println(motorSpeedAngularVelo);
//   setMotorSpeedAngularVelo(motorSpeedAngularVelo, 2);

//   runstepperMotors();
//   //delay(10);

//   // put the current wheel speed into the LPF
//   //filteredWheelSpeed = wheelSpeedFilter(getMotorSpeedInSteps(), millis());
  
  
// }





void loop() {
  // put your main code here, to run repeatedly:
  unsigned long currentMillis = millis();

  // Read Raw Data and Perform Complementary Filter
  
  updateImuReadings();
  
  if (currentMillis - lastPrintMillis > INTERVAL_MS_PRINT) {
    
    //Serial.print("pitch:");
    //Serial.println(getPitch());
    // Serial.print("roll:");
    // Serial.println(getRoll());
    

    //Serial.println("Yaw Rate");
    //Serial.println(getYawRate());
    
    // Serial.println("---Accel Readings --------------------");
    // Serial.println(accelerometerRawData.x); // Pitch 
    // Serial.println(accelerometerRawData.y); // Roll
    // Serial.println(accelerometerRawData.z); // Yaw

    // Serial.println("---Accel with Gravity Removed----");
    // Serial.println(accelerometerGravityRemoved.x); // Pitch
    // Serial.println(accelerometerGravityRemoved.y); // Roll
    // Serial.println(accelerometerGravityRemoved.z); // Yaw
    
    
    //Serial.println(linear_velocity);
  }
}
