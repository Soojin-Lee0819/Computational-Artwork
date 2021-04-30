# Intro to IM Final Project: Dream Cafe!

## Inspiration

![alt-text](Images/shanghai.jpg)

I love going to cafe. I love drinking coffee but apart from that I also love going to cafe for its vibe, its atmosphere, people I meet there, and the aesthetics of the cafe; it is the experience I get all-together. One of my bucket list is to have my own coffee shop. So, for my final project, using Arduino and Processing, I decided to produce a fun, relaxing cafe game and make my dream come-true!!

## Description

"Dream Cafe" is a fun and relaxing game for those who want to have an experience of opening a cafe. By playing "Dream Cafe", you will be able to have a holistic experience of opening a cafe from choosing a locaiton, setting up the cafe environment, receiving orders, making latte art, and serving coffee to the customers. Please follow the instruction below to enjoy Dream Cafe. 

### Instruction:

1) Choose a city where you want to open a cafe (on hover, that city will light up on the map!)

2) Turn on the light and set the music of your choice

- To turn on the light: Shed a light to the photoresister 
- To select a music: Dial the ORANGE potentiometer 

3) Once you set up the light and the music, customers will start to come. 

4) Press yellow button to receive an order (Press the button until your friend says "STOP").

5) Type-in the order that spinning wheel indicates and press ENTER
6) Draw latte art for the customer
   Dial PINK potentiometer to adjust the brush stroke size
7) Once you finish making coffee, press READY to serve the coffee to the customer. 
8) Press RESTART to restart the game!

## Schematic 

The schematic for this project is below. 

![alt-text](Images/schematic.jpg)

## Final Circuit

This is an original circuit without any ornaments on the board. It has two breadboards and a servo motor. One bread board has four LED lights and another bread board has 2 potentiometers, one yellow button, and one photoresistor. 

![alt-text](Images/circuit2.png)

This is the final circuit with a world map attached to LED breadboard, and the spinner attached to the servo-motor.

![alt-text](Images/circuit1.png)

## Game Demonstration Video 

Click below to see the end result of my final project!

