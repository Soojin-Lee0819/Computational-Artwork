//Soojin Lee March 30 Assignment (Analog Vs. Digital)
//Solve Light Puzzle to help Soojin finish her storytelling!!
//Instructions: Dial the potentiometer (clockwise) to receive a light pattern. There are four patterns in total. Solve the puzzle in order.
//For each pattern, find the light that blinks slower than the rest.
//When you know the answer, press the matching color button to check if it is correct.
//If you press the correct button, the green light on the top left corner will light up.
//Find the answer for all four patterns, and fill in the blank to finish Soojin's story.
//Below is Soojin's Story with missing parts.

/*I had a very weird day yesterday. I woke up, opened the window and the sky was (--- First Pattern Answer
  ----) and all the cars on the street were (---Second Pattern Answer---). I wore my favorite (--- Third Pattern Answer ----) sweater and left my home.
  On the way to school, I saw such a beautiful bird with (---Fourth Pattern Answer---) feathers. What a day! */

//Declaring LED light variable
const int blueLEDpin = 11;
const int greenLEDpin = 10;
const int yellowLEDpin = 6;
const int redLEDpin = 9;

//Decalring Green Light that indicates correct Answer
const int greenLight = 13;

//Declaring Button variable
const int blueButton = 12;
const int greenButton = 7;
const int yellowButton = 5;
const int redButton = 2;

//initialize ledState
int ledState = LOW;

//Declare Time variable for Blinking Slow or Fast
unsigned const long BlinkSlow = 200;
unsigned const long BlinkFast = 100;


//Declare Starting Time as zero
unsigned long previousTimeSlow = 0;
unsigned long previousTimeFast = 0;



void setup() {
  Serial.begin(9600);

  //setting the button as output
  pinMode(blueLEDpin, OUTPUT);
  pinMode(greenLEDpin, OUTPUT);
  pinMode(yellowLEDpin, OUTPUT);
  pinMode(redLEDpin, OUTPUT);
  pinMode(greenLight, OUTPUT);

  //setting the all the buttons as input
  pinMode(blueButton, INPUT_PULLUP);
  pinMode(greenButton, INPUT_PULLUP);
  pinMode(yellowButton, INPUT_PULLUP);
  pinMode(redButton, INPUT_PULLUP);
}

