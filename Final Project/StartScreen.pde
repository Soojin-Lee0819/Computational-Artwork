//Construct the startscreen class 
int TokyoX = 0, TokyoY = 0; //position of Tokyo Image 
int ShanghaiX = 600, ShanghaiY =0; //position of Shanghai Image 
int NewyorkX =600, NewyorkY = 325; //position of NewYork Image 
int AbudhabiX = 0, AbudhabiY = 325; //position of AbuDhabi Image 

int imageWidth = 600; //width of image
int imageHeight = 325; //height of image

//set boolean for mouse over images
public boolean overTokyo = false;
public boolean overShanghai = false;
public boolean overAbudhabi = false;
public boolean overNewyork = false;


class StartScreen { 


  void drawStartScreen() {
    background (0);
    tint(255, 50);
    image(tokyo, 0, 0, width/2, height/2);
    textSize(17);
    fill(255);
    text("Tokyo", 270, 160);
    image(shanghai, 600, 0, width/2, height/2);
    text("Shanghai", 870, 160);
    image(abudhabi, 0, 325, width/2, height/2);
    text("Abu Dhabi", 270, 490);
    image(newyork, 600, 325, width/2, height/2);
    text("New York City", 870, 490);

    update(mouseX, mouseY);


    if (heather.isPlaying()) {
      heather.stop();
    } 
    if (legohouse.isPlaying()) {
      legohouse.stop();
    } 
    if (canada.isPlaying()) {
      canada.stop();
    } 
    if (newday.isPlaying()) {
      newday.stop();
    }

    tint (255, 255);
    if (overShanghai) {
      myPort.write('1');
      image(shanghai, 600, 0, width/2, height/2);
    } else {
      myPort.write ('0');
    }
    if (overTokyo) {
      myPort.write('2');
      image(tokyo, 0, 0, width/2, height/2);
    } else {
      myPort.write ('0');
    } 
    if (overNewyork) {
      myPort.write('3');
      image(newyork, 600, 325, width/2, height/2);
    } else {
      myPort.write ('0');
    }
    if (overAbudhabi) {
      myPort.write('4');
      image(abudhabi, 0, 325, width/2, height/2);
    } else {
      myPort.write ('0');
    }
  }


  void update(int x, int y) {
    if ( shanghaiOver (ShanghaiX, ShanghaiY, imageWidth, imageHeight)) {
      overShanghai = true;
      overTokyo  = false;
      overAbudhabi = false;
      overNewyork = false;
    } else if ( tokyoOver (TokyoX, TokyoY, imageWidth, imageHeight)) {
      overShanghai = false;
      overTokyo  = true;
      overAbudhabi = false;
      overNewyork = false;
    } else if ( newyorkOver (NewyorkX, NewyorkY, imageWidth, imageHeight)) {
      overShanghai = false;
      overTokyo  = false;
      overAbudhabi = false;
      overNewyork = true;
    } else if ( abudhabiOver (AbudhabiX, AbudhabiY, imageWidth, imageHeight)) {
      overShanghai = false;
      overTokyo  = false;
      overAbudhabi = true;
      overNewyork = false;
    } else {
      overShanghai = overTokyo = overAbudhabi = overNewyork = false;
    }
  }

  boolean shanghaiOver (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean tokyoOver (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean abudhabiOver (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  boolean newyorkOver (int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}
