/*-----------------------------
    I N T R O D U C T I O N
-------------------------------
Author:         Fuad Al Abir
Dated:          March 15, 2019
Project Name:   LineDraw
Source:         https://www.youtube.com/watch?v=Y1bPsh1mFUI
*/
/*-----------------------------
    I N S T R U C T I O N
-------------------------------
  1. Move mouse pointer to draw
  2. Click to same image
*/

void setup()
{
  size(640, 480);
  stroke(255);
  background(0);
}

void draw()
{
  line(100, 100, mouseX, mouseY);
  if(mousePressed == true)
  {
    saveFrame("line####.png");
  }
}
