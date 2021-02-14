//Introduction to Interactive Media Assignment 4: Data visualization & Generative Text
//Soojin Lee
//12 Feb - 14 Feb 2021
//Title: Soojin Lee Kitchen Reservation 
//Description: Using genrative text function, I made a fine restaurant Reservation system that asks customers to write their name and date 
//to make a reservation, which comes with a generative text menu. 

//the list of in the form of cvs file (table)
Table table;

//font variable
PFont SnellRoundhand;
PFont CharterRoman48;
PFont Kokonor48;

//image variable
PImage coverpage;
PImage menupage;
PImage arrow;

//input for the user's name & day 
String name="";
String day="";

//random text variables for course menu
String  horsdoeuvre_c;
String  appetizer_c;
String  salad_c;
String  main_c;
String  dessert_c;

//preload two pages 
boolean cover = false;
boolean menu = true;

Coverpage C1 = new Coverpage(); 
Menupage M1 = new Menupage();

//Start function 
void setup() {
  background (#1B1E23);
  size(500, 800);

  //Images in the "data"directory to load 
  coverpage = loadImage("coverpage.jpg");
  menupage = loadImage("menupage.jpg");
  arrow= loadImage("arrow.png");

  //load csv file
  table = loadTable("Menu.csv", "header"); 

  //Each food item has its own list in the .csv file based on the columns
  String horsdoeuvre[] = table.getStringColumn("horsdoeuvre");
  String appetizer[] = table.getStringColumn("appetizer");
  String salad[] = table.getStringColumn("salad");
  String main[] = table.getStringColumn("main");
  String dessert[] = table.getStringColumn("dessert");

  //use font 
  SnellRoundhand = loadFont("SnellRoundhand-48.vlw");
  CharterRoman48 = loadFont("Charter-Roman-48.vlw");
  Kokonor48 = loadFont("Kokonor-48.vlw");

  //Randomly choose a string from the list for all of the fill-in-the-blanks
  horsdoeuvre_c = horsdoeuvre[int(random(0, 6))]; //random 0-7 seven different variables 
  appetizer_c = appetizer[int(random(0, 6))];
  salad_c = salad[int(random(0, 6))];
  main_c = main[int(random(0, 6))];
  dessert_c = dessert[int(random(0, 6))];
}

//Start Drawing Coverpage and Menupage
void draw() {
  background (0);
  if (!cover) {
    C1.drawCover();
  }
  if (!menu) {
    M1.drawMenu();
  }
}

//Users press key to type in information (guest name & day selection)
void keyPressed() {
  //Users type in their name 
  if (keyCode >= 65 && keyCode <= 90 || keyCode==32) { 
    //keyCode >= 65 && keyCode <= 90 is all the alphabets 
    //keyCode 32 is a space bar
    name = name + key;
  }
  //numbers for users to type in liking day
  if (key=='1' ||key=='2'  ||key=='3' ||key=='4' ||key=='5' ||key=='6' ||key=='7' ||key=='8' ||key=='9' ||key=='0') {
    day = day + key;
  }
  //allow users to make changes in case made a typo
  if (key == BACKSPACE) { 
    if (name.length() > 0) {
      name = name.substring(0, name.length()-1);
    }
  }
}

//Click mouse to move from one page to another
void mouseClicked() {
  //Click "Reserve Now" Button to make a reservation 
  if (mouseX > 350 && mouseX <459 && mouseY > 680 && mouseY < 715) { //Only when mouse is clicked within the button 
    if (name.length() > 0) { // Can reserve only when users have filled out their name
      if (day.length()>0) { // Can click reservation button only when users have filled out the date
        cover = true;
        menu = false;
      }
    }
  }
  //Click return Button to make another reservation 
  if (mouseX < 200 && mouseY > 600 ) {
    setup(); //this reset the program so the new data for generative text menu will be loaded 
    name = name.substring(0, name.length()-name.length()); //This erases name to reset
    day = day.substring(0, day.length()-day.length()); // This erases date to reset 
    cover = false;
    menu = true;
  }
} 
