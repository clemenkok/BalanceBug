// #include <Wire.h>
// #include <math.h>

// #define CMP2_ADDRESS 0x30 // Replace with the actual I2C address of the CMP2 sensor
// TwoWire myWire(1); // Create a TwoWire instance with I2C interface 1

// void setup() {
//   myWire.begin(21, 22); // Initialize I2C communication with SDA pin 21 and SCL pin 22
//   Serial.begin(115200);



// //  CMP iNIT
//    myWire.begin();
//   myWire.beginTransmission(0x30);
//   myWire.write(0x07);
//   myWire.write(0x20); // command to internal config reg. 0 to perform a SET operation

//   myWire.endTransmission();

//   for(int i = 0;i < 100000; i++); //delay to allow the manufacturer suggested 10ms elapsed time for SET to execute

//   myWire.beginTransmission(0x30);
//   myWire.write(0x08);
//   myWire.write(0x00); //configures device for 16-bit output resolution and ~8ms measurement time
//   myWire.endTransmission();


// // CMP get measurement


//   Serial.println("getting measurement");
//   int fail = 0;
//   int temp = 0;
//   //uint8_t xL, xH, yL, yH, zL, zH;
 
//   myWire.beginTransmission(0x30);
//   myWire.write(0x07);
//   myWire.write(0x01);
//   fail = myWire.endTransmission();    


//    Serial.println("done measurement 1223");
//   myWire.beginTransmission(0x30);
//   myWire.write(0x06);
//   myWire.endTransmission();
//   do{Serial.println("im here");
//     temp = Wire.requestFrom(0x30, 1); 
//   } while(temp != 0x01);

   
//   Serial.println(temp);
// }

// void loop() {
//   myWire.beginTransmission(CMP2_ADDRESS);
//   myWire.write(0x03); // Register address of the sensor data
//   myWire.endTransmission();

//   myWire.requestFrom(CMP2_ADDRESS, 6); // Request 6 bytes of data

//   if (myWire.available() >= 6) {
//     int16_t x = myWire.read() << 8 | myWire.read();
//     int16_t y = myWire.read() << 8 | myWire.read();
//     int16_t z = myWire.read() << 8 | myWire.read();

//     // Calculate angles
//     float roll = atan2(y, z) * 180.0 / PI;
//     float pitch = atan2(-x, sqrt(y * y + z * z)) * 180.0 / PI;
//     float yaw = atan2(z, x) * 180.0 / PI;

//     // Process and use the roll, pitch, and yaw angles as needed

//     Serial.print("Roll: ");
//     Serial.print(roll);
//     Serial.print(" Pitch: ");
//     Serial.print(pitch);
//     Serial.print(" Yaw: ");
//     Serial.println(yaw);
//   }

//   delay(50); // Adjust the delay as needed
// }























// // // --------------------------------------
// // // i2c_scanner
// // //
// // // Modified from https://playground.arduino.cc/Main/I2cScanner/
// // // --------------------------------------

//  #include <Wire.h>

//  // Set I2C bus to use: Wire, Wire1, etc.
//  #define WIRE Wire
//  void setup() {
//    WIRE.begin();
//    WIRE.setTimeout(1000000, true);

//    Serial.begin(115200);
//    while (!Serial)
//       delay(10);
//    Serial.println("\nI2C Scanner");
//  }


//  void loop() {
//    byte error, address;
//    int nDevices;

//    Serial.println("Scanning...");

//    nDevices = 0;
//    for(address = 1; address < 127; address++ ) 
//    {
//      // The i2c_scanner uses the return value of
//      // the Write.endTransmisstion to see if
//      // a device did acknowledge to the address.
//      Serial.println(address);
//      WIRE.beginTransmission(address);
//      error = WIRE.endTransmission();

//      if (error == 0)
//      {
//        Serial.print("I2C device found at address 0x");
//        if (address<16) 
//          Serial.print("0");
//        Serial.print(address,HEX);
//        Serial.println("  !");

