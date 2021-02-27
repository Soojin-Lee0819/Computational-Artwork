//Class Landpage is the page player first encounters when they run the program
class Landpage {

  void displayLandpage () {
    image(landpage, 0, 0, width, height);
  }
};

//position song image into the LP player of the background image
void displaySong1() {
  image(Song1, 42, 193, 188, 190);
}

void displaySong2() {
  image(Song2, 304, 193, 188, 190);
}

void displaySong3() {
  image(Song3, 564, 193, 188, 190);
}

void displaySong4() {
  image(Song4, 191, 446, 188, 190);
}

void displaySong5() {
  image(Song5, 443, 446, 188, 190);
}

//Create startButton to start the game 
void StartButton() {
  textAlign(CENTER);
  fill(255);
  rect(650, 700, 100, 40, 10);
  textFont (BaskervilleItalic48, 19);
  fill (0);
  text("Start", 700, 725);
}

//Write down instruction on how to start the game and what players can expect from this game
void instructionDisplay () {
  textAlign(LEFT);
  fill(0);
  textFont (BaskervilleItalic48, 35);
  text("Welcome to Tune-in Catcher!", 99, 55);
  textFont (HannotateTC, 19);
  text("Hover on LP to listen to songs.\nOnce you explored all the songs, please click 'Start' button to start!\nYour task is to collect falling item that represents the song. \nCaution! If you accidently catch the bomb, the game will restart! Enjoy:)", 100, 90);
};
