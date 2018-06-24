/*
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GPS.h>
#include <Adafruit_ADS1015.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <RH_RF95.h>
#include "bitmap_logos.h"
#include "globals.h"

// what's the name of the hardware serial port?
#define GPSSerial Serial1
// Connect to the GPS on the hardware port
Adafruit_GPS GPS(&GPSSerial);

//Define the Pins for the Lora Radio
#define RFM95_CS 8
#define RFM95_RST 4
#define RFM95_INT 7
//Define Frequency for radio
#define RF95_FREQ 915.0
//Create the Radio
RH_RF95 rf95(RFM95_CS, RFM95_INT);


//Define LED Pin 
#define LED 13

//Define Scaling factors for sensors
#define PrimaryCorrect 0.0653
#define Shunt .0005

//Defines Client and server
#define CLIENT_ADDRESS 1
#define SERVER_ADDRESS 2




//create the ADC device
Adafruit_ADS1015 ads1015;





//Setup for the LCD matrix
//LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);


     

uint32_t timer = millis();


void none()
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  //Set Pin Mode for LED blink
  pinMode(13, OUTPUT);

  //*********Begin LCD*******
  //lcd.begin(20,4);
  //lcd.backlight(); // finish with backlight on  

  //lcd.clear();
  //lcd.print("Booting");
 
  //********Begin the Analog to digital converter*******
  ads1015.begin();
  
  
  //*******Begin GPS Module******************
  // connect at 115200 so we can read the GPS fast enough and echo without dropping chars
  // also spit it out
  Serial.begin(115200);
  Serial.println("Adafruit GPS library basic test!");
     
  // 9600 NMEA is the default baud rate for Adafruit MTK GPS's- some use 4800
  GPS.begin(9600);
  GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCGGA);
  // uncomment this line to turn on only the "minimum recommended" data
  //GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);
  // For parsing data, we don't suggest using anything but either RMC only or RMC+GGA since
  // the parser doesn't care about other sentences at this time
  // Set the update rate
  GPS.sendCommand(PMTK_SET_NMEA_UPDATE_200_MILLIHERTZ); // 1 Hz update rate
  // For the parsing code to work nicely and have time to sort thru the data, and
  // print it out we don't suggest using anything higher than 1 Hz
     
  // Request updates on antenna status, comment out to keep quiet
  GPS.sendCommand(PGCMD_ANTENNA);
  // Ask for firmware version
  GPSSerial.println(PMTK_Q_RELEASE);

  //*********Begin Radio module************
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
 

  delay(100);
 
  Serial.println("Feather LoRa TX Test!");
 
  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);
 
  while (!rf95.init()) {
    Serial.println("LoRa radio init failed");
    while (1);
  }
  Serial.println("LoRa radio init OK!");
 
  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);
  
  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then 
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
}

void more() // run over and over again
{
  int16_t adc0, adc1, adc2, adc3, current;
  
  // read data from the GPS in the 'main loop'
   char c = GPS.read();
  // if you want to debug, this is a good time to do it!
  // if a sentence is received, we can check the checksum, parse it...
  if (GPS.newNMEAreceived()) {
    // a tricky thing here is if we print the NMEA sentence, or data
    // we end up not listening and catching other sentences!
    // so be very wary if using OUTPUT_ALLDATA and trytng to print out data
      
      //Read the analog to digital converter voltages
      adc0 = ads1015.readADC_SingleEnded(0);
      adc1 = ads1015.readADC_SingleEnded(1);
      adc2 = ads1015.readADC_SingleEnded(2);
      adc3 = ads1015.readADC_SingleEnded(3);

      
      current = ((adc3*PrimaryCorrect)-(adc3*PrimaryCorrect))*(1/Shunt);
      
      if (GPS.fix) {
//     
//      lcd.clear();
//      lcd.setCursor(0, 0);
//      lcd.print("Aux  Volt: " + String(adc0*PrimaryCorrect));
//      lcd.setCursor(0, 1);
//      lcd.print("Main Volt: " + String(adc1*PrimaryCorrect));
//      lcd.setCursor(0, 2);
//      lcd.print("Current: " + String(round((current)*10)/10));
//      lcd.setCursor(0, 3);
//      lcd.print("Speed: " + String(round((GPS.speed)*10)/10));


      uint8_t data[120];

      //Create Output sting
      String FinalString= String(GPS.hour)+":"+String(GPS.minute)+":"+String(GPS.seconds)+ ", " + String((adc0*PrimaryCorrect),4)+ ", " + String((adc1*PrimaryCorrect),4) + ", " + String((current),4) + ", "+ String(GPS.latitude,4) + String(GPS.lat) + ", " + String(GPS.longitude,4) + String(GPS.lon) + ", " + String(GPS.speed);
 
    //convert output sting to bytes (uint8_t) that can be transmitted
     FinalString.toCharArray((char*)data, FinalString.length());

    //transmit the data string
    rf95.send((uint8_t *)data, sizeof(data));
    GPS.fix =false ;
    
    }
  
   if (!GPS.parse(GPS.lastNMEA())) // this also sets the newNMEAreceived() flag to false
      return; // we can fail to parse a sentence in which case we should just wait for another
  }
 
}
*/

