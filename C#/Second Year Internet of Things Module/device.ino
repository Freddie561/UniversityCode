#include <OledDisplay.h>
#include <Sensor.h>
#include "AZ3166WiFi.h"
#include "OledDisplay.h"
#include "EEPROMInterface.h"
#include "SerialLog.h"
#include "DevKitMQTTClient.h"
 
 
char ssid[] = "Technicians_WiFi";    
char password[] = "11370109"; 
int status = WL_IDLE_STATUS;    // the Wifi status


DevI2C *i2c;
HTS221Sensor *sensor;
float humidity = 0;
float temperature = 0;

int RED_LED = 20;
int GREEN_LED = 19;
int BLUE_LED = 39;


void setup() {
  // put your setup code here, to run once:
  Screen.init();
  Screen.print(2,"Waiting...");

  pinMode(USER_BUTTON_A,INPUT);
  pinMode(USER_BUTTON_B,INPUT);
  // initialize the pins as digital output.
  
  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BLUE_LED, OUTPUT);

  // initialise the sensor
  i2c = new DevI2C(D14, D15);
  sensor = new HTS221Sensor(*i2c);
  sensor -> init(NULL);

  while (status != WL_CONNECTED) {
       Screen.print("Connecting to:");
       Screen.print(1,ssid);
       // Connect to WPA/WPA2 network:
       status = WiFi.begin(ssid, password);
       // Wait 10 seconds for connection:
       delay(10000);
       Screen.clean();
   }
    
   Screen.print(1,"Connected IP is:");
   // function to output IP address - this will only run once
   printCurrentNet();
 
   // if WiFi is connected then write the specified IoT Hub device connection string to the EEPROM
   if (WiFi.begin() == WL_CONNECTED)
   {
   // Write the connection string to EEPROM as an array of uint8_t
   EEPROMInterface eeprom;
   char connString[] = "HostName=freddiep.azure-devices.net;DeviceId=frpalmer_mxchip;SharedAccessKey=OeATdeb58xTlHOzAtOEU9O4pqQ+dsiFss0/I0JCS99w=";
   int ret = eeprom.write((uint8_t*)connString, 
                          strlen(connString), 
                          AZ_IOT_HUB_ZONE_IDX);
                           
   // Check the write worked - 0 means it was written
   // Less than 0 is an error!
   if (ret < 0)
   {
      // LogError("Unable to get the connection string from EEPROM.");
       return;
   }
 
   // Connect to your IoT Hub device as normal, this will 
   // read the value you set for the connection string
   // with the below line of code a connection to your hub will be initalised
   // and the Azure LED on the board will turn blue!
   DevKitMQTTClient_Init();
   
   }
  

}

void sendData(const char *data) {
  time_t t = time(NULL);
  char buf[sizeof "2011-10-08T07:07:09Z"];
  strftime(buf, sizeof buf, "%FT%TZ", gmtime(&t));
 
  EVENT_INSTANCE* message = DevKitMQTTClient_Event_Generate(data, MESSAGE);
 
  DevKitMQTTClient_Event_AddProp(message, "$$CreationTimeUtc", buf);
  DevKitMQTTClient_Event_AddProp(message, "$$MessageSchema", "temperature;v1");
  DevKitMQTTClient_Event_AddProp(message, "$$ContentType", "JSON");
 
  DevKitMQTTClient_SendEventInstance(message);
}

void loop() {
  // put your main code here, to run repeatedly:
  // wait on button A press and display text
  if (digitalRead(USER_BUTTON_A) == LOW)
  {
    Screen.clean();
    
    // enable sensor and get value
    sensor -> enable();
    sensor -> getTemperature(&temperature);
    
    if(temperature < 25){
    
    analogWrite(GREEN_LED,255);
    // display temperature to screen
    char buff[16];
    sprintf(buff, "Temp:%sC\r\n", f2s(temperature, 1));
    Screen.print("It is below 25 Degrees");
    Screen.print(1, buff);
    delay(1500);
    Screen.clean();
    // send temp data to iot Hub
    char sensorData[200];
    sprintf_s(sensorData,
           sizeof(sensorData),
           "{\"temperature\":%s}",
           f2s(temperature, 1));
 
   sendData(sensorData);
    }
    else {
      analogWrite(RED_LED,255);
      // display temperature to screen
      char buff[16];
      sprintf(buff, "Temp:%sC\r\n", f2s(temperature, 1));
      Screen.print("It is above 25 Degrees");
      Screen.print(1, buff);
      delay(1500);
      Screen.clean();
    }
  }
  if (digitalRead(USER_BUTTON_B) == LOW)
  {
    Screen.clean();
    
    // enable sensor and get value
    sensor -> enable();
    sensor -> getHumidity(&humidity);

    // display temperature to screen
    char buff[16];
    sprintf(buff, "Humidity:%sC\r\n", f2s(humidity, 1));
    Screen.print(1, buff);
    delay(1500);
    Screen.clean();
  }
}

void printCurrentNet() {
 
   
    // print your WiFi IP address to display:  
    IPAddress ip = WiFi.localIP();
    Screen.print(2, ip.get_address());
 
}

