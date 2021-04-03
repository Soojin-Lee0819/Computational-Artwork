//IM Sound Assignment: Epic Birthday Celebration!
//By Soojin Lee
//Description: This is a program for all-in-one birthday celebration device. Following instruction, you can not only play a birthday song but also wish your friend, family, or beloved ones a happy birthday with cute surprises.



//including libraries
#include "pitches.h"
#include <Servo.h>

//making servomotor class without delay
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

//Heart LEDLight Array
int HeartLEDlights[] = {A2, A3, A4, A5, 2, 4, 7, 5};// an array of pin numbers to which LEDs are attached
int HeartPinCount = 8; // the number of HeartPins (i.e. the length of the array)

//"Happy Birthday" melody
int bday_melody[] = {
  NOTE_C4, NOTE_C4, NOTE_D4, NOTE_C4, NOTE_F4, NOTE_E4,
  NOTE_C4, NOTE_C4, NOTE_D4, NOTE_C4, NOTE_G4, NOTE_F4,
  NOTE_C4, NOTE_C4, NOTE_C5, NOTE_A4, NOTE_F4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_AS4, NOTE_AS4, NOTE_A4, NOTE_F4, NOTE_G4, NOTE_F4

};

//"Happy Birthday" tempo
int bday_tempo[] = {
  4, 4, 2, 2, 2, 1,
  4, 4, 2, 2, 2, 1,
  4, 4, 2, 2, 4, 4, 2, 1,
  4, 4, 2, 2, 2, 1
};

//declaring PINs
const int tonePin = 8;
const int button = 6;
const int candleLED = 3;
const int photoResistor = A0;

//declaring variables to avoid using delay() function
unsigned long currentNoteStartedAt = 0;
int thisNote = 0;
int millisToNextNote;

void setup() {
  Serial.begin(9600);

  //initialize speakerPin as an output:
  pinMode(tonePin, OUTPUT);
  sweeper.Attach(9);

  //initialize button as an Input:
  pinMode(button, INPUT);

  //initialize candleLED as an OUTPUT:
  pinMode(candleLED, OUTPUT);

  //initialize Heart LED light class as an OUTPUT
  // the array elements are numbered from 0 to (pinCount - 1).
  // use a for loop to initialize each pin as an output:
  for (int thisPin = 0; thisPin < HeartPinCount; thisPin++) {
    pinMode(HeartLEDlights[thisPin], OUTPUT);
  }
}

void loop() {

  //read state of button and see if the button is pressed
  int buttonState = digitalRead(button);

  //read state of photoresistor
  int photoValue = analogRead (photoResistor);

  if (photoValue < 30) //value 30 is attained after a few tirals of covering phootResistor using finger
  {
    digitalWrite(3, HIGH); //Makes the candleLED glow in DARK (represents lighting up the candle)
    else
    {
      digitalWrite(3, LOW); //Turns the candleLED OFF in LIGHT (represents blowing the candle)
    }

    //declaring variable for seconds
    unsigned long currentMillis = millis();

    if (buttonState == HIGH && photoValue < 30) {   //Song plays ONLY when the candle is lighted, and when the button is pressed
      sweeper.Update(); // Activate the servo motor
      // loop from the lowest pin to the highest:
      for (int thisPin = 0; thisPin < HeartPinCount; thisPin++) {
        // turn the Heart LED pin on:
        digitalWrite(HeartLEDlights[thisPin], HIGH);
      }

      if (currentMillis - currentNoteStartedAt >= millisToNextNote) {
        int noteDuration = 1000 / bday_tempo[thisNote];
        tone(8, bday_melody[thisNote], noteDuration);  // Activate the piezo Buzzer to make sound
        millisToNextNote = noteDuration * 1.30;
        currentNoteStartedAt = currentMillis;
        thisNote++;
        if ( thisNote > + 29) {
          thisNote = 0;
        }
      }
      // To make sure the heart shaped LED is turned off when the button is not pressed or the room is LIGHT
      else {
        for (int thisPin = 0; thisPin < HeartPinCount; thisPin++) {
          // turn the Heart LED pin off:
          digitalWrite(HeartLEDlights[thisPin], LOW);
        }
      }
    }
  }

  //End
