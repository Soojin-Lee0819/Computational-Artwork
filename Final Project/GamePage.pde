class GamePage { 


  void displayGamePage() {
    background(0);

    if (cafeTokyo) {
      if (noLight) {
        tint(255, 50);
        image(tokyo, 0, 0, width, height);
      } 

      if (brightLight) {
        tint(255, 255);
        image(tokyo, 0, 0, width, height);
      }
    } 
    if (cafeShanghai) {
      if (noLight) {
        tint(255, 50);
        image(shanghai, 0, 0, width, height);
      } 
   
      if (brightLight) {
        tint(255, 255);
        image(shanghai, 0, 0, width, height);
      }
    } 

    if (cafeNewyork) {
      if (noLight) {
        tint(255, 50);
        image(newyork, 0, 0, width, height);
      } 
   
      if (brightLight) {
        tint(255, 255);
        image(newyork, 0, 0, width, height);
      }
    }

    if (cafeAbudhabi) {

      if (noLight) {
        tint(255, 50);
        image(abudhabi, 0, 0, width, height);
      } 
 
      if (brightLight) {
        tint(255, 255);
        image(abudhabi, 0, 0, width, height);
      }
    } 

    image(arrow, 10, 10, 30, 30);

    if (!cafeReady) {
      fill(0, 0, 0, 191);
      rect(900, 500, 265, 110, 10);
      textSize(13);
      fill(255);    
      text("Welcome! \n Lets design the cafe ambience.\n 1.Shed the Light to the photoresistor\n 2. Dial ORANGE potentiometer for music ", 910, 530);
    } else {
      cafeReady = true;
    }

    if (cafeReady) {
      fill(255, 255, 255, 191);
      noStroke();
      rect(870, 500, 310, 130, 10);
      fill(0);
      textSize(14);
      text("Press the yellow button to receive an order.\nAsk your friend to say STOP. \nStop pressing the button.\nWhat spinner indicates is the order.\nType in the order, then press ENTER.", 880, 525);
      image(customer, 200, 200, 200, 350);
      image(bubble, 350, 110, 220, 120);
      textSize(18);
      text("Can I get a "+order+"\nlatte please?", 380, 155);
      }
     else {
      cafeReady = false;
    }
    
}
    
 
  void playSong () {

    if (noSong) {
      if (legohouse.isPlaying()) {
        legohouse.stop();
      } 
      if (canada.isPlaying()) { 
        canada.stop();
      }
      if (newday.isPlaying()) { 
        newday.stop();
      }
      if (heather.isPlaying()) {
        heather.stop();
      }
    }

    if (heatherSong && heather.isPlaying() == false) { 
      if (legohouse.isPlaying()) {
        legohouse.stop();
      } 
      if (canada.isPlaying()) { 
        canada.stop();
      }
      if (newday.isPlaying()) { 
        newday.stop();
      } 
      heather.play();
    }  
    if (legohouseSong && legohouse.isPlaying() == false) { 
      if (heather.isPlaying()) {
        heather.stop();
      } 
      if (canada.isPlaying()) { 
        canada.stop();
      }
      if (newday.isPlaying()) { 
        newday.stop();
      } 
      legohouse.play();
    }
    if (canadaSong && canada.isPlaying() == false) { 
      if (legohouse.isPlaying()) {
        legohouse.stop();
      } 
      if (heather.isPlaying()) { 
        heather.stop();
      }
      if (newday.isPlaying()) { 
        newday.stop();
      } 
      canada.play();
    }
    if (newdaySong && newday.isPlaying() == false) { 
      if (legohouse.isPlaying()) {
        legohouse.stop();
      } 
      if (canada.isPlaying()) { 
        canada.stop();
      }
      if (heather.isPlaying()) { 
        heather.stop();
      } 
      newday.play();
    }
  }
}
