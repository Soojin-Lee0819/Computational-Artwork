# Tune-in Catcher Journal

Following is the digital journal on creating a Tune-in Catcher 

## Feb17.2021
Following the instruction to create a game that includes shape, image, sound, and on-screen text, I brainstormed on what game I want to produce. From the beginning, I wanted to create a game that is built around the music. For the game part, for the scope of this project, I wanted to creatively elaborate on the simple game like catching objects. 

I had two ideas in mind:

1) First idea is called <Re-writing song> where players catch words that are falling from the sky and these collected words will be replaced with the lyrics of a song that will be played throughout the duration of the game. 
   
2) Another idea is <Tune-in Catcher> where players listen to the song and colelct matching icon that best expresses the song that is currently being played. 

For this midterm project, I decided to work on the second idea. 


## Feb18.2021

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

## Feb19.2021

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

## Feb20.2021

I haven't made much progress today. Instead, I edited journals and redesigned background for the gamepage. I wanted to give an experience of players to feel like they are playing this game at a cozy cafe. Therefore, I changed the backgorund of the gamepage to an image of antique LP cafe.


## Feb21.2021

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
 
 
## Feb22.2021

1. Created ending page 

## Feb 23.

Issue!
Stuck with not knowing how to match array of item image with song image. 

The transparency is only changing when but once it is moved, transparency change back to . I originally had song images as an individual file; not as an array. I changed it to the array form but I still did not figure out how to make this happen. It was very frustrating and I felt like I have to 


## Feb 24. 

Progress
1. Loaded sound 

For the landing page, when the player hover on the LP, since the action is triggered continuously, the music is played repetitively. I wanted a song to play once while the mouse is hovering on the LP. 

I solved it by adding if() else () file[].isPlaying() function. 
   ```
    if (mouseX > 42 && mouseX < 230 && 
      mouseY > 193 && mouseY < 383) {
      displaySong1();
      if (file[0].isPlaying()) {
        println("File1is playing");
      } else {
        file[0].play();
      }
    } else {
      file[0].stop();
    }

   ```
   
   So the program first checks if the song is being played. If the song is currently being played, it prints line that File is Playing and if nothing is playing, it starts to play the sound file. Then, if the mouse is no longer hovered on the LP, the file stops playing. 
   
 ## Feb 25
 
(Iteration)
It was a great challenge for me to figure out how to trigger a random song to play once the game starts, stop the song and play another song when the user succeed in catching the matching item of the song. 

Therefore, I made an adjustment to the program. To make it a bit less complicated, instead of instead of playing a random song, I decided to load songs in order and the goal of the user is to successfully completing all five items without getting hit by the bomb. 

(Progress)
**light up Icon**
By increasing the tint value of the album icon image, when the player successfully catch the item of the song, I added an animation that lights up the music album. 

**Catch Icon Animation**
Using this function
   ```
float touch = dist( Items[i].itemCoordinatex, Items[i].itemCoordinatey, record.x, record.y);
(touch < 50) {
          Items[0].erase();
   ```
of measuring the distance between the recorder and the falling item, I made an animation of catching item. For the function erase, I originally set speed to 0 and translate the item position off screen; x = 1000; y = 1000;
This way, I could make an animation that makes player feel like the item is caught by deleting the item from the screen. However the issue was that I wanted the light to be on but it would only flicker and once the position is moved off screen, since the function touch() is no longer true; the distance between recorder and the icon is too far away, the light only flickers for a second and gets dim again. 
   
I found a way to let the light stay by instead of moving the position off screen, I set the erase(); 

This took me almost the entire day to figure out but it turned out to be a very simple. 
```
  void erase() {
    itemSpeed = 0;
    itemSize = 1;
    };
  ```
I learnt that sometimes I need to sit back and try to think about what are some other approches I can take to have the same result, effect. 

****

**Start game play sound**

**When item is co**

(Iteration)
How to restart timer when the game restarts?

 ## Feb 26
 
 
