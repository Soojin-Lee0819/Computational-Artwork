//Class Menupage Start
class Menupage {

  void drawMenu() {
    //Black background 
    fill(255);
    //food dish image as a background
    //Adjust tint to adjust the transparency
    tint(255, 40);
    image(menupage, 0, 0, width, height);

    tint(255, 255);
    image(arrow, 50, 705); //arrow png file create using figma 
    //draw button boundary around the arrow
    textAlign(LEFT);
    noFill();
    strokeWeight(2);
    stroke(225);
    rect(40, 700, 60, 30, 30);

    //Text
    textFont (CharterRoman48, 30);
    text ("WELCOME", 30, 70);

    //Name- Display name that users type-in
    textFont (SnellRoundhand, 69);
    text (name, 30, 140);

    //Date - Display date that users type-in
    textAlign(CENTER);
    textFont (CharterRoman48, 18);
    text ("Feb/" + day + "/2021", width/2, height/4);
    stroke(100);
    line(187, 212, 305, 212);

    //Listing Course menu display menu; randomly selected from the data table 
    textAlign(RIGHT);
    stroke(225);

    //Hors D'OEUVRE
    textFont (CharterRoman48, 23);
    text("HORS D'OEUVRE", 450, 270);

    textFont (SnellRoundhand, 18); 
    text(horsdoeuvre_c, 440, 295);

    //Appetizer
    textFont (CharterRoman48, 23);
    text("APPETIZER", 450, 355);

    textFont (SnellRoundhand, 18); 
    text(appetizer_c, 440, 380);

    //Salad
    textFont (CharterRoman48, 23);
    text("SALAD", 450, 440);

    textFont (SnellRoundhand, 18); 
    text(salad_c, 440, 465);

    //Main
    textFont (CharterRoman48, 23);
    text("MAIN", 450, 525);

    textFont (SnellRoundhand, 18); 
    text(main_c, 440, 550);

    //Dessert

    textFont (CharterRoman48, 23);
    text("Dessert", 450, 600);

    textFont (SnellRoundhand, 18); 
    text(dessert_c, 440, 625);
  }
}
//End of Class Menupage 
