# Intro to IM Final Project: Dream Cafe!

## Inspiration

![alt-text](Images/shanghai.jpg)

I love going to cafe. I love drinking coffee, eating cakes, but apart from that I also love cafe for its vibe, its atmosphere, the people in it, and the aesthetics; it is the whole experience I get all-together. One of my bucket list is to own a coffee shop. So for my final project, using Arduino and Processing, I decided to produce a fun, relaxing cafe game and make my dream come-true!!

## Description

"Dream Cafe" is a fun and relaxing game for those who want to have an experience of opening a cafe. By playing "Dream Cafe", you will be able to have a holistic experience of opening a cafe from choosing a locaiton, setting up the cafe environment, receiving orders, making latte art, and serving coffee to the customers. Please follow the instruction below carefully to enjoy this game. 

### Instruction:

1) Choose a city where you want to open a cafe (On hover, the city will light up on the map!)

2) Turn on the light and set the music of your choice

- To turn on the light: Shed a light to the photoresister 
- To select a music: Dial the ORANGE potentiometer 

3) Once you set up the light and the music, customers will start to come. 

4) Press yellow button to receive an order. (Press the button until your friend says "STOP")

5) Type in the order that the spinning wheel indicates and press ENTER
// 6) Start drawing Latte Art and make coffee for the customer 
      //Dial PINK potentiometer to adjust the brush stroke size
// 7) Once you finish making coffee, press READY to serve the coffee to the customer. 
// 8) Press RESTART to restart the game!

## Schematic 

The schematic of this idea is below. One thing to be careful is that it uses two bread boards. All the lights goes to one bread board and the rest goes to the other bread board. 

![alt-text](Images/schematic.jpg)

## Final Circuit

This is an original circuit without any ornaments on the board. It has two breadboards and a servo motor. One bread board has four LED lights and another bread board has 2 potentiometers, one yellow button and one one photoresistor. 

![alt-text](Images/circuit2.png)

This is the final circuit with a world map and the spinner attached.

![alt-text](Images/circuit1.png)

## Game Demonstration Video 

Click below to see the end result of my final project!

[![Watch the video](Images/youtubeimage.png)](https://youtu.be/8zPUVFaiePk)


## Demo GIF 

Below is the quick look of map that lights up according to your hover

![alt-text](Images/lightmap.gif)

Below is the quick look of turning the lamp on to shed a light to the photoresistor and to light up the cafe

![alt-text](Images/turnlight.gif)

Below is the quick look of drawing latte art and adjusting the brush size using potentiometer

![alt-text](Images/draw.gif)

Below is the quick look of pressing button to activate spinner 

![alt-text](Images/spinner.gif)

## Challenges & Process

### Pass boolean from one class to another 

The dream "Dream cafe" has many pages and functions that players get to navitage. In order to organize these layers of pages and sequence of tasks that players have to complete, I constructed several classes in category of task or the layers of task. 

![alt-text](Images/classes.png)

In total, I have one main project file with five different pages. 

![alt-text](Images/cafe3.png)
![alt-text](Images/cafe2.png)

Creating a class was not a difficult part since I practiced it several times already. However, I faced an issue when I tried to pass boolean from one class to another. For example, for the StartScreen I wanted the image opacity to change on hover (image on the left), and on click, it moves to next page, which is categorized as GamePage (image on the right). Originally when I declared the boolean at the StartScreen page, the boolean only worked within the Class. I could not pass the boolean to another Class. 

Therefore, I declared the booleans on the main project file as a public boolean. This way, the boolean were applicable throughout all the classes. 

### reset() Impossible

![alt-text](Images/reset.png)

### LED light not bright enough 

### Weak accuracy of the potentiometer value 

### Allow Drawing by freezing Frame

### Processing - Arduino Communication

Once I started this project, I found out that 


## Interesting Findings 

I found out that arduino pins are actually very 

## Evaluation 

Overall, I am very happy with the outcome of this project. From the beginning, I wanted to make an original and creative game that is different from the ones that are already available. This was difficult because unlike adapting the existing game that has a reference point I can follow, for this one, I had to come up with everything from the structure, the organization, and the coding part of the game. Therefore, knowing that this project will take a lot of time, I started to work on this project earlier than what was expected. As I started early, I was able to finish early as well. I am proud that I was able to get the project done much early on time so that I don't have to rush. Instead, I was able to take enough time to improve on the designs, aesthetics, details and documentation of the process. I tried to add many interactive features for this project; the communication  between Processing and Arduino, between Processing and the player, and between Arduino and the player. 

## How I can Improve?

For every project, I have a growth and development but also I always end up finding something that I want to try for the future project. One thing that I want to for my next project is that I want to make a game that allows multiple players. I want to create a game that allows people to play together, have fun and make cute memories. Another thing is I wonder if I can make the coding more efficient. I want to write a code that will improve the data processing and make the loading faster. I found out that the data processing of this game was very slow. It not only takes a long time to load the game, but on the mouseClick as well. This was an expected result because when I was writing a code for this project, I didn't consider the efficiency of the code at all. I would like to know if it is possible to write a code that will fasten the loading/reaction speed, and if so, I want to learn how to write such a code. 
 

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




