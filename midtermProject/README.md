# Production Midterm: 'Tune-in Catcher' Processing Game

## DESCRIPTION
'**Tune-in Catcher**' is an audio-visual game that invites players to listen to music and catch falling objects that matches the song, while avoiding bombs! For instance, if the song "Do You Want to Build a Snowman" from the movie Frozen is being played, among many items that are falling from the sky, players' have to catch the snowman icon. Once they catch the correct icon, the next song will play. The aim of this game is to complete catching all five icons that matches the song without getting hit by the bomb. Through this project, I hope players to have fun playing game but also enjoy listening to some of my favorite songs! 

## IDEATION 
Listening to song is one of the essential daily routine of mine. I listen to music when I wake up, when I study, and even before I goto sleep. Just like friends, some songs companies me throughout the day, elevate my mood, and bring a lot of joy in my life. Therefore, through this music game, I wanted to share this joy that I get from listening to music, with others. 

## INSTRUCTIONS

Below is the YouTube video of demonstrating how to play the game. 
Click on the image to watch the demonstration video. 

### Tune-in Catcher Demonstration Video 

[![Watch the video](Images/YouTubevideo.png)](https://youtu.be/qE8WP0k1MyA)

### Landing page 

When players run the program, they are met with this landing page. 

 ![alt-text](Images/landingpage.png)  
 
 On this landing page, players can find an instruction. Following the written insstruction, players are supposed to hover mouse on LP disks to listen to songs. Each LP contains a song for this game. When the mouse is hovered on the LP disk, the song will start to play, and continue to play until the player remove the mouse away from the LP disk. Explore all five songs, and once the player is familiar with the songs, they can click **Start** to start the game. 
 
### Game Page

When the game starts, the song will play as well as the falling item animation. 

 ![alt-text](Images/playgame.png)  

The player's job is to listen to music, identify the item that matches the song, and use keyboard to move the record player and catch the matching item.
Players can use left and right direction keys to move around the record player. 
Meanwhile, players also have to avoid touching the bomb icon. 

By clicking return button on the top left corner, players can also return to the landing page. 

Once the player catches the correct item, the light will be turned-on for the song that they just catched, and the next song will start. 
Players repeat this job until they catch icons for all five songs. 

Below is the image of the screen half-way through them game when players have collected three songs (three lighted song images on the left side of the screen) and still have got two more songs to catch:

 ![alt-text](Images/lighton.png)  
 
 If the player fails in avoiding the bomb icon and accidently hits the bomb icon, the game will stop automatically and they will be directed to the landing page. 
 
 ### End Page
 When players have successfully caught all five songs without hitting the bomb, the game ends and the players will meet the endpage. 
 
  ![alt-text](Images/endpage.png)  
 
 Here, players will receive a contragulations message on successfully collecting all five songs! They are also met with the instruction on how to listen to songs. Players are able to enjoy and listen to songs by clicking on the playlist and can stop the song by clicking it again. If tehy want to restart the game, they can click Restart button to play it once more! 

Here is the list of songs available for Tune-in Catcher:

 - Strawberries & Cigarettes by TroyeSivan
 
 - Do You Want To Build a Snowman? by KristenAnderson-Lopez & Robert Lopez
 
 - Counting Stars by OneRepublic
 
 - A Whole New World by Zhavia Ward & Zayn Malik
 
 - White Christmas by Bing Crosby

## Process & Journal

To Read the process of making this Tune-in Catcher with day by day progress, challenges, and iterations,

please visit [link to section](https://github.com/Soojin-Lee0819/IntrotoIM/blob/main/midtermProject/journal.md)

## Reflection & Evaluation 

Overall, I enjoyed working on this project a lot. Adding sound was a really exciting process and designing a code in a way that it responds to certain trigger was fun. In the beginning, when I was coming up with an idea, I was a bit worried that the game that I plan to develop maybe a bit too complicated for the scope of the project. However I decided to take this challenge, and I solved one issue at a time, making progress.

Working on this project, I acquired some important skills that can be used for future projects. 

**Write it down on the paper**

   I was sometimes stuck on one issue for hours not knowing what to do. I tried modifying codes, and changed things around to see if it solves the issue but nothing worked out and i end up just staring on the screen repeating the same mistakes over and over. Once I started to grab a pen and writing down code; trying to understand the structure of the code. By physically writing things down on the paper, I was able to look into the problem with a fresh perspective. This really helped me to think things in different ways. 
   
**There is no One Way to Solve the Problem**
 When I was trying to fix an issue of the image gets bright for only one frame and gets back dark, I only focused on changing the actions associated to "tint". I thought the solution was to script an action that makes the tint value stay. However the issue was not on the function 'tint' but it was due to the "erase" action that relocates the items off frame. Since the change of tint value activates when the erase action happens, which occurs when the distance between the recorder and the item is less than 50, relocating would change the distance between the two items; hence the light was on for one frame but immediately gets dark after it gets relocated. Therefore, to erase an item, instead of relocating it to off screen, I adjusted the size to be the size that is almost invisible.  
 
**Organize and Categorize**
Since it was a rather complicated game, there were many elements that are happening simultaneously. Therefore, categorizing the events and classes were really helpful to think about it in section by section. However, I feel like I can merge some classes into one. 
