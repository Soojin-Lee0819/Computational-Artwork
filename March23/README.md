# Arduino Assignment 1: Confusing LED Light Game

## Description 
For this week's assignment we were instructed to use at least three momentary switches, and at least three LEDs to create a puzzle/game that can be solved by pressing the buttons. Following the instruction, I made a game where you are given a pattern of light and you need to press the button(or buttons) that matches the light pattern. Warning! I added a twist to this game to confuse you, so be careful! The color of the buttons does not matches with the color of the light. So you will need to first learn which button matches with which color of the light before you start the game. After you finish learning, you start the game. In total, you have five levels to complete to win the game! 

## Ideation 
When I tried to make a game with LED lights with different colors, one game came to my mind. It is the game that you have to look at the chart and say the COLOR not the word. 

![alt-text](Images/namecolor.png)

It is confusing because your right brain tries to say the color but your left brain insists on reading the word. Inspired by this game, I decided to add a confusing element in the game to make the game more fun to play. Hence, I added a twist where players have to press matching button, not the button with the same color with the light.  

## Game Instruction 
1) Start the Program

2) Learn colors: Click buttons to learn what color does each button represents

   - Blue Button => Yellow LED
   - Red Button => Blue LED
   - Yellow Button => Red LED
   
3) Start Game: Once you are confident that you have learnt what color button corresponds to what color light, press all three button simultaneously to start the game. Green LED Light will blink to indicate that the game is starting. 

4) Play Game: See the light pattern and press the corresponding button that will light up the same pattern. If you press the correct button, green light will blink and proceed to next level.

5) Win the Game: Complete all five levels, then you win the game! (all the lights on the board will blink 3 times to congratulate you and restart the game)

## Schematic
The build of the schematic for this project is below:

![alt-text](Images/lightgameshcematic.jpg)

## Final Product

![alt-text](Images/cleangame1.jpg)

## Final Game Demo
Find the demonstration of the game below: 

[![Watch the video](Images/lastgamefinalimage.jpg)](https://youtu.be/LDsbpfi08Vc)

1) Click BLUE, RED, and YELLOW buttons one by one to learn what color LED light each button represents.
2) Click all three BLUE, RED, and YELLOW buttons simultaneously to start the game => Green light blinks!
3) Yellow light turns on => that means you have to click blue button (blue button corresponds to yellow LED)
4) Press Blue button => Green light turns on to indicate it is correct.
5) Continue the game until you finish level 5
6) Once you finish level 5, all the lights on the breadboard blinks 3 time and restarts


## Challenge & Process

### Build Simple program ###
In class we learnt how to build switch and LED light on the breadboard and how to program it on Arduino to put Input (Button) and Output (LED lignt) in communication. However, once I tried to build a game from the scratch, I didn't know where to start. It was a little bit overwhelming. So instead of building a perfect physical program for the game, I first built a simple program that has three switches and three light where each switch corressponds to matching lights and 
I made adjustments to this basic model. This was really helpful because I could regularly check if my code has an error or if it is working fine. 

### Dim LED Light ###
When I first built a simple program that turns on the light when the buttons are pressed, I faced an issue of LED lights lightening up, but the lights were very dim. This was because I did not declare LED lights as ouput. I declared lights as output in void setup(). Once I declared them as an output, the LED lights got so much brighter. 

````
void setup() {
  //Declaring LED lights as output of button
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(2, OUTPUT);
````


### Button Wrong Wire Connection ###
I made a mistake on connecting the same leg button to both ground and the 5 volt supply. Since they were connected to the same leg (same row), the button was not working. However, not knowing this hardware mistake, I spent so much time on trying to fix this issue by fixing the digital code. Later I found out that it is not the issue of computer coding but the issue was on the breadboard itself. 

Unlike previous software-based Processing projects, for Arduino project, it requires both the physical and the digital programming that it is challenging to figure out whether the issue is on the computer digital programming or the setup of the hardware. 

From this experience, I learnt a lesson that it is important to check both the software program and the hardware program instead of making a impedient judgement on where the issue might be in. 

### Learning New Language ###

Although it was very similar to Processing language, it took me a while to learn Arduino Program Language.
I learnt new function, variable and structural languages like 
- digitalRead()
- digitalWrite()
- pinMode()
- OUTPUT
- INPUT
- HIGH
- LOW

I used https://www.arduino.cc/reference/en/ Arduino reference page to search specific terms.

One thing that I liked about Ardunio Program Language was that I could use **and** **or** as a word unlike Processing where I having to learn new language that represents the meaning of this. 


