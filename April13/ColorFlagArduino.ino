//Arduino-Processing Assignment: Soojin Lee
//Title: Draw Korean Flag!
//April 9 - April 11, 2021
//Description: Dial Potentiometer to the right to start the game, press buttons to pick colors and press mouse to draw/color the Korean flag. 
//When the game starts, you will be able to hear Korean Anthem while you are drawing Korean flag. 

//setting up button variables
const int blueButtonPin = A3;
const int redButtonPin = A4;
const int blackButtonPin = A5;

//setting up potentiometer variable 
const int potentiometerPin = A0;


void setup() {
  Serial.begin(9600);

  //declare Button as INPUT
  pinMode(blueButtonPin, INPUT);
  pinMode(redButtonPin, INPUT);
  pinMode(blackButtonPin, INPUT);
}

void loop() {
  //set potentiometer value as integer: sensorValue1
  int sensorValue1 = analogRead (potentiometerPin);

  //set button state as integer: sensorValue2
  int sensorValue2;

  if ((digitalRead(blueButtonPin) == LOW) and (digitalRead(redButtonPin) == LOW) and (digitalRead(blackButtonPin) == LOW)) {
    sensorValue2 = 0; //when no buttons are pressed set value as 0
  }
  if (digitalRead(blueButtonPin) == HIGH) {
  sensorValue2 = 1; //when blue button is pressed set value as 1
  } 
  if (digitalRead(redButtonPin) == HIGH) {
  sensorValue2 = 2; // when red button is pressed set value as 2
  }
  if (digitalRead(blackButtonPin) == HIGH) {
  sensorValue2 = 3; //when black button is pressed set value as 3
  }
  delay(1);
  Serial.print(sensorValue1); // Serial.print vlaue of potentiometer value
  Serial.print(','); //separate sensorValue1 and sensorValue 2 using comma
  Serial.println(sensorValue2); //Serial.print value of button state and move to next line 
}

//end
