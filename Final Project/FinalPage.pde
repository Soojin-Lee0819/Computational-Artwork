class FinalPage { 
  void drawFinal () {
    background(255);

    image(customer, 200, 200, 200, 350);
    image(bubble, 350, 110, 220, 120);
    textSize(18);
    fill(0);
    text("Thank you!\nThis is Perfect!", 380, 155);

    noStroke();
    rect(1070, 50, 100, 40, 10);
    fill(255);
    textSize(18);
    text("RESTART", 1083, 80);

    if  (saved.equals (panda) == true) {
      image(pandacoffeeimg, 620, 65, 500, 500);
    } 
    if  (saved.equals (leaves) == true) {
      image(leavecoffeeimg, 620, 65, 500, 500);
    }
    if  (saved.equals (sun) == true) {
      image(suncoffeeimg, 620, 65, 500, 500);
    }
  }
}
