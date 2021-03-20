//IM Assignment 7: 3-Confusing Light Game
//By Soojin Lee
//Description: This is the game where you are given a pattern of light and need to press the button that matches the light pattern.
//             But be careful! The color of the Button does not matches with the color of the light so you need to first learn what color button matches what color light.

//Instruction: 1) Start the Program
//             2) Learn colors: Click buttons to learn what color does each button represents
//             3) Click all three buttons simultaneously: Once you are confident that you have learnt what button corresponds to what color light, press all three button simultaneously to start the game
//             4) Start playing Game: See the light pattern and press the corresponding button that will light up the same pattern
//                           If you press the correct button, green light will turn on and proceed to next level.
//             5) Win the Game: If you finish all five levels, you win the game! (all lights will blink 3 times and restart the game)


//declaring boolean to trigger start of the game and proceeed to next level
boolean gameStart = false;
boolean level1 = false;
boolean level2 = false;
boolean level3 = false;
boolean level4 = false;
boolean level5 = false; // players need to complete five games to complete this game

//LEDLight for Pattern
const int yLED = 10;
const int rLED = 11;
const int bLED = 12;

//Buttons
const int yButton = A0;
const int rButton = A1;
const int bButton = A2;


//Green Light when answered Correct
const int gLight = 2;


void setup() {
  //Declaring LED lights as output of button
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(2, OUTPUT);

  //declaring buttons as input
  pinMode(yButton, INPUT);
  pinMode(rButton, INPUT);
  pinMode(bButton, INPUT);

}

void loop () {
  //when the program starts, load learning mode for players to learn how to play the game
  if (gameStart == false) {
    Learn();
  }

  //Start Game Level 1
  if (level1 == true) {
    Game1();
  }

  //Start Game Level 2
  if (level2 == true) {
    Game2();
  }

  //Start Game Level 3
  if (level3 == true) {
    Game3();
  }

  //Start Game Level 4
  if (level4 == true) {
    Game4();
  }

  //Start Game Level 5
  if (level5 == true) {
    Game5();
  }
}



//learn what button correspons to what LED light
void Learn() {
  //yellow button lights up red LED light
  if (digitalRead(yButton) == HIGH) {
    digitalWrite(rLED, HIGH); // 
    delay(500);
    digitalWrite(rLED, LOW);
  }
  
  //red button lights up blue LED light
  if (digitalRead(rButton) == HIGH) {
    digitalWrite(bLED, HIGH);
    delay(500);
    digitalWrite(bLED, LOW);
  }

  //blue button lights up yellow LED light
  if (digitalRead(bButton) == HIGH) {
    digitalWrite(yLED, HIGH);
    delay(500);
    digitalWrite(yLED, LOW);
  }

  //press all three buttons to start the game
  if (digitalRead(yButton) == HIGH and digitalRead(rButton) == HIGH and digitalRead(bButton) == HIGH) {
    digitalWrite(gLight, HIGH); // turn on green light to indicate that game has started
    delay(1000);
    digitalWrite(gLight, LOW);
    delay(1000);
    
    digitalWrite(yLED, HIGH);//Pattern for Game 1: yellow light
    delay(1500);
    digitalWrite(yLED, LOW);
    level1 = true;// start game level 1
    gameStart = true;// stop learning mode
  }


}

//
void Game1() {
  if (digitalRead(bButton) == HIGH) { // correct answer: blue button
    digitalWrite(gLight, HIGH); // turn on green light to indicate correct answer
    delay(500);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(rLED, HIGH); //Pattern for Game 2: red light
    delay(1500);
    digitalWrite(rLED, LOW);
    level2 = true;// start game level 2
    level1 = false;// stop level 1
  }

}

void Game2() {
  if (digitalRead(yButton) == HIGH) { // correct answer: yellow button
    digitalWrite(gLight, HIGH);// turn on green light to indicate correct answer
    delay(500);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(rLED, HIGH); 
    digitalWrite(bLED, HIGH); //Pattern for Game 3: red light & blue light
    delay(1500);
    digitalWrite(rLED, LOW);
    digitalWrite(bLED, LOW);
    level3 = true;// start game level 3
    level2 = false;// stop game level 2
  }
}

void Game3() {
  if (digitalRead(yButton) == HIGH and digitalRead(rButton) == HIGH ) { // correct answer: yellow button & red button
    digitalWrite(gLight, HIGH);// turn on green light to indicate correct answer
    delay(500);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(yLED, HIGH);
    digitalWrite(rLED, HIGH); //Pattern for Game 4: yellow light & red light
    delay(1500);
    digitalWrite(yLED, LOW);
    digitalWrite(rLED, LOW);
    level4 = true;// start game level 4
    level3 = false;// stop game level 3
  }
}


void Game4() {
  if (digitalRead(bButton) == HIGH and digitalRead(yButton) == HIGH ) { // correct answer: red button & blue button
    digitalWrite(gLight, HIGH); // turn on green light to indicate correct answer
    delay(500);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(bLED, HIGH); //Pattern for Game 4: blue light
    delay(1500);
    digitalWrite(bLED, LOW);
    level5 = true; // start game level 5
    level4 = false; // stop game level 4
  }
}

void Game5() {
  if (digitalRead(rButton) == HIGH) { // correct answer: red button 
    digitalWrite(gLight, HIGH); // turn on green light to indicate correct answer
    delay(500);
    digitalWrite(gLight, LOW);
    delay(500);
    // Completed all five game levels
    // turn on all the lights on the board to celebrate the completion of the game! 
    //repeat 3 times (turn on and off)
    digitalWrite(bLED, HIGH);
    digitalWrite(yLED, HIGH);
    digitalWrite(rLED, HIGH);
    digitalWrite(gLight, HIGH);
    delay(500);
    digitalWrite(bLED, LOW);
    digitalWrite(yLED, LOW);
    digitalWrite(rLED, LOW);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(bLED, HIGH);
    digitalWrite(yLED, HIGH);
    digitalWrite(rLED, HIGH);
    digitalWrite(gLight, HIGH);
    delay(500);
    digitalWrite(bLED, LOW);
    digitalWrite(yLED, LOW);
    digitalWrite(rLED, LOW);
    digitalWrite(gLight, LOW);
    delay(500);
    digitalWrite(bLED, HIGH);
    digitalWrite(yLED, HIGH);
    digitalWrite(rLED, HIGH);
    digitalWrite(gLight, HIGH);
    delay(500);
    digitalWrite(bLED, LOW);
    digitalWrite(yLED, LOW);
    digitalWrite(rLED, LOW);
    digitalWrite(gLight, LOW);
    
    level5 = false; //stop game level 5
    gameStart = false; //Back to learning mode
  }
}

//end of game 
