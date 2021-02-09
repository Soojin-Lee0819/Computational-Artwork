//Introduction to Interactive Media Assignment 3: Object Oriented Programming. 
//Soojin Lee
//5 Feb - 9 Feb 2021
//Description: This project is applying Object Oriented Programming, arrays, and Classes to create an interactive animation piece.

//ClassFish variables
int unit = 60;
int count;
int index;
Fish[] fishArray; //create an empty array for Fish

//ClassSalmon variables
int i;
int SALMONBODYSIZE = 70;
int salmonsInArray = 0; // Start with one Salmon
Salmon[] salmonArray = new Salmon[4]; // Set maximum number of Salmon as 4

// Start Function
//Start with setup()
void setup() {
  size(700, 700); 

  //setup() for fish 
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  //create fish as many as it can within the range of width, height, and unit 
  fishArray = new Fish[count];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      fishArray[index++] = new Fish(x*unit, y*unit, unit, unit, random(0.05, 0.8), unit);
    }
  }
  //setup() for fish ends

  //setup() for Salmon
  salmonArray[0] = new Salmon(random(width), random(height), random(1, 2), random(1, 2));
  // Keep track of how many Salmons are in the array
  salmonsInArray++;
  //setup() for Salmon ends
}
//setup() ends

//start function draw()
void draw() {
  background(#658EA9);  //Pastel Blue background

  for (int i=0; i < salmonsInArray; i++) {
    salmonArray[i].update();
    salmonArray[i].checkCollisions();
    salmonArray[i].drawSalmon();

    float distance = dist(mouseX, mouseY, salmonArray[i].x, salmonArray[i].y); 
    if (distance < 10) {
      salmonArray[i].erase();
    }

    for (int index = 0; index < count; index++) {
      fishArray[index].update();
      fishArray[index].drawFish();
      fishArray[index].checkCollisions();

      float touch = dist(salmonArray[i].x - SALMONBODYSIZE/2, salmonArray[i].y, fishArray[index].fishX + fishArray[index].xOffset, fishArray[index].fishY + fishArray[index].yOffset); 
      if (touch < 50) {
        fishArray[index].erase();
      }
    }
  }
}

// Draw() Ends

//mousepresssed() starts this is for Salmon 
void mousePressed() {
  // add another salmon whenever a mouse button is pressed
  // but whe it has filled the array, notify that there is no more salmon in the ocean
  if (salmonsInArray >= salmonArray.length) {
    println("Sorry, there is no more salmon in the ocean");
    return;
  } else {
    salmonArray[salmonsInArray] = new Salmon(random(width), random(height), random(1, 2), random(1, 2));
    // Keep track of how many salmons are in the array
    salmonsInArray++;
  }
  //mousepressed() ends
}
//The End
