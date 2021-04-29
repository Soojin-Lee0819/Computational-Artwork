class DrawPage { 
  
  void drawLatte(){
   // Paint & draw with Blue Brush by pressing the mouse
    strokeWeight (brushSize);
    stroke(221,138, 60);

    if ((mousePressed == true) && (allowDraw)) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}
