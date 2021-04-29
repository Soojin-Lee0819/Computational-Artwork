class LatteArtPage { 
  void displayLattePage() {
    background(255);
    fill(0);
    textSize(13);
    image(artlatte, 0, 0, 530, 650);

    text("To start drawing Latte Art, press the mouse.\nDial PINK potentiometer to adjust the brush size. \nOnce you have finished drawing, press READY to serve", 650, 575);
    if  (saved.equals (panda) == true) {
      image(pandaimg, 620, 40, 500, 500);
    } 
    if  (saved.equals (leaves) == true) {
      image(leaveimg, 620, 40, 500, 500);
    }
    if  (saved.equals (sun) == true) {
      image(sunimg, 620, 40, 500, 500);
    }
    noStroke();
    rect(1070,570,100,40, 10);
    fill(255);
    textSize(18);
    text("READY",1095, 595);
  }
  

}
