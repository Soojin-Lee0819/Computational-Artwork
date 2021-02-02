//Introduction to Interactive Media Assignment 2: Repeating Art
//Soojin Lee
//30 Jan - 2 Feb 2021
//Description: This is an graphic art piece using randomization feature on processing to generate images.

color background = color (0); //set background color black to highlight the vibrance of leaves 
color branch = color(250);

void setup () {
  size(700, 800);
  background (background); 
  drawLeaves();
  drawMask(); // Mask is to cover leaves shapes into round ellipse that makes a tree shape
  drawBranch(width/2, height, 7); //branch is drawn last in order of shape composition and layer
}

//Draw Leaves 

void drawLeaves () { //using loops( for() ) to represent leaves 
  for (int xLeafFirstPosition = 50; xLeafFirstPosition <width; xLeafFirstPosition += 15) { 
    for (int yLeafFirstPosition = 150; yLeafFirstPosition <height -130; yLeafFirstPosition += 25) {
      pushMatrix();//pushMatrix & popMatrix to make sure rotation does not effect rest of the shapes
      noStroke();
      fill (random (200), random(200), random(50)) ; // I set the RGB vaue random to represent a tree with colorful leaves. I lowered the B value since I wanted to represent yellow, orange green leave colors
      rotate (radians(int (random(-3, 3)))); // to represent the organic shape, I put the radian value random 
      ellipse (xLeafFirstPosition, yLeafFirstPosition, 10, 15);
      ellipse (xLeafFirstPosition +30, yLeafFirstPosition -20, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -50, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -70, 10, 15);

      rotate (radians(int (random(-5, 5)))); 
      ellipse (xLeafFirstPosition, yLeafFirstPosition, 10, 15);
      ellipse (xLeafFirstPosition +30, yLeafFirstPosition -20, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -50, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -70, 10, 15);

      rotate (radians(int (random(-15, 15)))); 
      ellipse (xLeafFirstPosition, yLeafFirstPosition, 10, 15);
      ellipse (xLeafFirstPosition +30, yLeafFirstPosition -20, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -50, 10, 15);
      ellipse (xLeafFirstPosition -30, yLeafFirstPosition -70, 10, 15);
      popMatrix();
    }
  }
}


//to mask pattern of leaves into the shape of tree
//I appempted pShape function to to customize shape (rectangle with a ellipse hole), but pShape ellipse function was too complicated.
//Instead, I creatively made an ellipse with no fill and thick stroke to have the similar effect

void drawMask () {
  noFill();//this inner unfilled inner circle will be the part where leaves are shown
  stroke(background); //stroke will mask the leaves that are positioned at unwanted area
  strokeWeight(250);
  ellipse (width/2, height/2+-40, 800, 900);
}

//draw fractal tree 
//To draw branch, I applied the fractal tree code reference from https://www.rosettacode.org/wiki/Fractal_tree#Processing
/*1.draw the trunk
 2. At the end of the trunk, split by some angle and draw two brances
 3. Repeat the split until a sufficient level of brancing is reached */

void drawBranch(float x, float y, int split) {
  stroke(branch);
  strokeWeight(6);
  float tiltAngle =radians(int(random(21, 15))); //Pay attention to detail: Fixed value of tiltAngle will make branch look inorganic; hence gave a random value for tiltAngle
  float baseLength = int (random(8.5, 13)); // Pay attention to detale: Fixed value of branch length will make it look inorganic; hence a random value for baseLength
  if (split > 0) {
    pushMatrix();
    translate(x, y - baseLength * split);
    line(0, baseLength * split, 0, 0);  
    rotate(tiltAngle);
    drawBranch(0, 0, split - 1);  
    rotate(2 * -tiltAngle);// *2 to have another branch at the opposite side of the first split branch
    drawBranch(0, 0, split - 1); 
    popMatrix();
  }
  saveFrame("line-######.png");
}

//end of work
