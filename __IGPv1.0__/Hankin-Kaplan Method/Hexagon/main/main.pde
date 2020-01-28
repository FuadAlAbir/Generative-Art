List <polygon> polys = new ArrayList <polygon>();

float angle = 5;
float delta = 10;
float sides = 6;


float l = 40;
float h = sqrt(3) * l;

slider angleSlider;
slider deltaSlider;

void setup()
{
  size(600, 600);
  background(51);

  angleSlider = new slider((width / 2) + 20, height - 40, 30, 115, 60, 5);
  deltaSlider = new slider(20, height - 40, .001, 15, .001, .001); // limit: 0 to 50

  /*
  int i = width/2;
  int j = height/2;
  polygon p1 = new polygon(6);
  p1.addVertex(i, j);
  p1.addVertex(i - l * 0.5, j + h / 2);
  p1.addVertex(i, j + h);
  p1.addVertex(i + l, j + h);
  p1.addVertex(i + 3 * l / 2, j + h / 2);
  p1.addVertex(i + l, j);
  p1.close();
  // p1.show();
  polys.add(p1);
  */
  
  for(float j = 0; j <= height + h * 2; j += h)
  {
    for(float i = 0; i <= width + l * 2; i += 3*l)
    {
      polygon p1 = new polygon(6);
      p1.addVertex(i, j);
      p1.addVertex(i - l * 0.5, j + h / 2);
      p1.addVertex(i, j + h);
      p1.addVertex(i + l, j + h);
      p1.addVertex(i + 3 * l / 2, j + h / 2);
      p1.addVertex(i + l, j);
      p1.close();
      // p1.show();
      polys.add(p1);
      
      polygon p2 = new polygon(6);
      p2.addVertex(i + 1.5 * l, j + h/2);
      p2.addVertex(i + 2.5 * l, j + h/2);
      p2.addVertex(i + 3*l, j);
      p2.addVertex(i + 2.5 * l, j - h/2);
      p2.addVertex(i + 1.5 * l, j - h/2);
      p2.addVertex(i + l, j);
      p2.close();
      // p2.show();
      polys.add(p2);
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
