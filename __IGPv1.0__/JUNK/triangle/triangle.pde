void setup()
{
  size(600, 600);
  background(51);
}

void draw()
{
  background(51);
  stroke(255);
  strokeWeight(2);
  
  float l = 100;
  float h = sqrt(3)/2*l;
  
  for(int j = 0; j <= height; j += h*2)
  {
    for(int i = 0; i <= width; i += l)
    {
      line(i, h + j, i + l, h + j);
      line(i, h + j, i + l/2, j);
      line(i + l/2, j, i + l, h + j);
      
      line(i - l/2, j, i + l/2, j);
      line(i - l/2, j, i, h + j);
      line(i + l/2, j, i, h + j);
           
      line(i, j + h, i - l/2, j + h*2);
      line(i, j + h, i + l, j + h);
      line(i, j + h, i + l/2, j + h*2);
      
      line(i, j + h, i + l, j + h);
      line(i, j + h, i + l/2, j + h * 2);
      line(i + l, j + h, i + l/2, j + h * 2);
    } 
  }
}
