//Introduction to Interactive Media Midterm Assignment
//Soojin Lee
//18 Feb - 2 Mar 2021
//Title: Tune-in Catcher
/*Description: This audio-visual project is a game where a player listens to music and catches
 a falling object that matches the song while avoiding bombs! 
 Their aim is to complete catching all five songs without getting hit by the bomb.
 While having fun cathcing falling items, I hope players to enjoy listening to some of my favorite songs! */

//font variable
PFont BaskervilleItalic48;
PFont HannotateTC;

//image variable
PImage background;
PImage Song1;
PImage Song2;
PImage Song3;
PImage Song4;
PImage Song5;
PImage landpage;
PImage playlist;
PImage returnicon;


//boolean variables for Record direction 
boolean left=false;
boolean right=false;

//boolean variables for page display
boolean landPage = false;
boolean startGame = true;

//Import sound from the file 
import processing.sound.*;
SoundFile[] file;

//Identify Class and Array 
Item[] Items = new Item[12]; // array of Items
Record record = new Record();
Landpage L1 = new Landpage();
Gamepage gamepg = new Gamepage();
Endpage endpg = new Endpage();
Song[] Songs = new Song[5];//array of Songs


//Initialize number of sounds in the file 
int numsounds = 5;




void setup() {
  size(800, 800);

  //Load font
  BaskervilleItalic48 = loadFont("Baskerville-Italic-48.vlw");
  HannotateTC = loadFont ("HannotateTC-W5-48.vlw");

  //Images in img directory to load 
  landpage = loadImage("img/Landpage.jpg");
  background = loadImage("img/background.png");
  Song1= loadImage("img/Song1.jpg");
  Song2= loadImage("img/Song2.jpg");
  Song3= loadImage("img/Song3.jpg");
  Song4= loadImage("img/Song4.jpg");
  Song5= loadImage("img/Song5.jpg");
  playlist= loadImage("img/playlist.png");
  returnicon = loadImage("img/returnicon.png");

  //load soundfile
  file = new SoundFile[numsounds];
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".mp3");
  }
  //load song and item images
  randItem(Items);
  songimages(Songs);
};

//initialize item in array to randomItem 
void randItem(Item[] array) {//initialize instances for item
  for (int i=0; i<12; i++) {
    array[i]=new Item(i);
  };
}

//initialize songimages to array 
void songimages(Song[] array) {
  for (int i=0; i<5; i++) {
    array[i] = new Song(i);
  };
}

//redraw backbround
void redrawbackground() { //redraw background every time the object is moving
  image(background, 0, 0, width, height);
};

