// LDR pin
const int ldrPinL = ??;
const int ldrPinR = ??;

// Motor pins
const int leftMotorPin = ?;
const int rightMotorPin = ?;

// Thresholds
const int lightThreshold = ???; // Adjust this value based on lighting conditions
const int turnThreshold = ???;  // Adjust this value based on desired sensitivity

void setup() {
  // Set motor pins as output
  pinMode(leftMotorPin, OUTPUT);
  pinMode(rightMotorPin, OUTPUT);
}

String getDirection() {
  // Read LDR value
  int ldrValueL = analogRead(ldrPinL);
  int ldrValueR = analogRead(ldrPinR);

  // Determine the difference between LDR value and light threshold
  // this will be changed! based on what our concept is
  int differenceL = ldrValueL - lightThreshold;
  int differenceR = ldrValueR - lightThreshold;

  // Check if the difference exceeds the turn threshold
  if (differenceL > turnThreshold && differenceR < turnThreshold) {
      turnLeft();
      return "left";
    } else if (differenceR > turnThreshold && differenceL < turnThreshold){
      turnRight();
      return "right";
    } else {
    // Go straight
    goStraight();
    return "straight";
  }
}

// Function to turn left
void turnLeft() {
  digitalWrite(leftMotorPin, LOW);
  digitalWrite(rightMotorPin, HIGH);
}

// Function to turn right
void turnRight() {
  digitalWrite(leftMotorPin, HIGH);
  digitalWrite(rightMotorPin, LOW);
}

// Function to go straight
void goStraight() {
  digitalWrite(leftMotorPin, HIGH);
  digitalWrite(rightMotorPin, HIGH);
}