//        nDevices++;
//      }
//      else if (error==4) 
//      {
//        Serial.print("Unknown error at address 0x");
//        if (address<16) 
//          Serial.print("0");
//        Serial.println(address,HEX);
//      }    
//    }
//    if (nDevices == 0)
//      Serial.println("No I2C devices found\n");
//    else
//      Serial.println("done\n");

//    delay(5000);           // wait 5 seconds for next scan
//  }




















// // I2C Scanner
// // Written by Nick Gammon
// // Date: 20th April 2011

// #include <Wire.h>

// void setup() {
//   //Wire.setClock( 50000);
//   Serial.begin (115200);

//   Serial.println("asdas");

//   // Leonardo: wait for serial port to connect
//   while (!Serial) 
//     {
//     }

//   Serial.println ();
//   Serial.println ("I2C scanner. Scanning ...");
//   byte count = 0;
  
//   Wire.begin();
//   for (byte i = 8; i < 120; i++)
//   {
//     Serial.println(i);
//     Wire.beginTransmission (i);
//     if (Wire.endTransmission () == 0)
//       {
//       Serial.print ("Found address: ");
//       Serial.print (i, DEC);
//       Serial.print (" (0x");
//       Serial.print (i, HEX);
//       Serial.println (")");
//       count++;
//       delay (1);  // maybe unneeded?
//       } // end of good response
//   } // end of for loop
//   Serial.println ("Done.");
//   Serial.print ("Found ");
//   Serial.print (count, DEC);
//   Serial.println (" device(s).");
// }  // end of setup

// void loop() {}




















// /*
// * LAB: 17
// * Name: ESP32 I2C Scanner
// * Author: Khaled Magdy
// * For More Info Visit: www.DeepBlueMbedded.com
// */
  
// #include <Wire.h>

// #define I2C_Freq 100000
// #define SDA_0 21
// #define SCL_0 22

// TwoWire I2C_0 = TwoWire(0);

// void setup()
// {
//  Serial.begin(115200);
//  I2C_0.begin(SDA_0 , SCL_0 , I2C_Freq);
// }

// void loop()
// {
//  byte error, address;
//  int nDevices;
//  Serial.println("Scanning...");
//  nDevices = 0;
//  for(address = 1; address < 127; address++ )
//  {
//    // The i2c_scanner uses the return value of
//    // the Write.endTransmisstion to see if
//    // a device did acknowledge to the address.
//    I2C_0.beginTransmission(address);
//    error = I2C_0.endTransmission();
//    if (error == 0)
//    {
//      Serial.print("I2C device found at address 0x");
//      if (address<16)
//        Serial.print("0");
//      Serial.print(address,HEX);
//      Serial.println("  !");
//      nDevices++;
//    }
//    else if (error==4)
//    {
//      Serial.print("Unknown error at address 0x");
//      if (address<16)
//        Serial.print("0");
//      Serial.println(address,HEX);
//    }    
//  }
//  if (nDevices == 0)
//    Serial.println("No I2C devices found\n");
//  else
//    Serial.println("done\n");
//  delay(5000);           // wait 5 seconds for next scan
// }












// // my fucking new compass easy code

// #include <Wire.h>
// // QMC5883L Compass Library
// #include <QMC5883LCompass.h>

// QMC5883LCompass compass;

// void setup() {
//   // Initialize the serial port.
//   Serial.begin(115200);
//   // Initialize I2C.
//   Wire.begin();
//   // Initialize the Compass.
//   compass.init();
// }

// void loop() {
//   int x, y, z;

//   // Read compass values
//   compass.read();

//   x = compass.getX();
//   y = compass.getY();
//   z = compass.getZ();

//   Serial.print("X: ");
//   Serial.print(x);
//   Serial.print("   Y: ");
//   Serial.print(y);
//   Serial.print("   Z: ");
//   Serial.println(z);

//   delay(300);
// }











// // my fucking new compass harder code


// #include <Arduino.h>
// #include <Wire.h>
// #include "HMC5883L_Simple.h"

// // Create a compass
// HMC5883L_Simple Compass;

// void setup()
// {
//   Serial.begin(115200);
//   Wire.begin();
    
