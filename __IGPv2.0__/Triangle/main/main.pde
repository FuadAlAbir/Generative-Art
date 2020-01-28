List <polygon> polys = new ArrayList <polygon>();

float angle = 30;
float delta = 10;



slider angleSlider;
slider deltaSlider;

void setup()
{
  size(600, 600);
  background(51);
  float l = 100;
  float h = sqrt(3) / 2 * l;
  
  angleSlider = new slider((width / 2) + 20, height - 40, 30, 90, 60, 1);
  deltaSlider = new slider(20, height - 40, 10, 25, 10, 1);
  
  for(int j = 0; j <= height; j += h*2)
  {
    for(int i = 0; i <= width; i += l)
    {
      // First Row, Up
      polygon p1 = new polygon();
      p1.addVertex(i, h + j);
      p1.addVertex(i + l, h + j);
      p1.addVertex(i + l/2, j);
      p1.close();
      polys.add(p1);

      // First Row, Up
      polygon p2 = new polygon();
      p2.addVertex(i, h + j);
      p2.addVertex(i + l/2, j + h*2);
      p2.addVertex(i - l/2, j + h*2);
      p2.close();
      //polys.add(p2);
      
      
      // First Row, down
      polygon p3 = new polygon();
      p3.addVertex(i, h + j);
      p3.addVertex(i + l/2, j);
      p3.addVertex(i - l/2, j);
      p3.close();
      polys.add(p3);
      
      // Second Row, down
      polygon p4 = new polygon();
      p4.addVertex(i, h + j);
      p4.addVertex(i + l/2, j + h*2);
      p4.addVertex(i + l, h + j);
      p4.close();
      polys.add(p4);
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