void loop() {

  //updates frequently
  unsigned long currentTime = millis();

  //read the value of the potentiometer (ANALOG)
  int sensorValue = analogRead (A0);


  //PATTERN 1: YELLOW
  //if sensor value is greater than 10 but less than 250
  if ((sensorValue > 10) and (sensorValue < 250)) {

    //Yellow Blink Fast
    if (currentTime - previousTimeFast > BlinkFast) {
      previousTimeFast = currentTime;   //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa:
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      digitalWrite(yellowLEDpin, ledState);
    }

    //Rest Blink Slow
    if (currentTime - previousTimeSlow > BlinkSlow) {
      previousTimeSlow = currentTime; //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa(blink):
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      // set the LED with the ledState of the variable:
      digitalWrite(blueLEDpin, ledState);
      digitalWrite(greenLEDpin, ledState);
      digitalWrite(redLEDpin, ledState);

    }

    //Declare Yellow Button as correct Answer
    if (digitalRead(yellowButton) == HIGH) { //when yellow button is pressed
      digitalWrite(blueLEDpin, LOW);
      digitalWrite(yellowLEDpin, LOW);
      digitalWrite(redLEDpin, LOW);
      digitalWrite(greenLEDpin, LOW);
      Serial.print("the sky was YELLOW");
      Serial.print('\n');
      digitalWrite(greenLight, HIGH); //green light turn on
      delay(500);
      digitalWrite(greenLight, LOW);
    }
  }


  //PATTERN 2: RED
  //if sensor value is greater than 250 but less than 500
  if ((sensorValue > 250) and (sensorValue < 500)) {

    //RED Blink Fast
    if (currentTime - previousTimeFast > BlinkFast) {
      previousTimeFast = currentTime;   //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa:
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;

      // set the LED with the ledState of the variable:
      digitalWrite(redLEDpin, ledState);

    }

    //Rest Blink Slow
    if (currentTime - previousTimeSlow > BlinkSlow) {
      previousTimeSlow = currentTime; //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa(blink):
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      // set the LED with the ledState of the variable:
      digitalWrite(yellowLEDpin, ledState);
      digitalWrite(greenLEDpin, ledState);
      digitalWrite(blueLEDpin, ledState);

    }

    //Declare RED Button as correct Answer
    if (digitalRead(redButton) == HIGH) { // When yellow button is pressed
      digitalWrite(blueLEDpin, LOW);
      digitalWrite(yellowLEDpin, LOW);
      digitalWrite(redLEDpin, LOW);
      digitalWrite(greenLEDpin, LOW);
      Serial.print("cars on the street were RED");
      Serial.print('\n');
      digitalWrite(greenLight, HIGH);
      delay(500);
      digitalWrite(greenLight, LOW);
    }
  }

  //PATTERN 3: GREEN
  //if sensor value is greater than 500 but less than 750
  if ((sensorValue > 500) and (sensorValue < 750)) {

    //GREEN Blink Fast
    if (currentTime - previousTimeFast > BlinkFast) {
      previousTimeFast = currentTime;   //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa:
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;

      // set the LED with the ledState of the variable:
      digitalWrite(greenLEDpin, ledState);

    }

    //Rest Blink Slow
    if (currentTime - previousTimeSlow > BlinkSlow) {
      previousTimeSlow = currentTime; //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa(blink):
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      // set the LED with the ledState of the variable:
      digitalWrite(blueLEDpin, ledState);
      digitalWrite(redLEDpin, ledState);
      digitalWrite(yellowLEDpin, ledState);

    }

    //Declare GREEN Button as correct Answer
    if (digitalRead(greenButton) == HIGH) {
      digitalWrite(blueLEDpin, LOW);
      digitalWrite(yellowLEDpin, LOW);
      digitalWrite(redLEDpin, LOW);
      digitalWrite(greenLEDpin, LOW);
      Serial.print("my favorite GREEN sweater");
      Serial.print('\n');
      digitalWrite(greenLight, HIGH);
      delay(500);
      digitalWrite(greenLight, LOW);
    }
  }


  //PATTERN 4: BLUE
  //if sensor value is greater than 750 but less than 1000
  if ((sensorValue > 750) and (sensorValue < 1000)) {

    //BLUE Blink Fast
    if (currentTime - previousTimeFast > BlinkFast) {
      previousTimeFast = currentTime;   //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa:
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;

      // set the LED with the ledState of the variable:
      digitalWrite(blueLEDpin, ledState);

    }

    //Rest Blink Slow
    if (currentTime - previousTimeSlow > BlinkSlow) {
      previousTimeSlow = currentTime; //save the last time you blinked the LED
      //if the LED is off turn it on and vice-versa(blink):
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      // set the LED with the ledState of the variable:
      digitalWrite(yellowLEDpin, ledState);
      digitalWrite(greenLEDpin, ledState);
      digitalWrite(redLEDpin, ledState);

    }

    //Declare Blue Button as correct Answer
    if (digitalRead(blueButton) == HIGH) {
      digitalWrite(blueLEDpin, LOW);
      digitalWrite(yellowLEDpin, LOW);
      digitalWrite(redLEDpin, LOW);
      digitalWrite(greenLEDpin, LOW);
      Serial.print("bird with BLUE feathers");
      Serial.print('\n');
      digitalWrite(greenLight, HIGH);
      delay(500);
      digitalWrite(greenLight, LOW);
    }
  }

  //End game when all four patterns are solved
  if ((sensorValue > 1000) and (sensorValue < 1023)) {
    digitalWrite(blueLEDpin, LOW);
    digitalWrite(yellowLEDpin, LOW);
    digitalWrite(redLEDpin, LOW);
    digitalWrite(greenLEDpin, LOW);
  }

  //Start the game with no light on. Players have to dial potentiometer to receive a pattern.
  if ((sensorValue > 0) and (sensorValue < 10)) {
    digitalWrite(blueLEDpin, LOW);
    digitalWrite(yellowLEDpin, LOW);
    digitalWrite(redLEDpin, LOW);
    digitalWrite(greenLEDpin, LOW);
  }
}
//End

//Answer
/*I had a very weird day yesterday. I woke up, opened the window and the sky was YELLOW and all the cars on the street were RED. I wore my favorite GREEN sweater and left my home.
  On the way to school, I saw such a beautiful bird with BLUE feathers. What a day! */
