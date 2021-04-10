//Arduino-Processing Assignment: Soojin Lee
//Title: Draw Korean Flag!
//April 9 - April 11, 2021
//Description: Dial Potentiometer to the right to start the game, press buttons to pick colors and press mouse to draw/color the Korean flag. 
//When the game starts, you will be able to hear Korean Anthem while you are drawing Korean flag. 

//importing communication
import processing.serial.*;
Serial myPort; //Create object from Serial class
String val;  //Data received from the serial port put into a String

//Import sound from the file 
import processing.sound.*;
SoundFile file;

//Set background color white
color background = color(255);

//declaring PImage for images
PImage KoreanFlagSketch;
PImage KoreanFlagImage;

//declaring font variable 
PFont CharterRoman48;

//declare StartBoxFill status
int StartBoxFill =0;

//preload two pages using boolean
boolean landing = true;
boolean game = false;

//boolean variables for color of the brush
boolean blue = false;
boolean red = false;
boolean black = false;

//identify page class
LandingPage L1 = new LandingPage();
GamePage G1 = new GamePage();


void setup() {
  size(700, 600);
  background(background);


  printArray(Serial.list()); 
  String portname = Serial.list()[3]; //change it to match my port

  //Arduino-Processing code
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n'); 

  //importing font
  CharterRoman48 = loadFont("Charter-Roman-48.vlw");

  //importing picture
  KoreanFlagSketch = loadImage("KoreanFlagSketch.png");
  KoreanFlagImage = loadImage("KoreanFlagImage.jpg");

  //load soundfile
  file = new SoundFile(this, "anthem.mp3");
}

void draw() {
  //Draw Landpage
  if (!game) {
    L1.drawLandingPage();
    //Draw Gamepage
  } else {
    G1.drawGamePage();
  }
}

//Construct a class for landing page
class LandingPage {

  void drawLandingPage() {
    //When game is not playing, stop the music
    if (file.isPlaying()) {
      file.stop();
    } else {
      println("noSong");
    }

    //reference image of the Korean Flag
    image(KoreanFlagImage, 10, 10, 120, 80);
    fill(255);
    stroke(0);
    strokeWeight (1);
    rect(300, 500, 100, 30, 10);
    //To hide the sketch image
    rect(90, 100, 530, 390);
    //Description & Instruction of the game
    fill(0);
    textSize(13);
    text("To start learning how to draw Korean Flag, dial the potentiometer to the right. \n Once you receive the sketch, press the button to paint with the color of the button. ", 150, 50);
    text("START", 330, 520);
    fill(0, 0, 0, 63);

    //width of the rectangle is mapped with the value of the potentiometer
    rect(300, 500, StartBoxFill, 30, 10);
  }
}

//Construct the game page Class
class GamePage {

  void drawGamePage() {
    //play Korean national Anthem whilst drawing 
    if (file.isPlaying()) {
      println("Fileis playing");
    } else {
      file.play();
    }

    //Sketch of Korean Flag
    image(KoreanFlagSketch, -50, 20, 800, 550);
    fill(255);
    noStroke();
    //to mask the Start Button
    rect(300, 500, 120, 50);
    fill(0);

    // Paint & draw with Black Brush by pressing the mouse
    strokeWeight (10); //Black brush is thinner 
    stroke(0);
    if ((mousePressed == true ) && (black == true)) { //if mouse if pressed and black button is pressed
      line(mouseX, mouseY, pmouseX, pmouseY);//continuous line
    }

    // Paint & draw with Blue Brush by pressing the mouse
    strokeWeight (20);
    stroke(0, 0, 255);
    if ((mousePressed == true ) && (blue == true)) {//if mouse if pressed and blue button is pressed
      line(mouseX, mouseY, pmouseX, pmouseY);//continuous line
    }

    // Paint & draw with Red Brush by pressing the mouse
    strokeWeight (20);
    stroke(255, 0, 0);
    if ((mousePressed == true ) && (red == true)) {//if mouse if pressed and red button is pressed
      line(mouseX, mouseY, pmouseX, pmouseY); //continuous line
    }
  }
}


//function that connects to Arduino
void serialEvent(Serial myPort) {
 
  val=myPort.readStringUntil('\n'); //the '\n' is our end delimiter indicating the end of a complete packet
  val = trim(val); //trimwhitespace and formatting characters
  if (val!=null) { //when the data is received
    println(val); //receiving data
    int values[]=int(split(val, ',')); //split values by category
    if (values.length==2) { //receive two values
      StartBoxFill = (int)map(int(values[0]), 0, 1023, 0, 100);  //map potentiometer value to StartBox width
      if (int(values[0])>= 800) { //if the potentiometer is dialed to the right
        game = true; //start Game
      } else {
        game = false;
      }
      if (int(values[0]) <800) { //if the potentiometer is not dialed yet
        landing = true;  //Remain in landing Page
      } else {
        landing = false;
      }
      if ((int)(values[1]) == 1) { // if the blue Button is pressed 
        blue = true;
      } else {
        blue = false;
      }
      if ((int)(values[1]) == 2) { // if the red Button is pressed 
        red = true;
      } else {
        red = false;
      }
      if ((int)(values[1]) == 3) {// if the black Button is pressed 
        black = true;
      } else {
        black = false;
      }
    }
  }
}

//end