//   // Magnetic Declination is the correction applied according to your present location
//   // in order to get True North from Magnetic North, it varies from place to place.
//   // 
//   // The declination for your area can be obtained from http://www.magnetic-declination.com/
//   // Take the "Magnetic Declination" line that it gives you in the information, 
//   //
//   // Examples:
//   //   Christchurch, 23° 35' EAST
//   //   Wellington  , 22° 14' EAST
//   //   Dunedin     , 25° 8'  EAST
//   //   Auckland    , 19° 30' EAST
//   //    
//   Compass.SetDeclination(0, 43, 'E');  
  
//   // The device can operate in SINGLE (default) or CONTINUOUS mode
//   //   SINGLE simply means that it takes a reading when you request one
//   //   CONTINUOUS means that it is always taking readings
//   // for most purposes, SINGLE is what you want.
//   Compass.SetSamplingMode(COMPASS_SINGLE);
  
//   // The scale can be adjusted to one of several levels, you can probably leave it at the default.
//   // Essentially this controls how sensitive the device is.
//   //   Options are 088, 130 (default), 190, 250, 400, 470, 560, 810
//   // Specify the option as COMPASS_SCALE_xxx
//   // Lower values are more sensitive, higher values are less sensitive.
//   // The default is probably just fine, it works for me.  If it seems very noisy
//   // (jumping around), incrase the scale to a higher one.
//   Compass.SetScale(COMPASS_SCALE_130);
  
//   // The compass has 3 axes, but two of them must be close to parallel to the earth's surface to read it, 
//   // (we do not compensate for tilt, that's a complicated thing) - just like a real compass has a floating 
//   // needle you can imagine the digital compass does too.
//   //
//   // To allow you to mount the compass in different ways you can specify the orientation:
//   //   COMPASS_HORIZONTAL_X_NORTH (default), the compass is oriented horizontally, top-side up. when pointing North the X silkscreen arrow will point North
//   //   COMPASS_HORIZONTAL_Y_NORTH, top-side up, Y is the needle,when pointing North the Y silkscreen arrow will point North
//   //   COMPASS_VERTICAL_X_EAST,    vertically mounted (tall) looking at the top side, when facing North the X silkscreen arrow will point East
//   //   COMPASS_VERTICAL_Y_WEST,    vertically mounted (wide) looking at the top side, when facing North the Y silkscreen arrow will point West  
//   Compass.SetOrientation(COMPASS_HORIZONTAL_X_NORTH);
  
// }

// // Our main program loop.
// void loop()
// {
//    float heading = Compass.GetHeadingDegrees();
   
//    Serial.print("Heading: \t");
//    Serial.println( heading );   
//    delay(500);
// }










//fuck 3
#include <QMC5883L.h>
#include <Wire.h>

QMC5883L compass;

#define DECLINATION 0

void setup()
{
	Wire.begin();
  Serial.begin(115200);
  Serial.println("QMC5883L Compass Demo");
	Serial.println("Turn compass in all directions to calibrate....");


	compass.init();
	compass.setSamplingRate(50);

}

void loop()
{
  Serial.println("start");
	int heading = compass.readHeading();
  Serial.println("end");
	if(heading==0) {
		/* Still calibrating, so measure but don't print */
    Serial.println("calibrating this fuck");
	} else {
    int temp = heading + DECLINATION;
    temp = temp>360? temp-360 : temp;
		Serial.println(temp);
	}
}










 






// // /************************************************************************

// //   Test of the Pmod

// // *************************************************************************

// //   Description: Pmod_CMPS2
// //   Calculates the heading of the device form the X and Y components of the magnetic field

// //   Wiring
// //   Module<----------> Arduino
// //   VCC     to        3V3
// //   GND     to        GND
// //   SCL     to        A5 (SCL)
// //   SDA     to        A4 (SDA)

// // *************************************************************************/

// // The earth's magnetic field varies according to its location.
// // Add or subtract a constant to get the right value
// // of the magnetic field using the following site
// // http://www.ngdc.noaa.gov/geomag-web/#declination

// #define DECLINATION 6.11 // declination (in degrees) in Saint George (Romania).

// /************************************************************************/

// #include <Wire.h> //including library for I2C communication

