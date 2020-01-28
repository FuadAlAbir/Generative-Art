float x = 0;
float y = 0;
float spacing = 40;
void setup()
{
  size(600, 600);
  background(51);
}

void draw()
{
  strokeWeight(6);
  stroke(243);
  
  if(random(1) < 0.5)
  {
    line(x, y, x + spacing, y + spacing);
  }
  else
  {
    line(x + spacing, y, x, y + spacing);
  }
  x = x + spacing;
  if(x > width)
  {
    x = 0;
    y = y + spacing;
  }
}
