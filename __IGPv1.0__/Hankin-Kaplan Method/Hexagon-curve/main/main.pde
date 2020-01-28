import controlP5.*;
ControlP5 cp5;

float l = 25;
float s = l;
float h = sqrt(3) * l;
float floralWeight = 3;
void setup()
{
  size(600, 700);
  background(51);
  cp5 = new ControlP5(this);

  cp5.addSlider("tignhness")
     .setPosition(40, 650)
     .setSize(200,20)
     .setRange(-7, 7)
     .setValue(1);
     
  cp5.addSlider("zoom")
     .setPosition(width - 240, 650)
     .setSize(200,20)
     .setRange(20, 50)
     .setValue(30);

  cp5.getController("tignhness").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("tignhness").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 
  
  cp5.getController("zoom").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("zoom").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 
}

void draw()
{
  background(51);
  float t = cp5.getController("tignhness").getValue();
  curveTightness(t);
  
  l = cp5.getController("zoom").getValue();
  h = sqrt(3) * l;
  
  int counterI = 0, counterJ = 0;
  for(float j = -h/2; j <= 600; j += h)
  {
    counterJ++;
    counterI = 0;
    
    if(counterJ % 2 == 0)
    {
      for(float i = 1*l; i <= width; i += l*2)
      {
        counterI++;
        {
          if(counterI % 3 == 0) continue;
          
          stroke(243);
          //fill(255, 0, 0);
          strokeWeight(0.02);
          // strokeWeight(floralWeight);
          beginShape();
          vertex(i, j);
          vertex(i - l * 0.5, j + h / 2);
          vertex(i, j + h);
          vertex(i + l, j + h);
          vertex(i + 3 * l / 2, j + h / 2);
          vertex(i + l, j);
          endShape(CLOSE);

          noFill();
          strokeWeight(floralWeight);
          // strokeWeight(0);
          curve(i - s, j - s, i, j, i + l, j, i + l + s, j - s);
          curve(i - s, j - s, i, j, i - l * 0.5, j + h / 2, i - l * 0.5 - s, j + h / 2);
          curve(i - l * 0.5 - s, j + h / 2, i - l * 0.5, j + h / 2, i, j + h, i - s, j + h + s);
          curve(i - s, j + h + s, i, j + h, i + l, j + h, i + l + s, j + h + s);
          curve(i + l + s, j + h + s, i + l, j + h, i + 3 * l / 2, j + h / 2, i + 3 * l / 2 + s, j + h / 2);
          curve(i + 3 * l / 2 + s, j + h / 2, i + 3 * l / 2, j + h / 2, i + l, j, i + l + s, j - s);
        }
      }
    }
    else
    {
      counterI = 1;
      for(float i = 0; i <= width; i += l*2)
      {
        counterI++;
        {
          if(counterI % 3 == 0) continue;
          
          stroke(243);
          // fill(255, 0, 0);
          strokeWeight(0.02);
          // strokeWeight(floralWeight);
          beginShape();
          vertex(i, j);
          vertex(i - l * 0.5, j + h / 2);
          vertex(i, j + h);
          vertex(i + l, j + h);
          vertex(i + 3 * l / 2, j + h / 2);
          vertex(i + l, j);
          endShape(CLOSE);
          noFill();
          strokeWeight(floralWeight);
          // strokeWeight(0);
          curve(i - s, j - s, i, j, i + l, j, i + l + s, j - s);
          curve(i - s, j - s, i, j, i - l * 0.5, j + h / 2, i - l * 0.5 - s, j + h / 2);
          curve(i - l * 0.5 - s, j + h / 2, i - l * 0.5, j + h / 2, i, j + h, i - s, j + h + s);
          curve(i - s, j + h + s, i, j + h, i + l, j + h, i + l + s, j + h + s);
          curve(i + l + s, j + h + s, i + l, j + h, i + 3 * l / 2, j + h / 2, i + 3 * l / 2 + s, j + h / 2);
          curve(i + 3 * l / 2 + s, j + h / 2, i + 3 * l / 2, j + h / 2, i + l, j, i + l + s, j - s);
        }
      }
    }
  }
}
