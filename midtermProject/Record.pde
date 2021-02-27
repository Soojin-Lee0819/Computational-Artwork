//class for Record that players move around to catch items 
class Record {
  int recordCoordinatex, recordCoordinatey;// initial coordinates of the Recorder
  int x, y;//coordinates of the Recorder
  int recordSize = 150;
  boolean startgame=true;
  
  Record() {
    x=500;
    recordCoordinatex=x; // later to check collision with Items
    y=500;
    recordCoordinatey=y;// later to check collision with Items
  };

  void display() {
    PImage Record; // load png file for Record
    
    if (startgame) {//display Record only when the game starts
    Record=loadImage("img/Record.png");
    image(Record, x, y, recordSize, recordSize+50);
    }
  };

  void move() {//controls the direction of the record from keyboard and restrict it from going out tf the window
    if (left && x>0) {
      x=x-10;
      recordCoordinatex=x;
    }
    if (right && x<800) {
      x=x+10;
      recordCoordinatex=x;
    }
  };
  
  // This is to make record disappear when the game ends
  void erase() {
   recordSize = 0;
  }
  
   // This is to make record reappear when the game restarts
  void appear() {
     recordSize = 150;
  }
  
  
};
