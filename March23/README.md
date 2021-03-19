# Arduino Assignment 1: LED Puzzle

For this week's assignment we were instructed to use at least three momentary switches, and at least three LEDs to create a puzzle that can be solved by pressing the buttons. I decided to make a game that 



In class, we learnt how to program on Arduino 


1. To start the game, press any button
2. Once the game starts, four lights will light up 
3. 
4. 

## Process

1. First I built the setbacks
- When I press the button, the button responds to matching color LED
- The light turns off after 500 delay


````

 if (digitalRead(yButton) == HIGH) {
    digitalWrite(yLED, HIGH);
    delay(500);
    digitalWrite(yLED, LOW);

  }

  if (digitalRead(rButton) == HIGH) {
    digitalWrite(rLED, HIGH);
    delay(500);
    digitalWrite(rLED, LOW);

  }

  if (digitalRead(bButton) == HIGH) {
    digitalWrite(bLED, HIGH);
    delay(500);
    digitalWrite(bLED, LOW);

  }
````

### Challenge:
I struggled with connecting switch with the light. 

When started the program, the light turns on without switch but once I have switch involved, the light did not turn on. 

The issue was that I connected the same leg button to both ground and the 5 volt supply. 


