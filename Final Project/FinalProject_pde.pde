//Intro to IM Final Project: Soojin Lee
//Title: Dream Cafe
//April 14 - April 28, 2021
//Description: This is Soojin's Intro to IM final project. 
//It is a game for those of who want to have an experience of opening up a cafe; from choosing a location, setting up the cafe environment,
//receiving orders and serving them a beautiful latte art coffee. 
//Please follow the instruction carefully to enjoy the game.

//Instruction: 
// 1) Choose a city where you want to open a cafe (It will light up on the map!)
// 2) Turn on the light and set the music of your choice 
// To turn on the light: Shed a light to the photoresister 
// To select a music: Dial the ORANGE potentiometer 

// 3) Once you set up the light and the music, customers will start to come. 
// 4) Press yellow button to receive an order. (Press the button until your friend says "Stop")
// 5) Type in the order that the spinning wheel indicates and press ENTER
// 6) Start drawing Latte Art and make coffee for the customer 
      //Dial PINK potentiometer to adjust the brush stroke size
// 7) Once you finish making coffee, press READY to serve the coffee to the customer. 
// 8) Press RESTART to restart the game!
// Enjoy!!!

//importing communication 
import processing.serial.*;
Serial myPort; //Create object from Serial class
String val;  //Data received from the serial port put into a String
boolean firstContact = false;

//Import sound from the file
import processing.sound.*;
SoundFile heather;
SoundFile legohouse;
SoundFile canada;
SoundFile newday;

//declaring font variable 
PFont CharterRoman48;

//declaring image variable
PImage tokyo;
PImage shanghai;
PImage newyork;
PImage abudhabi;
PImage arrow;
PImage customer;
PImage bubble;
PImage pandaimg;
PImage leaveimg;
PImage sunimg;
PImage pandacoffeeimg;
PImage leavecoffeeimg;
PImage suncoffeeimg;
PImage artlatte;

//Declare input for the order
String order="";
String saved="";
String sun = "sun";
String panda = "panda";
String leaves = "leaves";

//declare variable for DrawPage
public float brushSize;

//identify page class
StartScreen S1 = new StartScreen();
GamePage G1 = new GamePage();
LatteArtPage L1 = new LatteArtPage();
DrawPage D1 = new DrawPage();
FinalPage F1 = new FinalPage();

//declaring boolean variables for Classes
boolean start_screen = true;
boolean game_page = false;
boolean latte_page = false;
boolean Draw_Page = false;
boolean Final_Page = false;


//Declaring boolean variable for GamePage
public boolean cafeTokyo = false;
public boolean cafeShanghai = false;
public boolean cafeAbudhabi = false;
public boolean cafeNewyork = false;

public boolean noSong = false;
public boolean heatherSong = false;
public boolean legohouseSong = false;
public boolean canadaSong = false;
public boolean newdaySong = false;

public boolean noLight = false;
public boolean brightLight = false;

public boolean cafeReady = false;

public boolean allowDraw = false;

public boolean finishTask = false;

void setup() {
  size(1200, 650);
  //Arduino-Processing code
  printArray(Serial.list());
  String portname = Serial.list()[3]; //change it to match my port

  myPort = new Serial(this, portname, 9600);
  myPort.bufferUntil('\n');

  //importing font
  CharterRoman48 = loadFont("Charter-Roman-48.vlw");

  //Load Image
  tokyo = loadImage("Image/tokyo.png");
  shanghai = loadImage("Image/shanghai.jpg");
  newyork = loadImage("Image/newyork.jpg");
  abudhabi = loadImage("Image/abudhabi.jpg");
  arrow = loadImage("Image/arrow.png");
  customer = loadImage("Image/customer.png");
  bubble = loadImage("Image/bubble.png");
  pandaimg = loadImage("Image/panda.png");
  leaveimg = loadImage("Image/leave.png");
  sunimg = loadImage("Image/sun.png");
  pandacoffeeimg = loadImage("Image/pandacoffee.png");
  leavecoffeeimg = loadImage("Image/leavecoffee.png");
  suncoffeeimg = loadImage("Image/suncoffee.png");
  artlatte = loadImage("Image/artlatte.jpg");

  //load soundfile
  heather = new SoundFile(this, "heather.mp3");
  legohouse = new SoundFile(this, "legohouse.mp3");
  canada = new SoundFile(this, "canada.mp3");
  newday = new SoundFile(this, "newday.mp3");
}

