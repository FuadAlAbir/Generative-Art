List <polygon> polys = new ArrayList <polygon>();

float angle = 30;
float delta = 10;
float m_size = 150;

slider angleSlider;
slider deltaSlider;

void setup()
{
  size(710, 600);
  background(51);

  float a = 2*sqrt(6-3*sqrt(3))/3;
  float b = (3+sqrt(3))*(sqrt(2-sqrt(3))/3);
  float B = b * m_size;
  float c = 2*sqrt(2-sqrt(3));
  float C = c * m_size;
  float c2 = c/2;
  float C2 = c2 * m_size;
  float h = b + sqrt(a*a - c*c/4);
  float H = h * m_size;
  float _2H = 2 * H;
  float _2B = 2 * B;
  float _HB = H + B;
  float _2HB = 2 * H + 2 * B;
 
  angleSlider = new slider((width / 2) + 20, height - 40, 60, 120, 60, .1); // limit: 0 to 180
  deltaSlider = new slider(20, height - 40, 10, 29.7, 10, .1); // limit: 0 to 50

  for(float j = 0; j <= height + _2H; j += _2HB)
  {
    for(float i = 0; i <= width + C; i += C)
    {
      polygon p1 = new polygon();
      p1.addVertex(i, j);
      p1.addVertex(i, j + B);
      p1.addVertex(i + C2, j + H);
      p1.addVertex(i + C, j + B);
      p1.addVertex(i + C, j);
      p1.close();
      //p1.show();
      polys.add(p1);
      
      polygon p2 = new polygon();
      p2.addVertex(i, j + B);
      p2.addVertex(i - C2, j + H);
      p2.addVertex(i - C2, j + _HB);
      p2.addVertex(i + C2, j + _HB);
      p2.addVertex(i + C2, j + H);
      p2.close();
      //p2.show();
      polys.add(p2);

      polygon p3 = new polygon();
      p3.addVertex(i - C2, j + _HB);
      p3.addVertex(i - C2, j + H + _2B);
      p3.addVertex(i, j + _2H + B);
      p3.addVertex(i + C2, j + H + _2B);
      p3.addVertex(i + C2, j + _HB);
      p3.close();
      //p3.show();
      polys.add(p3);
      
      polygon p4 = new polygon();
      p4.addVertex(i + C2, j + H + _2B);
      p4.addVertex(i, j + _2H + B);
      p4.addVertex(i, j + _2HB);
      p4.addVertex(i + C, j + _2HB);
      p4.addVertex(i + C, j + _2H + B);
      p4.close();
      //p4.show(); 
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
  //if(mousePressed) saveFrame("Prismatic Pentagonal Tiling ###.png");
}
