//Intro to IM Final Project: Soojin Lee
//Title: Dream Cafe
//April 14 - April 28, 2021
//Description: This is Soojin's Intro to IM final project. 
//It is a game for those of who want to have an experience of opening up a cafe; from choosing a location, setting up the cafe environment,
//receiving orders from the customers, and serving them a beautiful latte art coffee. 
//Please follow the instruction carefully to enjoy the game.

//Instruction: 
// 1) Choose a city where you want to open a cafe (It will light up on the map!)
// 2) Turn on the light and set the music of your choice 
// To turn on the light: Shed a light to the photoresister 
// To select a music: Dial the ORANGE potentiometer 

// 3) Once you set up the light and the music, customers will start to come. 
// 4) Press yellow button to receive an order. (Press the button until your friend says "Stop")
// 5) Type in the order that the spinning wheel indicates and press ENTER
// 6) Start drawing Latte Art and make coffee for the customer 
      //Dial PINK potentiometer to adjust the brush stroke size
// 7) Once you finish making coffee, press READY to serve the coffee to the customer. 
// 8) Press RESTART to restart the game!
// Enjoy!!!



//including libraries
#include <Servo.h>

char val; //data received from the serial port
const int tokyoLEDPin = 7;
const int shanghaiLEDPin = 6;
const int newyorkLEDPin = 5;
const int abudhabiLEDPin = 4;
const int yellowButton = A2;



const int potentiometerPin = A0;
const int photoresistorPin = A1;
const int potentiometer2Pin = A4;



class Sweeper
{
    Servo servo;
    int pos;
    int increment;
    int  updateInterval;
    unsigned long lastUpdate;

  public:
    Sweeper(int interval)
    {
      updateInterval = interval;
      increment = 1;
    }

    void Attach(int pin)
    {
      servo.attach(pin);
    }

    void Detach()
    {
      servo.detach();
    }

    //update position of servo
    void Update()
    {
      if ((millis() - lastUpdate) > updateInterval)// time to update
      {
        lastUpdate = millis();
        pos += increment;
        servo.write(pos);
        Serial.println(pos);
        if ((pos >= 180) || (pos <= 0))
        {
          // reverse direction
          increment = -increment;
        }
      }
    }
};

Sweeper sweeper(15);

void setup() {
  Serial.begin(9600);
  establishContact();
  pinMode (tokyoLEDPin , OUTPUT);
  pinMode (shanghaiLEDPin , OUTPUT);
  pinMode (newyorkLEDPin , OUTPUT);
  pinMode (abudhabiLEDPin , OUTPUT);
  pinMode (yellowButton, INPUT);
  sweeper.Attach(9);

}

void loop() {
  //read the value of the potentiometer for choosing music (ANALOG)
  int pmsensorValue = analogRead (potentiometerPin);
  byte chooseSong = map(pmsensorValue, 0, 1023, 0, 5);

   //read the value of the potentiometer for brush stroke size(ANALOG)
  int pmsensor2Value = analogRead (potentiometer2Pin);
  byte brushSize = map(pmsensor2Value, 0, 1023, 3, 10);

  //read the value of the photoresistor (ANALOG)
  int photoValue = analogRead (photoresistorPin);
  byte chooseLighting = map(photoValue, 0, 1023, 0, 2);


  if (digitalRead(yellowButton) == HIGH) {
    sweeper.Update();
  }

  Serial.print(chooseSong);  //Serial.print value of potentiometer value converted to song
  Serial.print(','); //separate using comma
  Serial.print(chooseLighting);  //Serial.print value of photoresistor value converted to lighting
  Serial.print(','); //separate using comma
  Serial.println(brushSize);  //Serial.print value of potentiometer value converted to strokeSize

  if (Serial.available() > 0) {
    val = Serial.read();

    if (val == '1') { //tokyo light on
      digitalWrite(tokyoLEDPin , HIGH);
    } else {
      digitalWrite(tokyoLEDPin , LOW);
    }
    if  (val == '2') { //shanghai light on
      digitalWrite(shanghaiLEDPin , HIGH);
    } else {
      digitalWrite(shanghaiLEDPin , LOW);
    }
    if  (val == '3') { //shanghai light on
      digitalWrite(newyorkLEDPin , HIGH);
    } else {
      digitalWrite(newyorkLEDPin , LOW);
    }
    if  (val == '4') { //shanghai light on
      digitalWrite(abudhabiLEDPin , HIGH);
    } else {
      digitalWrite(abudhabiLEDPin , LOW);
    }
    if (val == '0') { //no light on
      digitalWrite(tokyoLEDPin , LOW);
      digitalWrite(shanghaiLEDPin , LOW);
      digitalWrite(newyorkLEDPin , LOW);
      digitalWrite(abudhabiLEDPin , LOW);
    }
  }
}


//establish contact between Arduino and Processing

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A"); //send a capital A
    delay(300);
  }
}
