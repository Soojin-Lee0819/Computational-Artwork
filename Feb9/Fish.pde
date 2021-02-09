//Start of Class Fish
//Name of the Class First Letter should be Capitalize 
class Fish {
  //any variable declared here will be the properties of fish
  //fish variable starts
  float fishX, fishY;
  float speed; 
  int xOffset;
  int yOffset;
  int unit;
  int xDirection = -1;
  int yDirection = -1;
  int fishWidth = 30;
  int fishHeight = 10;
  //int fish_num;
  //fish variable ends

  // Fish constructor starts
  Fish(int xOffsetTemp, int yOffsetTemp, int fishXTemp, int fishYTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    fishX = fishXTemp;
    fishY = fishYTemp;
    speed = speedTemp;
    unit = tempUnit;
  }
  // Fish constructor ends

  //Fish update() Function
  void update() {  
    // The update() function adds the speed to the position, making fish to move around
    // Random value to make fish move randomly 
    fishX = fishX + (speed*random(1, 1.5) * xDirection);
    //xArray[fish_num]=fishX;
    fishY = fishY + (speed*random(1, 1.5) * yDirection);
  }
  //Fish update() ends

  //Fish checkCollisions() starts
  void checkCollisions() {
    //Check collision to make sure fish move around within its unit
    //When x,y value reaches the unit, it changes direction so each fish always stays within the unit
    if (fishX >= unit+15 || fishX <= 15) {
      xDirection *= -1;
      fishX = fishX + (1 * xDirection);
      fishY = fishY+ (1 * yDirection);
    }
    if (fishY >= unit+10 || fishY <= 10) {
      yDirection *= -1;
      fishY = fishY + (1 * yDirection);
    }
  }
  //Fish checkCollisions() ends

  //Fish draw() starts
  void drawFish() {
    noStroke();
    fill(255);
    ellipse(xOffset + fishX, yOffset + fishY, fishWidth, fishHeight);
    triangle(xOffset + fishX +15, yOffset + fishY, xOffset + fishX + fishWidth -5, yOffset + fishY + fishHeight/2, xOffset + fishX+fishWidth -5, yOffset + fishY - fishHeight/2);
  }
  //Fish draw() 

  //Fish erase() starts 
  void erase() {
    speed = 0; 
    fishY = -1000; // removing fish out of the frame
  }
  //Fish erase() ends
}
//End of Class Fish