// unsigned char CMPS2_address = 0x30; //I2C address of the device

// //store highest, middle and lowest values, x component and y component
// float Max[2], Mid[2], Min[2], X, Y;

// void setup() {
//   Serial.begin(115200); //serial initialization

//   Serial.println("asdas1");
//   pinMode(13, OUTPUT);
//   delay(10);
//   CMPS2_init(); //initialize the compass
//   Serial.println("asdas2");
// }

// void loop() {
//   delay(500);

//   //retrieving and displaying the heading of the compass
//   float measured_angle = CMPS2_getHeading();
//   Serial.print("Heading = ");
//   Serial.print(measured_angle);
//   Serial.print("°");
//   Serial.print('\t');

//   CMPS2_decodeHeading(measured_angle);  //get direction
// }

// void CMPS2_decodeHeading(float measured_angle) {
//   //decoding heading angle according to datasheet
//   if (measured_angle > 337.25 | measured_angle < 22.5) {
//     Serial.println("North");
//     digitalWrite(13, HIGH);
//   }
//   else {
//     digitalWrite(13, LOW);
//     if (measured_angle > 292.5) {
//       Serial.println("North-West");
//     }
//     else if (measured_angle > 247.5) {
//       Serial.println("West");
//     }
//     else if (measured_angle > 202.5) {
//       Serial.println("South-West");
//     }
//     else if (measured_angle > 157.5) {
//       Serial.println("South");
//     }
//     else if (measured_angle > 112.5) {
//       Serial.println("South-East");
//     }
//     else if (measured_angle > 67.5) {
//       Serial.println("East");
//     }
//     else {
//       Serial.println("North-East");
//     }
//   }
// }

// float CMPS2_getHeading(void) {
//   float components[2];
//   CMPS2_set(false);   //set the polarity to normal
//   CMPS2_read_XYZ();  //read X, Y, Z components of the magnetic field
//   components[0] = X;  //save current results
//   components[1] = Y;
//   CMPS2_set(true);   //set the polarity to normal
//   CMPS2_read_XYZ();  //read X, Y, Z components of the magnetic field

//   //eliminate offset from all components
//   components[0] = (components[0] - X) / 2.0;
//   components[1] = (components[1] - Y) / 2.0;

//   //variables for storing partial results
//   float temp0 = 0;
//   float temp1 = 0;
//   //and for storing the final result
//   float deg = 0;

//   //calculate heading from components of the magnetic field
//   //the formula is different in each quadrant
//   if (components[0] < Mid[0])
//   {
//     if (components[1] > Mid[1])
//     {
//       //Quadrant 1
//       temp0 = components[1] - Mid[1];
//       temp1 = Mid[0] - components[0];
//       deg = 90 - atan(temp0 / temp1) * (180 / 3.14159);
//     }
//     else
//     {
//       //Quadrant 2
//       temp0 = Mid[1] - components[1];
//       temp1 = Mid[0] - components[0];
//       deg = 90 + atan(temp0 / temp1) * (180 / 3.14159);
//     }
//   }
//   else {
//     if (components[1] < Mid[1])
//     {
//       //Quadrant 3
//       temp0 = Mid[1] - components[1];
//       temp1 = components[0] - Mid[0];
//       deg = 270 - atan(temp0 / temp1) * (180 / 3.14159);
//     }
//     else
//     {
//       //Quadrant 4
//       temp0 = components[1] - Mid[1];
//       temp1 = components[0] - Mid[0];
//       deg = 270 + atan(temp0 / temp1) * (180 / 3.14159);
//     }
//   }

//   //correct heading
//   deg += DECLINATION;
//   if (DECLINATION > 0)
//   {
//     if (deg > 360) {
//       deg -= 360;
//     }
//   }
//   else
//   {
//     if (deg < 0) {
//       deg += 360;
//     }
//   }

//   return deg;
// }

// //reads measurements in mG
// void CMPS2_read_XYZ(void) {
//   //command internal control register 0 bit 0 (measure)
//   Wire.beginTransmission(CMPS2_address);
//   Wire.write(0x07);
//   Wire.write(0x01);
//   Wire.endTransmission();
//   delay(8);

