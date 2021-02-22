# Tune-in Catch

## Journal 

Idea & Project Description 

Listening to music is one of the essential daily routine of mine. It is a powerful medium that controls my emotion, and I listen to music almost anytime; when I wake up, when I study, and even before I goto sleep. Therefore, for this project as sound was one of the requirment, I decided to make a project that incorporate music as an integral part of the game. 

"Tune-in "is a multimedia game where users need to be interacting with both image on the screen and the sound. Playing this game, I hope players to relax listening to music as well as have fun trying to catch matching items that are falling from the sky. 

To briefly describe how this game works, the basic structure of the game origins from an oldschool "catch game" where users catch a falling object from the sky. The twist is that for "Tune-in Catcher", users have to listen to the music and collect specific item that matches the song that is currently being played. For instance, if the song "Do you want to build a snowman" from the movie Frozen is being played, among many icons that are falling, player have to catch the snowman icon. 

In total, there are five songs loaded for this game: 

-Strawberries & Cigarettes by TroyeSivan

-Do You Want To Build a Snowman? by KristenAnderson-Lopez & Robert Lopez

-Counting Stars by OneRepublic

-A Whole New World by Zhavia Ward & Zayn Malik

- White Christmas by Bing Crosby

These are some of the songs that i listen to the most. Through this, I hoped to share some of my favorite songs with the users. 

The aim of this game for th players is to complete catching all these five songs in shortest timeframe. 

<This is the manual on how Tune-in Catch is structured>
1. Read Instruction and explore songs
2. Click start button to start the game
3. The game begins 
4. The timer begins, items start to fall from the sky and the song randomly chose from the list starts to play
5. Listen to the song and try to identify the matching icon that is related to the song
6. Use direction keys to move LP recorder (basekt) and catch the icon that matches the song
7. If an appropriate icon is collected, the song changes to the next one
8. Repeat this until the player complete all five songs
9. Once complete, players will receive a congratulations letter with a music playlist which they can click and listen to. 
10. If player wish to replay, they can click restart button to replay the game. 

Following is the digital journal on the work progress. 

### Feb17.2021
Following the instruction on creating a game project that includes shape, image, sound and on-screen text, I brainstormed on what game I want to produce. Frpm tje beginning, I wanted to create a game that has to do with music. I wanted to somehow incorporate ball cathing game with music to make it interesting.

I had an idea of a game called <re-writing song> where players catch words that are falling from the sky and these collected words will be replaced with the lyrics of the song that is being played.
   
Another idea was to listen to song and colelct matching icon that best expresses the song that is currently being played. 

For this project, I decided to work on the second idea. 


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
