float angle = 0;
float angle2 = 0;

void setup()
{
  size(600, 600);
  background(51);
  rectMode(CENTER);
}

void draw()
{
  
  background(51);
  stroke(255);
  strokeWeight(2);
  
  // Translate - Moves the origin
  /*
  rect(50, 50, 100, 50);
  translate(mouseX, mouseY);
  rect(0, 0, 100, 50);
  */

  
  // Rotate - around the origin
  /*
  push();
  translate(100, 100);
  rotate(radians(angle));
  rect(0, 0, 100, 50);
  angle = angle + 5;
  pop();
  push();
  translate(400, 400);
  rotate(radians(angle2));
  rect(0, 0, 100, 50);
  angle2 = angle2 - 2;
  pop();
  */
  push();
  translate(width/2, height/2);
  // rotate(radians(angle));
  // scale(mouseX/100);
  // scale(4, 0.5);
  scale(mouseX/100, mouseY/100);
  fill(121);
  rect(0, 0, 100, 50);
  pop();
  
  angle = angle + 1;

}
