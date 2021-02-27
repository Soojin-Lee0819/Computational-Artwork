//This is for song cover images 

class Song { 
  int songCoordinatex, songCoordinatey; // the coordinate of items
  int songSize; // size of song
  int songType; // type of song
  int tintValue = 100; //initial tint value dark 
  
  Song (int num) {
    songType=num+1;
    songCoordinatex=0;
    songCoordinatey=(num+1);
    songSize=50;
  }

  void display() {
    String Songimgname="img/Song"+str(songType)+".png";//generate img name for song
    PImage Song;
    Song=loadImage(Songimgname);
    tint(255, tintValue);
    image(Song, songCoordinatex+50, songCoordinatey*100, songSize, songSize); //load image for song
  };

  void displayEndpage() {
    String Songimgname="img/Song"+str(songType)+".png";//generate img name for Item
    PImage Song;
    Song=loadImage(Songimgname);
    image(Song, songCoordinatex+410, 93+songCoordinatey*100, songSize+20, songSize+20); //load image for item
  };
  
  //this is to make the song image become bright when captured correct item
   void displayBright() {
     tintValue = 255;
     display();

  };

};
