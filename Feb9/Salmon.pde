// This is the definition of the class Salmon
// Start with the name of the class:
//Name of the class first letter Capitalize 
class Salmon {
  //any variable declared here will be properties of the class Salmon
  //Salmon variable starts
  float x, y;
  float xSpeed, ySpeed;
  //Salmon variable ends

  //constructor for Salmon
  //Salmon constructor starts
  Salmon (float xSalmonPos, float ySalmonPos, float XSPEED, float YSPEED) {
    x = xSalmonPos;
    y = ySalmonPos;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }
  //Salmon constructor ends

  //Salmon functions starts
  //Salmon update() starts
  void update() {
    // The update() function adds the speed to the position, making Salmon to move around
    x += xSpeed;
    y += ySpeed;
  }
  //Salmon update() ends

  //Salmon checkCollisions() starts
  void checkCollisions() {
    // The checkCollisions() function checks to see if the Salmon has gone off
    // the edge of the screen, and if so reverses the speed and hence the direction:
    // allow Salmon to go off screen for a bit. It doesn't have to be fully in the screen
    float r = SALMONBODYSIZE;
    float s = SALMONBODYSIZE/2;
    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    }
    if ( (y<s) || (y>height-s)) {
      ySpeed = -ySpeed;
    }
  }
  //Salmon checkCollisions() ends

  //Salmon draw() starts
  void drawSalmon() {
    //I used simple polygons like rectangle and triangle to illustrate Salmon
    fill(#E98973);
    stroke(#E98973);
    rectMode(CENTER);
    //body
    rect(x, y, SALMONBODYSIZE, SALMONBODYSIZE);
    triangle(x-SALMONBODYSIZE/2, y-SALMONBODYSIZE/2, x+SALMONBODYSIZE/3, y-SALMONBODYSIZE/1.2, x+SALMONBODYSIZE/2, y-SALMONBODYSIZE/2);
    triangle(x-SALMONBODYSIZE/4, y+SALMONBODYSIZE/2, x+SALMONBODYSIZE/3, y+SALMONBODYSIZE/1.5, x+SALMONBODYSIZE/2, y+SALMONBODYSIZE/2);
    triangle(x+SALMONBODYSIZE/2, y+SALMONBODYSIZE/2, x+SALMONBODYSIZE/2, y-SALMONBODYSIZE/2, x+SALMONBODYSIZE+SALMONBODYSIZE/2, y); 
    triangle(x-SALMONBODYSIZE/2, y+SALMONBODYSIZE/2, x-SALMONBODYSIZE, y+SALMONBODYSIZE/3, x-SALMONBODYSIZE/2, y);
    triangle(x-SALMONBODYSIZE/2, y-SALMONBODYSIZE/2, x-SALMONBODYSIZE, y-SALMONBODYSIZE/4, x-SALMONBODYSIZE/2, y);
    triangle(x+SALMONBODYSIZE+SALMONBODYSIZE/4, y, x+SALMONBODYSIZE*2+SALMONBODYSIZE/3, y, x+SALMONBODYSIZE*2+SALMONBODYSIZE/2.5, y+SALMONBODYSIZE/4);
    triangle(x+SALMONBODYSIZE+SALMONBODYSIZE/4, y, x+SALMONBODYSIZE*2+SALMONBODYSIZE/3, y, x+SALMONBODYSIZE*2+SALMONBODYSIZE/2.5, y-SALMONBODYSIZE/4);
    //eyes
    fill(225);
    ellipse(x-SALMONBODYSIZE/2, y-SALMONBODYSIZE/3, SALMONBODYSIZE/9, SALMONBODYSIZE/9);
  }
  //Salmon draw() ends

  //Salmon erase() starts
  void erase() {
    xSpeed = 0; 
    ySpeed = 0; 
    y = -1000; // removing Salmon out of the frame
  }
  //Salmon erase() ends
} 
// End of Salmon class