//   //wait for measurement to be completed
//   bool flag = false;
//   while (!flag) {
//     //jump to status register
//     Wire.beginTransmission(CMPS2_address);
//     Wire.write(0x06);
//     Wire.endTransmission();

//     //read its value
//     Wire.requestFrom(CMPS2_address, (uint8_t)1);
//     int temporal = 0;
//     if (Wire.available()) {
//       temporal = Wire.read();
//     }

//     //if the last bit is 1, data is ready
//     temporal &= 1;
//     if (temporal != 0) {
//       flag = true;
//     }
//   }

//   //move address pointer to first address
//   Wire.beginTransmission(CMPS2_address);
//   Wire.write(0x00);
//   Wire.endTransmission();

//   //save data
//   Wire.requestFrom(CMPS2_address, (uint8_t)6);
//   byte tmp[6] = {0, 0, 0, 0, 0, 0}; //array for raw data
//   if (Wire.available()) {
//     for (int i = 0; i < 6; i++) {
//       tmp[i] = Wire.read(); //save it
//     }
//   }

//   //initialize array for data
//   float measured_data[2];

//   //reconstruct raw data
//   measured_data[0] = 1.0 * (int)(tmp[1] << 8 | tmp[0]); //x
//   measured_data[1] = 1.0 * (int)(tmp[3] << 8 | tmp[2]); //y

//   //convert raw data to mG
//   for (int i = 0; i < 2; i++) {
//     measured_data[i] = 0.48828125 * (float)measured_data[i];
//   }

//   X = measured_data[0];
//   Y = measured_data[1];

//   //correct minimum, mid and maximum values
//   if (measured_data[0] > Max[0]) { //x max
//     Max[0] = measured_data[0];
//   }
//   if (measured_data[0] < Min[0]) { //x min
//     Min[0] = measured_data[0];
//   }
//   if (measured_data[1] > Max[1]) { //y max
//     Max[1] = measured_data[1];
//   }
//   if (measured_data[1] < Min[1]) { //y min
//     Min[1] = measured_data[1];
//   }
//   for (int i = 0; i < 2; i++) { //mid
//     Mid[i] = (Max[i] + Min[i]) / 2;
//   }

//   return;
// }

// //initialize the compass
// void CMPS2_init(void) {

// // Wire.setClock(400000);

//   Wire.begin(); // initialization of I2C bus


//   //command internal control register 0 for set operation
//   Wire.beginTransmission(CMPS2_address);
//   Wire.write(0x07);Serial.println("sa2sd");
//   Wire.write(0x20);Serial.println("sa2d");
//   Wire.endTransmission();Serial.println("sa222d");
//   delay(10);  

//   //command internal control register 1 to 16 bit resolution, 8ms measurement time
//   Wire.beginTransmission(CMPS2_address);
//   Wire.write(0x08);
//   Wire.write(0x00);
//   Wire.endTransmission();
//   delay(10);

//   //initialize minimum, mid and maximum values
//   for (int i = 0; i < 2; i++) {
//     Max[i] = -32768;  //smallest int on 16 bits
//     Min[i] = 32767;  //largest int on 16 bits
//     Mid[i] = 0;
//   }
// }

// //sets/resets the sensor, changing the magnetic polarity of the sensing element
// void CMPS2_set(bool reset) {
//   //command internal control register 0 bit 7 (capacitor recharge)
//   Wire.beginTransmission(CMPS2_address);
//   Wire.write(0x07);
//   Wire.write(0x80);
//   Wire.endTransmission();
//   delay(50);

//   if (reset) {
//     //command internal control register 0 bit 6 (reset)
//     Wire.beginTransmission(CMPS2_address);
//     Wire.write(0x07);
//     Wire.write(0x40);
//     Wire.endTransmission();
//     delay(10);
//   }
//   else {
//     //command internal control register 0 bit 5 (set)
//     Wire.beginTransmission(CMPS2_address);
//     Wire.write(0x07);
//     Wire.write(0x20);
//     Wire.endTransmission();
//     delay(10);
//   }
//   return;
// }
