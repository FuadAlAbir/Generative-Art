// Cairo Pentagonal Tiling Measurement
// Courtesy: https://www.mathsisfun.com/geometry/polygons-interactive.html
// (4.50,5.60), (0.95,3.55), (3.00,0.00), (6.00,0.00), (8.05,3.55)

List <polygon> polys = new ArrayList <polygon>();

float angle = 30;
float delta = 10;
float m_size = 20;

slider angleSlider;
slider deltaSlider;

void setup()
{
  size(600, 720);
  background(51);
  strokeWeight(3);
 
  angleSlider = new slider((width / 2) + 20, height - 40, 60, 120, 60, .1); // limit: 0 to 180
  deltaSlider = new slider(20, height - 40, 10, 29.7, 10, .1); // limit: 0 to 50
  //translate(width/2 - m_size/2, height/2 - m_size/2);
  //translate(-3*m_size, 0);
  //translate(2.6*m_size, 0);
  // (4.50,5.60), (0.95,3.55), (3.00,0.00), (6.00,0.00), (8.05,3.55)
  // (3.00,0.00) -> (0.95,3.55) -> (4.50,5.60) -> (8.05,3.55) -> (6.00,0.00)

  float i = 0, j = 0;
  polygon p1 = new polygon(5);
  p1.addVertex(i + 4.5 * m_size, j + 5.6 * m_size);
  p1.addVertex(i + 0.95 * m_size, j + 3.55 * m_size);
  p1.addVertex(i + 3 * m_size, j);
  p1.addVertex(i + 6 * m_size, j);
  p1.addVertex(i + 8.05 * m_size, j + 3.55 * m_size);
  p1.close();
  // p1.show();
  polys.add(p1);
  /*
  for(float j = 0; j <= height + 14.2 * m_size; j += 14.2 * m_size)
  {
    for(float i = 0; i <= width + 11.2 * m_size; i += 14.2 * m_size)
    {
      polygon p1 = new polygon(5);
      p1.addVertex(i + 4.5 * m_size, j + 5.6 * m_size);
      p1.addVertex(i + 0.95 * m_size, j + 3.55 * m_size);
      p1.addVertex(i + 3 * m_size, j);
      p1.addVertex(i + 6 * m_size, j);
      p1.addVertex(i + 8.05 * m_size, j + 3.55 * m_size);
      p1.close();
      // p1.show();
      polys.add(p1);
      
      polygon p2 = new polygon(5);
      p2.addVertex(i + 3 * m_size, j);
      p2.addVertex(i + 0.95 * m_size, j + -3.55 * m_size);
      p2.addVertex(i + 4.5 * m_size, j + -5.6 * m_size);
      p2.addVertex(i + 8.05 * m_size, j + -3.55 * m_size);
      p2.addVertex(i + 6 * m_size, j);
      p2.close();
      // p2.show();
      //polys.add(p2);

      polygon p3 = new polygon(5);
      p3.addVertex(i + 3 * m_size, j);
      p3.addVertex(i + 0.95 * m_size, j + -3.55 * m_size);
      p3.addVertex(i + -2.6 * m_size, j + -1.5 * m_size);
      p3.addVertex(i + -2.6 * m_size, j + 1.5 * m_size);
      p3.addVertex(i + 0.95 * m_size, j + 3.55 * m_size);
      p3.close();
      // p3.show();
      //polys.add(p3);
      
      polygon p4 = new polygon(5);
      p4.addVertex(i + 6 * m_size, j);
      p4.addVertex(i + 8.05 * m_size, j + 3.55 * m_size);
      p4.addVertex(i + 11.6 * m_size, j + 1.5 * m_size);
      p4.addVertex(i + 11.6 * m_size, j + -1.5 * m_size);
      p4.addVertex(i + 8.05 * m_size, j + -3.55 * m_size);
      p4.close();
      // p4.show();
      //polys.add(p4);

      polygon p5 = new polygon(5);
      p5.addVertex(i - 2.60 * m_size, j + 1.50 * m_size);
      p5.addVertex(i - 6.15 * m_size, j + 3.55 * m_size);
      p5.addVertex(i - 4.10 * m_size, j + 7.10 * m_size);
      p5.addVertex(i - 1.10 * m_size, j + 7.10 * m_size);
      p5.addVertex(i + 0.95 * m_size, j + 3.55 * m_size);
      p5.close();
      // p5.show();
      //polys.add(p5);
      
      polygon p6 = new polygon(5);
      p6.addVertex(i - 1.10 * m_size, j + 7.10 * m_size);
      p6.addVertex(i + 0.95 * m_size, j + 10.65 * m_size);
      p6.addVertex(i + 4.50 * m_size, j + 8.60 * m_size);
      p6.addVertex(i + 4.50 * m_size, j + 5.60 * m_size);
      p6.addVertex(i + 0.95 * m_size, j + 3.55 * m_size);
      p6.close();
      // p6.show();
      //polys.add(p6);

      polygon p7 = new polygon(5);
      p7.addVertex(i - 2.60 * m_size, j + 12.7 * m_size);
      p7.addVertex(i - 6.15 * m_size, j + 10.65 * m_size);
      p7.addVertex(i - 4.10 * m_size, j + 7.10 * m_size);
      p7.addVertex(i - 1.10 * m_size, j + 7.10 * m_size);
      p7.addVertex(i + 0.95 * m_size, j + 10.65 * m_size);
      p7.close();
      // p7.show();
      //polys.add(p7);

      polygon p8 = new polygon(5);
      p8.addVertex(i - 4.10 * m_size, j + 7.10 * m_size);
      p8.addVertex(i - 6.15 * m_size, j + 3.55 * m_size);
      p8.addVertex(i - 9.70 * m_size, j + 5.60 * m_size);
      p8.addVertex(i - 9.70 * m_size, j + 8.60 * m_size);
      p8.addVertex(i - 6.15 * m_size, j + 10.65 * m_size);
      p8.close();
      // p8.show();
      //polys.add(p8);
    }
  }
  */
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
