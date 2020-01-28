List <polygon> polys = new ArrayList<polygon>();

float angle = 60;
float delta = .01;

slider angleSlider;
slider deltaSlider;

void setup()
{
  size(600, 600);
  background(51);
  angleSlider = new slider((width / 2) + 20, height - 40, 15, 180, 60, 1);
  deltaSlider = new slider(20, height - 40, .01, 25, .01, 5);
  
  int inc = 100;
  for(int x = 0; x < width; x += inc)
  {
    for(int y = 0; y < height; y += inc)
    {
      polygon poly = new polygon();
      poly.addVertex(x, y);
      poly.addVertex(x + inc, y);
      poly.addVertex(x + inc, y + inc);
      poly.addVertex(x, y + inc);
      poly.close();
      polys.add(poly);
    }
  }
}

void draw()
{
  background(51);
  
  angle = angleSlider.value();
  delta = deltaSlider.value();
  
  for(int i = 0; i < polys.size(); i++)
  {
    polys.get(i).hankin();
    polys.get(i).show();
  }
  
  angleSlider.show();
  deltaSlider.show();
}
