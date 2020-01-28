float m_size = 100;
void setup()
{
  size(600, 600);
  background(51);
}

void draw()
{
  stroke(243);
  strokeWeight(3);
  float a = 2*sqrt(6-3*sqrt(3))/3;
  float A = a * m_size;
  float b = (3+sqrt(3))*(sqrt(2-sqrt(3))/3);
  float B = b * m_size;
// Courtesy: https://www.mathsisfun.com/geometry/polygons-interactive.html
// (4.50,5.60), (0.95,3.55), (3.00,0.00), (6.00,0.00), (8.05,3.55)
  translate(width/2, height/2);
  line(0, 0, A, 0);
  translate(A, 0);
  rotate(radians(-60));
  line(0, 0, B, 0);
  translate(B, 0);
  rotate(radians(-90));
  line(0, 0, B, 0);
  translate(B, 0);
  rotate(radians(-60));
  line(0, 0, B, 0);
  translate(B, 0);
  rotate(radians(-90));
  line(0, 0, B, 0);  
}