void draw() {

  //Start Screen
  if (start_screen) {
    if (order.length() > 0) { // if there is any input 
      order = order.substring(0, order.length()-order.length()); //delete all the inputs made previously
    }
    S1.drawStartScreen ();
    myPort.write('0');
    S1.update(mouseX, mouseY);
  }

  //Game Page
  if (game_page) {
    start_screen = false;
    G1.displayGamePage();
    G1.playSong();
  }

  //Latte Art Display Page
  if (latte_page) {
    L1.displayLattePage();
  }


  //Latte Art Drawing page
  if (Draw_Page) {
    D1.drawLatte();
  }

  //Final Page
  if (Final_Page) {
    F1.drawFinal();
  }
}

void keyPressed() {
  //Type in Order
  if (keyCode >= 65 && keyCode <= 90) {
    //keyCode >= 65 && keyCode <= 90 is all the alphabets 
    order = order + key;
  }

  if (key == BACKSPACE) { // allow deleting the input
    if (order.length() > 0) {
      order = order.substring(0, order.length()-1);
    }
  }

  if (keyCode == ENTER) { // confirm the order and start doing the latte art
    Draw_Page = true;
    delay(2);
    latte_page = true;
    game_page = false;
    saved = order;
    order = "";
  }
}

void mousePressed() {
  if (latte_page) {
    latte_page = false;
  }
}

void mouseClicked () {

  if (start_screen && overTokyo ) { // when click Tokyo 
    game_page = true;
    cafeReady = false;
    start_screen = false;
    cafeTokyo = true;
  } else {
    cafeTokyo = false;
  }

  if (start_screen  && overShanghai ) { // when click Shanghai
    game_page = true;
    cafeReady = false;
    start_screen = false;
    cafeShanghai = true;
  } else {
    cafeShanghai = false;
  }
  if (start_screen && overNewyork ) {  //when click New York City
    game_page = true;
    cafeReady = false;
    start_screen = false;
    cafeNewyork = true;
  } else {
    cafeNewyork = false;
  }

  if (start_screen && overAbudhabi ) { // when click Abu Dhabi
    game_page = true;
    cafeReady = false;
    start_screen = false;
    cafeAbudhabi = true;
  } else {
    cafeAbudhabi = false;
  }

  if (game_page && mouseX >10 && mouseX < 40 && mouseY > 10 && mouseY < 40 ) { // return to Start Screen
    start_screen = true;
    game_page = false;
  }

  if (Draw_Page && mouseX >1070 && mouseX < 1170 && mouseY > 570 && mouseY < 610 ) { // go to Final Screen
    Final_Page = true;
    Draw_Page = false;
  } 

  if (Final_Page && mouseX >1070 && mouseX < 1170 && mouseY > 50 && mouseY < 90 ) { // return to Start Screen
    Final_Page = false;
    start_screen = true;
    
  } 
}


// establish contact between Aruino and Processing 

void serialEvent(Serial myPort) {
  val =myPort.readStringUntil('\n'); //the '\n' is our end delimiter indicating the end of a complete packet

  if (val != null) { 
    val = trim(val);//trim whitespace and formatting characters
    println(val);//receiving data

    //look for a string to start the handshake
    //if it's there, clear the buffer, and send a request for data
    if (firstContact == false) {
      if (val.equals("A")) {
        myPort.clear();
        firstContact = true;
        myPort.write("A");
        println("contact");
      }
    } else { //if we've already established contact, keep getting and parsing data

      println(val); //receiving data
      int values [] = int(split(val, ',')); //split values by category
      if (values.length == 3) {

        if ((int)(values[0]) == 0 || int(values[0]) ==5) {
          noSong = true;
        } else { 
          noSong = false;
        } 
        if ((int)(values[0]) == 1) {
          heatherSong = true;
        } else { 
          heatherSong = false;
        } 

        if ((int)(values[0]) == 2) {
          legohouseSong = true;
        } else { 
          legohouseSong = false;
        } 

        if ((int)(values[0]) == 3) {
          canadaSong = true;
        } else { 
          canadaSong = false;
        } 

        if ((int)(values[0]) == 4) {
          newdaySong = true;
        } else {
          newdaySong = false;
        }

        //control the light of the cafe

        if ((int)(values[1]) == 0) {
          noLight = true;
        } else {
          noLight = false;
        }
        if ((int)(values[1]) == 1 || (int)(values[1]) == 2) {
          brightLight = true;
        } else {
          brightLight = false;
        }

        if ((int)(values[0]) == 0 || (int)(values[0]) ==5 && (int)(values[1]) == 0) {
          cafeReady = false;
        } else {
          cafeReady = true;
        }

        if ((int)(values[2]) >2) {
          allowDraw = true;
          brushSize = float (values[2]);
        } else {
          allowDraw = false;
        }
      }
    }
  }
}
