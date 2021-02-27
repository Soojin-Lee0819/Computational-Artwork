//gamepage is the page that appears during game
class Gamepage {

  //display return icon and song images on the side
  void display() {
    image(returnicon, 10, 20, 35, 20);
   for (int i=0; i<5; i++) {
      Songs[i].display();
  }
}
}
