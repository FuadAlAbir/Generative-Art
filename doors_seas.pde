/*-----------------------------
    I N T R O D U C T I O N
-------------------------------
Author:         Fuad Al Abir
Dated:          March 14, 2019
Project Name:   Doors & Seas
*/

int r = 50;
int x = 0;
int y = r;
// int y = 0;
int s = 21;

void setup()
{
  size(640, 500);
  background(0);
}

void draw()
{
  noStroke();
  
  fill(0,0, random(255), 112);
  ellipse(x, y - 50, 100, 100);
  ellipse(x, y, 100, 100);
  //fill(0, 0, random(255));
  ellipse(x, y + 50, 100, 100);
  ellipse(x, y + 100, 100, 100);
  //fill(0, 0, random(255));
  ellipse(x, y + 150, 100, 100);
  ellipse(x, y + 200, 100, 100);
  //fill(0, 0, random(255));
  ellipse(x, y + 250, 100, 100);
  ellipse(x, y + 300, 100, 100);
  //fill(0, 0, random(255));
  ellipse(x, y + 350, 100, 100);
  ellipse(x, y + 400, 100, 100);
  ellipse(x, y + 450, 100, 100);


  /*
  fill(random(255), 0, 0);
  //fill(0, 0, random(255));
  rect(x, y, 100, 100);
  
  fill(random(255), 0, 0);
  //fill(0, 0, random(255));
  rect(x, y + 100, 100, 100);
  
  fill(random(255), 0, 0);
  //fill(0, 0, random(255));
  rect(x, y + 200, 100, 100);

  //fill(random(255), 0, 0);
  fill(0, 0, random(255), 5);
  rect(x, y + 300, 100, 100);

  fill(random(255), 0, 0);
  //fill(0, 0, random(255));
  rect(x, y + 400, 100, 100);
  */
  
  x = x + s;
  
  if(x - r > width)
  {
    // saveFrame();
    background(0);
    x = 0;
  }
  
}