[![Watch the video](Images/youtubeimage.png)](https://youtu.be/8zPUVFaiePk)


## Demo GIF 

LED light on the map lights up according to your hover on the image

![alt-text](Images/lightmap.gif)

Shed light to photoresistor in order to light up the cafe

![alt-text](Images/turnlight.gif)

Draw latte art and adjust the brush size using potentiometer

![alt-text](Images/draw.gif)

Press the button to activate spinner 

![alt-text](Images/spinner.gif)

## Challenges & Process

### Pass boolean from one class to another 

The Processing file of the game "Dream Cafe" is composed of a multiple pages and a number of tasks for the players to complete. So instead of cramming everything into one pde file, I made a multiple tabs and organized the code in classes. 

![alt-text](Images/classes.png)

In total, I have one main project file with five class pages. Creating a new class tab was not a difficult part. However, I faced an issue when I tried to pass boolean from one tab to another. For example, initially, in order to identify the mouseover for the images in the StartScreen page, I declared the boolean variables in the StartScreen Tab. 

````
boolean overTokyo = false;
````

![alt-text](Images/cafe3.png)
![alt-text](Images/cafe2.png)

Left is StartScreen and right is GamePage. 

I faced the challenge when I tried to use this boolean at the main project file for the mouseClicked() function. I received an error message saying that the boolean is not found. After some research, I found out that the boolean should be declared as a "public" to pass the boolean from one class to another. I also found out that the boolean that is declared on the main project file can be passed to other tabs. Therefore, when declaring boolean, I made boolean to be public like this:

````
public boolean overTokyo = false;
````
and to be extra safe, I started to declare all the booleans in the main project file and decleared it as public boolean. 

### Processing - Arduino Communication

Once I begin to put Arduino and Processing in communication, I found out that for my previous project, I didn't make the handshake between Processing and Aruino. It took me a while to learn how to make a proper handshake between Arduino and Processing. 


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

I struggled stopping Arduino to send "A" to Processing when the first contact is completed. I enabled this by setting a boolean firstContact as FALSE by default, and when the Processing reads the handshake value "A", it clears the port and changes the firstContact to be true. This way, once there is a first contact, Processing can read values sent from Arudino as well as start sending the data to Arudino. 


### Weak accuracy of the potentiometer value 

I struggled with the inaccurate potentiometer value. Although I dial the potentiometer to the far right, it was only reading the values between 950-980. Hypothetically, when I turn the potentiometer to the furthest left, the read value should be 0, and when it is turned to the furthest right, the read value should be 1023. However, the accuracy of the potentiometer was not so great. Therefore, I added the buffer value to make sure all songs can be played when I switch the potentiometer. Although there are only four choices of the songs, I mapped the value between 0 and 5.

````
byte chooseSong = map(pmsensorValue, 0, 1023, 0, 5); 
````

I set the read value 0, and 5 to be noSong, and the read value 1-4 to play the four songs respectively. This way, even when the read value is much less than what it should be, there is no issue in playing the song. 

### Continuous Line Drawing 

Coding a "drawing" function for this game was a great challenge. Drawing a continuous line was not difficult, but to draw a continuous line on the background or an  image was difficult. With background color or an image, although the function void drawLatte() is written correctly and the drawing is being executed, because the background or an image is also continuously being drawn, the lines are being maksed by the images and are not visible on the screen.

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

First solution that came to my mind was obviously to get rid of the background. However, the issue was that when there is no background, the previous page, the GamePage, is visible underneath. Therefore, I had to find another solution. 

But this problem gave me a source of inspiration. Turning this problem, the fact that the previous page is shown underneath, to opportunity, I found a solution. Basically, I separated the drawing page into two separate pages; one page that contains the background and images needed for this latte art; the "LatteArtPage" and another page that only contains the funciton of drawing the continuous line, the "DrawPage". So once the drawing starts, the LatteArtPage is displayed followed by DrawPage after a 2 milliseconds of delay.

````
 if (keyCode == ENTER) { // confirm the order and start doing the latte art
    Draw_Page = true;
    delay(2);
    latte_page = true;
````

This allows players to draw on the transparent backgorund and the previous page is shown underneath. The previous page in this case is the Draw_Page, is the exact page that we need for the latte art drawing. 

## Process & Journal

To Read the process of making this Dream Cafe with a day by day progress, challenges, and iterations,

please visit [link to section](https://github.com/Soojin-Lee0819/IntrotoIM/blob/main/Final%20Project/journal.md)

## Interesting Findings 

- Consistency is the Key!! Somedays you make less progress than the other day. But don't get frustrated but continue working everyday. When you look back, you will be surprised to find out how much progress you have made. 

- I reminded myself that Schematic does not tell you how to build the breadboard. This was my first time using more than breadboard for a project. When I was using one breadboard, it was not necesarry to indicate how to build the circuit. However, since this project uses more than one breadboard, if someone want to build the same game using schematic, the image of the circuit was necessary for that person to understand how this circuit is built. For example, if I build LED lights and potentiometer on the same breadboard, the players will face difficulty adjusting the potentiometer because it will be covered by a map. 

## Evaluation 

Overall, I am very happy with the outcome of this project. From the beginning, I wanted to make an original and creative game that is different from the ones that are already available. This was difficult because unlike adapting the existing game that has a reference resources that I can follow, for this one, I had to come up with everything from the scratch; the structure, the organization, and the coding part of the game. Therefore, knowing that this project will take a lot of time, I started to work on this project earlier than what was expected. As I started early, I was able to finish early on time. I am proud that I didn't rush for the final project Instead, I was able to take enough time to improve on the designs, aesthetics, details and documentation of the process. I tried to add many interactive features for this project; the communication between Processing and Arduino, between Processing and the player, and between Arduino and the player. 

## How I can Improve?

For every project, I have a growth and development but also I always end up finding something that I want to try for the future project. One thing that I want for my next project is that I want to make a game that allows multiple players. I want to create a game that allows people to play together, have fun, and make cute memories. Another thing is I wonder if I can make the coding more efficient. I want to write a code that will improve the data processing and make the loading of the processing page faster. I found out that the data processing of this game was very slow. Everytime when I add a soundfile to Processing, the loading takes forever. This was an expected result because when I was writing a code for this project, I didn't consider the efficiency of the code at all. I would like to know if it is possible to write a code that will fasten the loading/reaction speed, and if so, I want to learn how to write such a code. 
 

## Sources & Credit 

### Songs
Songs that I used for this project:

1) Heather by Conan Gray (https://www.youtube.com/watch?v=GPUg7n8-M6o)

2) Canada by Lauv (https://www.youtube.com/watch?v=hb_p3bKrK84)

3) Lego House by Ed Sheeran (https://www.youtube.com/watch?v=c4BLVznuWnU)

4) New Day by Paul Kim (https://www.youtube.com/watch?v=hGFKxgpa3fc)


### Images

Images I used for this project:

Starbucks image Shanghai / Starbucks image Tokyo / Starbucks New York City (https://www.starbucksreserve.com/en-us/visit)

Cafe 302 Abu Dhabi img (https://www.zomato.com/abudhabi/cafe-302-al-maha-arjaan-by-rotana-al-markaziya)

Customer img (https://pixabay.com/it/illustrations/viso-uomo-cartone-animato-umano-4005302/)

Latte art hand close up img (https://computerbackgroundimages.com/)

Latte art coffe img (https://www.vectorstock.com/royalty-free-vector/latte-art-set-vector-20772198)




