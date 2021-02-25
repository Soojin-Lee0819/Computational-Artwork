## Tune-in Catch Journal

### Idea & Project Description 

Listening to music is one of hte essential daily routine of mine. It is a powerful tool that controls my emotion, companies me thorughout the day that I listen to music almost all the time; when I wake up, when I study, and even before I goto sleep. Therefore, for this project, as sound was one of the required feature, I decided to make a game that has music as an integral part of the game. 

"Tune-in Catch"is an audio-visual multimedia game that requires players to interact with both image and sound. To briefly describe how this game works, it is similar to the oldschool "catch game" where players catch a falling object from the sky. The twist is that for the "Tune-in Catcher", users have to listen to the music and collect specific item that matches with the song that is currently being played. For instance, if the song "Do you want to build a snowman" from the movie Frozen is being played, among many items that are falling from the sky, player have to catch the snowman icon. The aim of this game for th players is to complete catching all five songs with the shortest time possible. Playing this game, I hope players have fun trying to catch matching items as well as simply enjoying listening to music. 

Through this game I hoped to share some of my favorite songs with the users. Therefore, I incorporated some of my recent favorite playlist into the game. 

In total, there are five songs loaded for this game: 

- Strawberries & Cigarettes by TroyeSivan

- Do You Want To Build a Snowman? by KristenAnderson-Lopez & Robert Lopez

- Counting Stars by OneRepublic

- A Whole New World by Zhavia Ward & Zayn Malik

- White Christmas by Bing Crosby

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
Following the instruction to create a game that includes shape, image, sound, and on-screen text, I brainstormed on what game I want to produce. From the beginning, I wanted to create a game that is built around the music. For the game part, for the scope of this project, I wanted to creatively elaborate on the simple game like catching objects. 

I had two ideas in mind:

1) First idea is called <Re-writing song> where players catch words that are falling from the sky and these collected words will be replaced with the lyrics of a song that will be played throughout the duration of the game. 
   
2) Another idea is <Tune-in Catcher> where players listen to the song and colelct matching icon that best expresses the song that is currently being played. 

For this midterm project, I decided to work on the second idea. 


### Feb18.2021

**Progress** 
<Collecting Image>
- I collected a png image for the falling Items 

<Falling Item Animation>
- I coded basic animation of Items falling from the sky using void fall() that changes y position with added speed 
  and void collision() that checks item colliding with the ground height and looping it by make it go back to the sky when it reaches the ground. 
   
 ```Processing
 void fall() {
    itemCoordinatey=itemCoordinatey+itemSpeed; //To start Item falling Action
  };

  void collision() {
    if (itemCoordinatey>=height-70) { // if item collides with the ground height - item size
      itemCoordinatey=-100;// it goes back to the sky
      itemCoordinatex=int(random(70, 830)); //reset x position a nd speed
      itemSpeed=int(random(3, 13));
    };
  };
```


<LP player Keyboard Move>
- I also animated LP player to move left and right using keyPressed(); and keyReleased(); function and boolean. 

```Processing
  void keyPressed() {
  if (keyCode == LEFT) {
    left=true;
  };
  if (keyCode == RIGHT) {
    right=true;
  };
}


void keyReleased() {
  if (keyCode == LEFT) {
    left=false;
  };
  if (keyCode == RIGHT) {
    right=false;
  };
};
```

It turned out to be like this:

![alt-text](Images/18Feb2021midterm.gif)

**Issues**
   - As intended, Icons are falling down but all of the movements of each frame are captured and continuously visualized.

### Feb19.2021

**Progress**

<Redrawing Background>
- I fixed the issue of continuous visualization of imgages by redrawing the background. 
``` processing
void redrawbackground() { //redraw background every time the object is moving
  image(background, 0, 0, width, height);
```
so that new background is being drawn every frame and covering the previous frames

![alt-text](Images/19Feb2021redrawbg.gif)

**Issue**

- Movement of LP player is not completely smooth. The previous frames are shown for a second. 

<Adding Timer>
- I added Timer with a void countUp(), starting with Timer(0) that update the timer by counting up that begins with value 0.

**Issue**

Timer is behind the falling images

**Solution**

Switch the order of draw. Display Items and Record first, then timer. By doing so, Timer comes in front of images. 

![alt-text](Images/19Feb2021timer.gif)


<Landing Page>
   - Making Landing page

What I have made previously is the gamepage, which is displayed once the game has started. Before players actually begin the game, I wanted them to trigger some action, such as clciking a mouse start the game. 

I started with desinging landpage. I designed a landing page with an iage of lp players displayed on wall. When users hover on the LP, it shows the album cover of the song. This is done so that players can listen to and explore the songs before they start the game. 

Later when I learn how to embed audio files, I will add the feature of on hover, I would make the song to start to play.

![alt-text](Images/19Feb2021musicalbum.gif)

### Feb20.2021

I haven't made much progress today. Instead, I edited journals and redesigned background for the gamepage. I wanted to give an experience of players to feel like they are playing this game at a cozy cafe. Therefore, I changed the backgorund of the gamepage to an image of antique LP cafe.


### Feb21.2021

Progress
1. Added Button to start the game.
   ```
   void mouseClicked() {
     if (mouseX >  650 && mouseX<  750 && 
    mouseY > 700 && mouseY < 750) {
    setup();
    landPage = true;
    startGame = false;
    }```
  
2. Added Instruction text using string

3. Add return button on game page for users to stop playing the game or to restart. 
   In order to restart, I have added setup(); to click (start) button so that everytime when user starts the game, it is a new game. 
 ![alt-text](Images/addTextAndStartButton.png)  
 
 
### Feb22.2021

1. Created ending page 

### Feb 23.

Issue!
Stuck with not knowing how to match array of item image with song image. 

The transparency is only changing when but once it is moved, transparency change back to . I originally had song images as an individual file; not as an array. I changed it to the array form but I still did not figure out how to make this happen. It was very frustrating and I felt like I have to 


### Feb 24. 

Progress
1. Loaded sound 
How to play only one sound file at a time. 

I solved it by adding if file[].isPlaying() function. 