void draw() {

  // Draw landpage before starting the game
  if (!landPage) {
    L1.displayLandpage ();
    StartButton();
    instructionDisplay();

    //On mouse hover show image of music album
    if (mouseX > 42 && mouseX < 230 && 
      mouseY > 193 && mouseY < 383) {
      displaySong1();
      if (file[0].isPlaying()) { //check if the file[0] is playing
        println("File1is playing"); //if it is playing don't playfile[0]
      } else { //if it is not playing, then play file [0]
        file[0].play();
      }
    } else {
      file[0].stop(); //if mouse is off the range stop file [0]
    }

    //repeat above for file [1], file [2], file [3], file [4]
    if (mouseX >304 && mouseX < 304+188 && 
      mouseY > 193 && mouseY < 383) {
      displaySong2();
      if (file[1].isPlaying()) {
        println("File1is playing");
      } else {
        file[1].play();
      }
    } else {
      file[1].stop();
    }

    if (mouseX > 564 && mouseX < 564+188 && 
      mouseY > 193 && mouseY < 383) {
      displaySong3();
      if (file[2].isPlaying()) {
        println("File1is playing");
      } else {
        file[2].play();
      }
    } else {
      file[2].stop();
    }

    if (mouseX >  191 && mouseX <  191+188 && 
      mouseY > 446 && mouseY < 446+190) {
      displaySong4();
      if (file[3].isPlaying()) {
        println("File1is playing");
      } else {
        file[3].play();
      }
    } else {
      file[3].stop();
    }

    if (mouseX > 443 && mouseX < 443+188 && 
      mouseY > 446 && mouseY < 446+190) {
      displaySong5();
      if (file[4].isPlaying()) {
        println("File1is playing");
      } else {
        file[4].play();
      }
    } else {
      file[4].stop();
    }
  }

  //End of land page

  //This is for the Gamepage when the game is playing 

  if (!startGame) {
    redrawbackground();
    gamepg.display();
    record.appear();// this is to make record reappear later when game restarts

    //When games starts, play first song for the game
    if (file[0].isPlaying() == false && file[1].isPlaying() == false &&  file[2].isPlaying() == false &&  file[3].isPlaying() == false &&  file[4].isPlaying() == false) {
      file[0].play(); // if no sound file[] is playing, then play the first song file[0]
      println("File1is playing"); //to check is the file is playing well
    }


    // responsible for Item display and animation
    for (int i=0; i<12; i++) {
      Items[i].display();
      Items[i].collision();
      Items[i].fall();

      // responsible for recorder display and animation
      record.display();
      record.move();


      // responsible for catching animation; when recorder touches an item
      float touch = dist( Items[i].itemCoordinatex, Items[i].itemCoordinatey, record.x, record.y);

      //Activate action when the file[0] is playing and caught matching item for file [0]
      if (i == 0) { 
        if (touch < 60) {
          Items[0].erase(); //make corresponding item, item [0]disappear
          Songs[0].displayBright(); //diaply song image with full opacity. Lights on!
          file[0].stop();//stop sound file [0] to play another sound file
          if (file[0].isPlaying() == false && file[1].isPlaying() == false &&  file[2].isPlaying() == false &&  file[3].isPlaying() == false &&  file[4].isPlaying() == false) {
            file[1].play(); // if sound file [0] has stopped, start playing next sound file sound file [1]
          }
        }
      }
      //repeat above 
      if (i == 1) {
        if (file[1].isPlaying() == true) {
          if (touch < 60) {
            Items[1].erase();
            Songs[1].displayBright();
            file[1].stop();
            if (file[0].isPlaying() == false && file[1].isPlaying() == false &&  file[2].isPlaying() == false &&  file[3].isPlaying() == false &&  file[4].isPlaying() == false) {
              file[2].play();
            }
          }
        }
      }

      if (i == 2) {
        if (file[2].isPlaying() == true) {
          if (touch < 60) {
            Items[2].erase();
            Songs[2].displayBright();
            file[2].stop();
            if (file[0].isPlaying() == false && file[1].isPlaying() == false &&  file[2].isPlaying() == false &&  file[3].isPlaying() == false &&  file[4].isPlaying() == false) {
              file[3].play();
            }
          }
        }
      }

      if (i == 3) {
        if (file[3].isPlaying() == true) {
          if (touch < 60) {
            Items[3].erase();
            Songs[3].displayBright();
            file[3].stop();
            if (file[0].isPlaying() == false && file[1].isPlaying() == false &&  file[2].isPlaying() == false &&  file[3].isPlaying() == false &&  file[4].isPlaying() == false) {
              file[4].play();
            }
          }
        }
      }
      //now the player have completed all five songs 
      if (i == 4) {
        if (file[4].isPlaying() == true) {
          if (touch < 60) {
            Items[4].erase();
            Songs[4].displayBright();
            file[4].stop();
            //erase remaining images from the display
            Items[5].erase();
            Items[6].erase();
            Items[7].erase();
            Items[8].erase();
            Items[9].erase();
            Items[10].erase();
            Items[11].erase();
            //erase record from the display
            record.erase();
            //stop startgame
            startGame = true;
            //display class endpage
            endpg.display();
          }
        }
      }
      //Activate Bomb. When touch bomb, the game ends!
      if (i == 5) {
        if (touch < 60) {
          landPage = false; //when touched bomb, it goes back to the landing page
          startGame = true;
        }
      }
    }
  };
}
/* saveFrame("line-######.png");*/

//activate keyboard to move recorder 
void keyPressed() {
  if (keyCode == LEFT) {
    left=true;
  };
  if (keyCode == RIGHT) {
    right=true;
  };
}

//when key is not pressed, stop moving recorder
void keyReleased() {
  if (keyCode == LEFT) {
    left=false;
  };
  if (keyCode == RIGHT) {
    right=false;
  };
};

//activate mouse click to event
void mouseClicked() {
  //when clicked, the game starts
  if (mouseX >  650 && mouseX<  750 && 
    mouseY > 700 && mouseY < 750) {
    setup();//reset to reposition items (always starts from the sky)
    landPage = true;
    startGame = false;
  }

  //when clicked, goes back to the landing page 
  if (mouseX > 0 && mouseX<  50 && 
    mouseY > 0 && mouseY < 50) {
    landPage = false;
    startGame = true;
  }

  //for endpage, players can listen to song by clicking playlist
  if (mouseX >  405 && mouseX<  730 && 
    mouseY > 195 && mouseY < 265) {
    if (file[0].isPlaying()) {
      file[0].stop();
    } else {
      file[0].play();
    }
  } 

  if (mouseX >  405 && mouseX<  730 && 
    mouseY > 295 && mouseY < 365) {
    if (file[1].isPlaying()) {
      file[1].stop();
    } else {
      file[1].play();
    }
  }

  if (mouseX >  405 && mouseX<  730 && 
    mouseY > 395 && mouseY < 465) {
    if (file[2].isPlaying()) {
      file[2].stop();
    } else {
      file[2].play();
    }
  }

  if (mouseX >  405 && mouseX<  730 && 
    mouseY > 495 && mouseY < 565) {
    if (file[3].isPlaying()) {
      file[3].stop();
    } else {
      file[3].play();
    }
  }
  if (mouseX >  405 && mouseX<  730 && 
    mouseY > 595 && mouseY < 665) {
    if (file[4].isPlaying()) {
      file[4].stop();
    } else {
      file[4].play();
    }
  }
}
