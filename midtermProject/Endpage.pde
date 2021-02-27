//Class endpage is the page players encounter when they have successfully complete the game
class Endpage {

  void display () {
    background(0);
    textAlign(CENTER);
    fill(255);
    rect(650, 700, 100, 40, 10);
    textFont (BaskervilleItalic48, 40);
    fill (255);
    text("Congratulations!", 140, 70);
    textSize (20);
      textAlign(LEFT);
    text("You have successfully collected all the songs on the playlist!\n Please click the playlist to listen to any song you wish \n Click Restart if you want to play this game again!", 120, 120);
    fill (0);
    textAlign(CENTER);
    text("Restart", 700, 725);

    fill (255);
    rect(410, 193, 318, 70, 100); 
    rect(410, 293, 318, 70, 100); 
    rect(410, 393, 318, 70, 100); 
    rect(410, 493, 318, 70, 100); 
    rect(410, 593, 318, 70, 100); 
    
     for (int i=0; i<5; i++) {
      Songs[i].displayEndpage();

    image(playlist, 80, 200, 250, 440);

    textAlign(LEFT);
    fill (50);
    textSize (16);
    text("Strawberries & Cigarettes\nTroyeSivan", 500, 222);
    text("Do You Want To Build a Snowman?\nKristenAnderson-Lopez & Robert Lopez", 500, 322);
    text("Counting Stars\nOneRepublic", 500, 422);
    text("A Whole New World\nZhavia Ward & Zayn Malik", 500, 522);
    text("White Christmas\nBing Crosby", 500, 622);
  }
}
}
