void setup() {
  size(300, 300);

  for (int foo = 50; foo< width; foo = foo+ 50) {
    drawHouseAt(foo);
  }
}

void drawHouseAt(int x) {
  rect(x, 50, 40, 40);
  line(x, 50, x+20, 30);
  line(x+20, 30, x+40, 50);
}
