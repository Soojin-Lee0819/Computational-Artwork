/* This is Soojin's first hw for Intro to IM
Assoignment: Self-portrait

This program was written by Soojin Lee
21-24 Jan 2021
*/

float eyebrowsMove; 
float blushMove;

//size 
void setup(){
  size (800, 800);
  background (#957DAD); 
  eyebrowsMove = 240;
  blushMove = 70;
}

void draw() {
  
  //all colors are here
  color face = #FFE0BD;
  color hair = #3D2314;
  color eye = color(250);
  color mouth = #D13525;
  color blush = #F6CFCA;
  color button = #fff8e7;
  color shirt = #6897bb;

  //background pattern 
  //I wanted to create a background that captures the personality of myself. Overall, I am a very positive, bright and warm person, hence I used sunshie shape as a background pattern  
  // To create sunshine patterns, I set x, y position for one big circle, positioned small circle around it, and and copy pasted position to create rest of the sun shape by changing to x, y axis

  //x-axis position for circle orange 1
  //I already used letter a for float a. Next time I should order them in alphabetical order. 
  int c; 
  c = 220;

  //y-axis position for circle orange 1
  int b;
  b= 170;
  
  noStroke ();
  frameRate(1);
  
  //yellow sunlight color 
  float redColor = random (230, 255);
  float greenColor = random (185,220);
  float blueColor = random (40, 60);
  
  //animating yellow sunlight color
  fill (redColor,greenColor, blueColor);
  
  //yellow 1
  circle (c-190, b-140, 100);
  //yellow 2
  circle (c-80, b+380, 100);
  //yellow 3
  circle (c+480, b+530, 100);

  //smalll yellow circle for orange 1 
  circle (c+34, b-49, 10);
  circle (c+14, b-57, 10);
  circle (c-6, b-59, 10);
  circle (c-26, b-55, 10);
  circle (c-46, b-40, 10);
  circle (c-57, b-20, 10);
  circle (c-60, b, 10);
  circle (c-57, b+20, 10);
  circle (c-49, b+40, 10);
  circle (c-31, b+54, 10);
  circle (c-13, b+62, 10);
  circle (c+7, b+62, 10);
  circle (c+27, b+58, 10);
  circle (c+46, b+45, 10);
  circle (c+57, b+25, 10);
  circle (c+61, b+3, 10);
  circle (c+58, b-20, 10);
  circle (c+50, b-38, 10);


  //smalll yellow circle for orange 2

  circle (c+34+480, b+30-49, 10);
  circle (c+14+480, b+30-57, 10);
  circle (c-6+480, b+30-59, 10);
  circle (c-26+480, b+30-55, 10);
  circle (c-46+480, b+30-40, 10);
  circle (c-57+480, b+30-20, 10);
  circle (c-60+480, b+30, 10);
  circle (c-57+480, b+30+20, 10);
  circle (c-49+480, b+30+40, 10);
  circle (c-31+480, b+30+54, 10);
  circle (c-13+480, b+30+62, 10);
  circle (c+7+480, b+30+62, 10);
  circle (c+27+480, b+30+58, 10);
  circle (c+46+480, b+30+45, 10);
  circle (c+57+480, b+30+25, 10);
  circle (c+61+480, b+30+3, 10);
  circle (c+58+480, b+30-20, 10);
  circle (c+50+480, b+30-38, 10);

  //smalll yellow circle for orange 3
  circle (c+80+34, b+600-49, 10);
  circle (c+80+14, b+600-57, 10);
  circle (c+80-6, b+600-59, 10);
  circle (c+80-26, b+600-55, 10);
  circle (c+80-46, b+600-40, 10);
  circle (c+80-57, b+600-20, 10);
  circle (c+80-60, b+600, 10);
  circle (c+80-57, b+600+20, 10);
  circle (c+80-49, b+600+40, 10);
  circle (c+80-31, b+600+54, 10);
  circle (c+80-13, b+600+62, 10);
  circle (c+80+7, b+600+62, 10);
  circle (c+80+27, b+600+58, 10);
  circle (c+80+46, b+600+45, 10);
  circle (c+80+57, b+600+25, 10);
  circle (c+80+61, b+600+3, 10);
  circle (c+80+58, b+600-20, 10);
  circle (c+80+50, b+600-38, 10);

  //orange sunlight color
  float red2Color = random (235, 250);
  float green2Color = random (100,120);
  float blue2Color = random (0, 20);
  
  //animating orange sunlight color
  fill (red2Color, green2Color, blue2Color);  
  
  //orange 1
  circle (c, b, 100);
  //orange 2
  circle (c+480, b+30, 100);
  //orange 3
  circle (c+80, b+600, 100);

  //small circle for yellow 1
  circle (c-190+34, b-140-49, 10);
  circle (c-190+14, b-140-57, 10);
  circle (c-190-6, b-140-59, 10);
  circle (c-190-26, b-140-55, 10);
  circle (c-190-46, b-140-40, 10);
  circle (c-190-57, b-140-20, 10);
  circle (c-190-60, b-140, 10);
  circle (c-190-57, b-140+20, 10);
  circle (c-190-49, b-140+40, 10);
  circle (c-190-31, b-140+54, 10);
  circle (c-190-13, b-140+62, 10);
  circle (c-190+7, b-140+62, 10);
  circle (c-190+27, b-140+58, 10);
  circle (c-190+46, b-140+45, 10);
  circle (c-190+57, b-140+25, 10);
  circle (c-190+61, b-140+3, 10);
  circle (c-190+58, b-140-20, 10);
  circle (c-190+50, b-140-38, 10);
  
  //smalll circle for yellow 2  
  circle (c+34-80, b-49+380, 10);
  circle (c+14-80, b-57+380, 10);
  circle (c-6-80, b-59+380, 10);
  circle (c-26-80, b-55+380, 10);
  circle (c-46-80, b-40+380, 10);
  circle (c-57-80, b-20+380, 10);
  circle (c-60-80, b+380, 10);
  circle (c-57-80, b+20+380, 10);
  circle (c-49-80, b+40+380, 10);
  circle (c-31-80, b+54+380, 10);
  circle (c-13-80, b+62+380, 10);
  circle (c+7-80, b+62+380, 10);
  circle (c+27-80, b+58+380, 10);
  circle (c+46-80, b+45+380, 10);
  circle (c+57-80, b+25+380, 10);
  circle (c+61-80, b+3+380, 10);
  circle (c+58-80, b-20+380, 10);
  circle (c+50-80, b-38+380, 10);
  
  //smalll circle for yellow 3
  circle (c+34+480, b-49+530, 10);
  circle (c+14+480, b-57+530, 10);
  circle (c-6+480, b-59+530, 10);
  circle (c-26+480, b-55+530, 10);
  circle (c-46+480, b-40+530, 10);
  circle (c-57+480, b-20+530, 10);
  circle (c-60+480, b+530, 10);
  circle (c-57+480, b+20+530, 10);
  circle (c-49+480, b+40+530, 10);
  circle (c-31+480, b+54+530, 10);
  circle (c-13+480, b+62+530, 10);
  circle (c+7+480, b+62+530, 10);
  circle (c+27+480, b+58+530, 10);
  circle (c+46+480, b+45+530, 10);
  circle (c+57+480, b+25+530, 10);
  circle (c+61+480, b+3+530, 10);
  circle (c+58+480, b-20+530, 10);
  circle (c+50+480, b-38+530, 10);

  //finish background 
  //Start drawing portrait of a person
  
  //hair
  fill (hair);
  ellipse (400, 300, 380, 500);
  ellipse (280, 400, 200, 300);
  ellipse (520, 400, 200, 300);

 //face
 noStroke();
 int faceWidth = 300;
 int faceHeight = 370;
 fill(face);
 ellipse (width/2, (height/3)+10, faceWidth, faceHeight);

  //bangs (It was difficult to learn how to rotate shape I had to return the rotation back after rotating shapes)
  rotate(radians(-20));
  fill (hair);
  arc(230, 180, 220, 150, 0, radians(140), OPEN);
  rotate(radians(70));
  arc(350,-330, 250, 170, 0, radians(120), OPEN);
  rotate(radians(-50));
  
  //blush 
  fill (blush);
  ellipse(300, 340, blushMove, blushMove); 
  ellipse(500, 340, blushMove, blushMove);

  if (blushMove == 70) {
    blushMove = blushMove -5;
  } else {
      blushMove = blushMove +5;
  }
      

  //eyes
  stroke(0,0,0);
  strokeWeight (1.5);
  fill(eye);
  ellipseMode(RADIUS);
  ellipse (340, 240, 28, 20);
  ellipse (460, 240, 28, 20);
  
  //pupils
  ellipseMode(CENTER);
  fill(50);

  float leftPupilX = map(mouseX, 0, 800, 327, 353);
  float leftPupilY = map(mouseY, 0, 800, 237, 243);
  float rightPupilX = map(mouseX, 0, 800, 447, 473);
  float rightPupilY = map(mouseY, 0, 800, 237, 243);
    
  ellipse (leftPupilX, leftPupilY, 28, 33);
  ellipse (rightPupilX,rightPupilY, 28, 33);

  //eyebrows
  noFill();
  strokeWeight(2);
  curve (310 ,eyebrowsMove, 320, eyebrowsMove-30, 360, eyebrowsMove-30 , 370, eyebrowsMove);
  int steps = 6;
  for (int i=0; i <= steps; i++) {
      float t = i/float(steps);
      float x = curvePoint(310, 320, 360, 370, t);
      float y = curvePoint(eyebrowsMove, eyebrowsMove-30, eyebrowsMove-30, eyebrowsMove, t);
      //ellipse(x,y,5,5,);
      float tx= curveTangent(310, 320, 360, 370, t);
      float ty= curveTangent(eyebrowsMove, eyebrowsMove-30, eyebrowsMove-30, eyebrowsMove, t);
      float a = atan2(ty,tx);
      a-=PI/2.0;
      line(x,y,cos(a)*8 + x, sin(a)*8 +y);
    }

  curve (430 ,eyebrowsMove, 440, eyebrowsMove-30, 480, eyebrowsMove-30 , 490, eyebrowsMove);
  for (int i=0; i <= steps; i++) {
      float t = i/float(steps);
      float x = curvePoint(430, 440, 480, 490, t);
      float y = curvePoint(eyebrowsMove, eyebrowsMove-30, eyebrowsMove-30, eyebrowsMove, t);
    
      float tx= curveTangent(430, 440, 480, 490, t);
      float ty= curveTangent(eyebrowsMove, eyebrowsMove-30, eyebrowsMove-30, eyebrowsMove, t);
      float a = atan2(ty,tx);
      a-=PI/2.0;
      line(x,y,cos(a)*8 + x, sin(a)*8 +y);
  }

  if (eyebrowsMove == 240) {
    eyebrowsMove = eyebrowsMove -10;
  } else {
    eyebrowsMove = eyebrowsMove +10;
  }
      
  //nose

  noFill ();
  strokeWeight(3);
  beginShape();
  vertex(400,280);
  quadraticVertex(394, 290, 386, 310);
  quadraticVertex(400, 317, 407, 310);
  vertex(407, 310);
  endShape();

  //ears
  noStroke ();
  fill (face);
  ellipse (250, 300, 25, 45);
  ellipse (550, 300, 25, 45);
  
  //earing
  fill (#FF007F);
  line (250, 320, 250, 330);
  noStroke ();
  ellipse (250, 330, 15, 15);
  ellipse (550, 330, 15, 15);
  
  //mouth 
  noStroke ();
  fill (mouth);
  arc(width/2, height/2.1 -20, 75, 70, 0, PI, CHORD);

  //upperbody 
  int bodyHeight = 200;
  fill (shirt);
  rectMode (CENTER);
  rect (width/2, height/1.4 -11, faceWidth+40, bodyHeight, 500, 500, 10, 10);
  
  //button

  stroke(0,0,0);
  strokeWeight (2);
  fill (button);
  circle (400, 530, 23);
  circle (400, 580, 23);

  //neck
  stroke(#ECBE7A);
  strokeWeight(7);
  fill (face);
  arc(width/2, height/1.7 -15, 80,80, 0, PI, OPEN);
  
  //Save each frame so I can export it as a GIF online

}
