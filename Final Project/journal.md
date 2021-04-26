# Final Project Journal

### Shortcuts
[Day 1](journal.md#day-1), [Day 2](journal.md#day-2), [Day 3](journal.md#day-3), [Day 4](journal.md#day-4), [Day 5](journal.md#day-5), [Day 6](journal.md#day-6), [Day 7](journal.md#day-7), [Day 8](journal.md#day-8), [Day 9](journal.md#day-9), [Day 10](journal.md#day-10)

## JOURNAL ENTRIES

## 13 April 2021
##### day-1

### Developing preliminary concept 

For my final project, using Arduino and Processing, I want to produce a fun and relaxing cafe game.

![alt-text](Images/cafe.jpg)

This is not a competitive game. It will be a chill relaxing game where you follow the instructions and enjoy completing certain tasks. For now, considering the scope of this project, I plan to have 4-5 different challenges/tasks. Each task will involve the use of arduino, processing or both. I plan to make it very creative and engaging.

Here are some of the challenges that I have in mind as of now.

## Task Ideas

### Setting up light 

Setting a cozy, welcoming, and comfortable environment for cafe is a key. Players will be given an image of the lighting of the cafe with some clues. Then it is their task to find a way to adjust the lighting of the cafe and set up a light in a way that matches the image. Photoresistor and LED lights will be needed for this challenge.

![alt-text](Images/light.jpg) ![alt-text](Images/cafelight2.jpg) 

### Set a Cafe Music

Another importnat aspect a cafe is its "music" choice. For this section, players can use potentiometer to choose the background music of the cafe.

### Getting Order

I plan to add a pin to the servo motor and make a spinning wheel with a list of request from the customers for the latte art. Servo motor will spin and whatever it stops on will be the task for the next challenge. 

![alt-text](Images/spin.png) ![alt-text](Images/spinningwheel.jpg) 

### Latte Art

Based on the sketch design (order) that was chosen by previous challenge, you need to draw a latte art. You will use a mouseclick and buttons for this challenge. 

![alt-text](Images/latteart.jpg) ![alt-text](Images/latteart2.jpg) 

### Motor
I want to incorporate motor for my final project but as of now I didn't learn how to use motor. After learning how to use motor on Thursday, if applicable, I may add one more challenge that incorporates motor. 

## 14 April 2021
##### day-2

### Designing landing page for Processing 

I started with desinging landing_page on Processing. For the landing_page, I wanted players to be able to choose where they are going to open up a cafe, and have it viewed on the map by having Arduino LED lights to light up. I carefully chose the images of cafes around the world with a good resolution. When choosing cafe images, it was difficult to ignore my "perfectionist" mindset. I spent around 2 hours choosing the "perfect" images when the logical part of me was telling me that I should be spending more time getting the technical parts done, and work on the details later if I have more time. 

![alt-text](Images/cafehover.png)

I focused on two functions:

First, when the player hover mouse on the image,the opacity of the image changes and shows how cafe looks; revealing the cafe. Another thing is when the image is clicked, I wanted the image that was clicked on to be the background image of the next page, the GamePage. 

Initially, I just assigned mouse to track where it is on the screen and wrote a function for it to change the opacity of the image when the mouse is hovered. This had no issue with the first part but when I tried to implement the second part, since there is no data recorded, I couldn't execute the second part to set a clicked image to be the background image of the GamePage. 

Therefore, I set each image as a boolean, and when the mouse is clicked within that boolean, it makes the boolean true. For instance, when I have my mouse hover over the parameter of Shanghai cafe image, 

````
 boolean shanghaiOver (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  ````
  it returns the shanghaiOver TRUE
  
  and if shanghaiOverr is TRUE, I assigned overShanghai to be true, which allows the storing data for the click of an image. 
  
  ````
   if ( shanghaiOver (ShanghaiX, ShanghaiY, imageWidth, imageHeight)) {
      overShanghai = true;
  ````
  
  For the function mouseClick(), when the mouse is clicked when the mouse is hovering over the shanghai cafe image, it turns the boolean cafeShanghai TRUE. 
  
  ````
   if (start_screen  && overShanghai ) { // when click Shanghai
    game_page = true;
    cafeReady = false;
    start_screen = false;
    cafeShanghai = true;
  } else {
    cafeShanghai = false;
  }
  ````

By doing so, I created a communication channel where click of certain image leads to having that certain image to be a backgroudn of the following page. 

## 18 April 2021
##### day-3

### Arduino-Processing handshake 

I realized that for my previous project, I was able to successfully connect Arduino to Processing but without a handshake. For this project, I made sure I make a proper handshake before I put two programs in communication. 

````
 if (firstContact == false) {
      if (val.equals("A")) {
        myPort.clear();
        firstContact = true;
        myPort.write("A");
        println("contact");
      }
    } else { //if we've already established contact, keep getting and parsing data

      println(val); //receiving data
````

I struggled in the beginning with clearing the port. Without myPort.clear(); Processing was continuously receiving "A" from Arduino that it never reads the value of the value that Aruino is sending after the first contact. 

## 19 April 2021
##### day-4

### Lighting up map 

I made the communication from Processing to Arduino. I programmed this in a way that when an image is hovered the corresponding LED lights up. 

![alt-text](Images/blueLight.gif)

I set myPort.write ('0'); value 0 as no light on, and set the rest 1-4 to four blueLED each. 

## 20 April 2021
##### day-5

### Set Light of Cafe using Photoresistor

### Set cafe music using Potentiometer 

### Designing & Building Game Page




## 21 April 2021
##### day-6

## 22 April 2021
##### day-7

I start working on drawing latte art page. 

I wanted to provide players with a sketch to paint on; the outline for panda, sun, and leaves latte art. Using Adobe Photoshop, I created a cup of coffee with the sketch and the transparent background. 

![alt-text](Images/photoshop.jpeg)

## 23 April 2021
##### day-8

Today my goal was to fix and complete the "Drawing_Page". I had to figure out how to draw continuous line on the background or the image. With background color or an image, although the function void drawLatte() is correctly written and is executed, because the background is also continuously being drawn, the lines are not visible on the screen.

````
class LatteArtPage { 
  void displayLattePage() {
    background(255);
    fill(0);
    textSize(13);
    image(artlatte, 0, 0, 530, 650);

    text("To start drawing Latte Art, press the mouse.\nDial PINK potentiometer to adjust the brush size. \nOnce you have finished drawing, press READY to serve", 650, 575);
    if  (saved.equals (panda) == true) {
      image(pandaimg, 620, 40, 500, 500);
    } 
    if  (saved.equals (leaves) == true) {
      image(leaveimg, 620, 40, 500, 500);
    }
    if  (saved.equals (sun) == true) {
      image(sunimg, 620, 40, 500, 500);
    }
    noStroke();
    rect(1070,570,100,40, 10);
    fill(255);
    textSize(18);
    text("READY",1095, 595);
  }
  
    void drawLatte(){
   // Paint & draw with Blue Brush by pressing the mouse
    strokeWeight (brushSize);
    stroke(221,138, 60);

    if ((mousePressed == true) && (allowDraw)) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}
````
![alt-text](Images/noDraw.gif)

First solution that came to my mind was obviously to get rid of the background. However, the issue was that when there is no background, I can draw continouous line on the page but the images from the previous page, the GamePage, is visible underneath. Therefore, I had to find another solution. 

But this trouble give me a source of inspiration. Turning this trouble, the fact that the previous page is shown underneath, into my own advantage, I found the solution. Basically, I separated drawing page into two separate pages; one page that contains the background and images needed for this latte art; the LatteArtPage and another page that only contains the funciton of drawing the continuous line, the Draw Page. So once the drawing starts, the LatteArtPage is displayed and with 2 milliseconds of delay, 

````
 if (keyCode == ENTER) { // confirm the order and start doing the latte art
    Draw_Page = true;
    delay(2);
    latte_page = true;
````

it moves to DrawPage. This allows players to draw on the transparent backgorund with the previous page, the exact page that is intended for the latte art. 

[Adjusting Brush Stroke]

I also installed the second potentiometer to adjust the brush storke size. 

To use potentiometer to adjust the brush size, I mapped the value of the AnalogRead (0,1023) to (3,10) as I wanted the brush size to be between 3-10.

````
  int pmsensor2Value = analogRead (potentiometer2Pin);
  byte brushSize = map(pmsensor2Value, 0, 1023, 3, 10);
  ````

### Arduino

   //read the value of the potentiometer for brush stroke size(ANALOG)
  int pmsensor2Value = analogRead (potentiometer2Pin);
  byte brushSize = map(pmsensor2Value, 0, 1023, 3, 10);

### Processing 

if ((int)(values[2]) >2) {
          allowDraw = true;
          brushSize = float (values[2]);
        } else {
          allowDraw = false;
        }

I wanted the read value of the 2nd potentiometer to be directly assigned as a brushSize. I originally assigned the brushSize brushSize = int (values[2]); with an integer of the read value, which led to an error. I later found out that this is because the value should be read as a float


## 24 April 2021
##### day-9

Today I finally installed ornaments to the Arduino circuit. I added a map and the spinning wheel to the Arduino. I added these at the end when I was sure that everything is working well because once I install the ornaments, it is difficult to move the pins and the resistors around. 

When installing the map, positioning lights to the right position was challenging. I had to crook the legs of the LED lights to adjust the angle and the position of the light. 

![alt-text](Images/circuit4.png) ![alt-text](Images/circuit3.png).

I made the final_page on processing.

![alt-text](Images/finalpage.png)

 I used saved data (what was typed for the order, String order="") to have the image appear on the screen as a final result. To do this, I had to add an extra String, String saved=""; that saves what was typed until the player hits the ENTER button and store it as a data.

````
   if (keyCode == ENTER) { // confirm the order and start making the order
    Draw_Page = true;
    delay(2);
    latte_page = true;
    game_page = false;
    saved = order;
    order = "";
  }
````

For instances, if the order was Panda, and the player typed in "panda", for the final page, the completed latte art of panda will appear on the screen.
 
 ````
 
     if  (saved.equals (panda) == true) {
      image(pandacoffeeimg, 620, 65, 500, 500);
    } 
    if  (saved.equals (leaves) == true) {
      image(leavecoffeeimg, 620, 65, 500, 500);
    }
    if  (saved.equals (sun) == true) {
      image(suncoffeeimg, 620, 65, 500, 500);
    }
 
 ````
 
 I added RESTART button to allow players to replay. When I had the RESTART button positioned at the same location as the READY button on the draw_page, when I click READY button, although I coded like this
 
  ````
   if (Draw_Page && mouseX >1070 && mouseX < 1170 && mouseY > 570 && mouseY < 610 ) { // return to Start Screen
    Final_Page = true;
    Draw_Page = false;
  } 

  if (Final_Page && mouseX >1070 && mouseX < 1170 && mouseY > 570 && mouseY < 610 ) { // return to Start Screen
    Final_Page = false;
    start_screen = true;
    
  }
  ````
  
  ![alt-text](Images/returnerror.gif)
  
  for some reason, when I clicked READY on the Draw_Page, it did not move from the Draw_Page to the Final_Page, but instead it automatically moved to the start_screen.
  
  To solve this issue, I repositioned RESTART button to top right corner so the button positions do not coincide. 
  

## 25 April 2021
##### day-10

Hurrah! I finished the project much earlier than the deadline! I was able to finish it much early because I started early. One big take away from working on coding projects is the importance of consistency and time management. Somedays I get stuck and I only make a small progress. However, when I work consistently, these small progresses pile up, and eventually when I look back, I have made a big progress. For today, I worked on finalizing journaling and the documentation. Today, I filmmed the demo video and uploaded it to the YouTube.

I also drew the schematic. 

![alt-text](Images/schematic.jpg)

I wonder if I need to specify that I used two breadboards on the schematic. If so how do I show? I asked on the discord regarding this question.




