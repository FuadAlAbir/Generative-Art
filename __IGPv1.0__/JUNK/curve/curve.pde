void setup() {
  size(300, 200);
  background(255);
  smooth();
  

}

void draw()
{
  background(243);
  noFill();
  beginShape();
  vertex(mouseX, mouseY);
  bezierVertex(width, 0, 80, 75, 30, 200);
  endShape();
}
