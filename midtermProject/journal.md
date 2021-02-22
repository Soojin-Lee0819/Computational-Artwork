This project is a game where 

Features I want to incorporate: Songs change when users have got the correct item


### Feb17.2021
Following the instruction on creating a game project that includes shape, image, sound and on-screen text, I brainstormed on 


### Feb18.2021

I collected a png image for the Items and I coded basic animation of Items falling from the sky and moving LP player left and right using keyPressed(; and keyReleased(); function. 

It turned out to be like this:
![alt-text](Images/18Feb2021midterm.gif)


### Feb19.2021

Progress
1. I fixed the issue by redrawing the background. I added update background everytime to avoid this. 

![alt-text](Images/19Feb2021redrawbg.gif)

How do I make sure two items are not falling from the same x coordinate?


2. I added Timer 

Issue: Timer is behind falling images
Solutaion switch order of draw. Display Items and Record first then timer. Timer comes in front of images. 

![alt-text](Images/19Feb2021timer.gif)


3. Make Landing Page

I added landing page with lp players displayed on wall. On mouseClick(); the game starts


I started to design landingpage. I added song Album covers to each LP. When users hover on the LP, it shows the song and later when I learn how to embed audio file, the song starts to play. 

Users can listen to and explore songs before the start the game.


![alt-text](Images/19Feb2021musicalbum.gif)

### Feb20.2021

Redesigned background for game page. 

### Feb21.2021

Progress
1. Added Button to start the game. 
2. Added Instruction text using string
3. Add return button on game page for users to stop playing the game or to restart. 
   In order to restart, I have added setup(); to click (start) button so that everytime when user starts the game, it is a new game. 
 ![alt-text](Images/addTextAndStartButton.png)  
