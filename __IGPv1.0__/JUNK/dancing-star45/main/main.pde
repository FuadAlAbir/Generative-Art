import controlP5.*;
ControlP5 cp5;

float r = 0;
float spacing = 10;
float len = spacing * 3;
float w = 5;
float s = 1;

void setup()
{
  size(600, 700);
  background(51);
  cp5 = new ControlP5(this);
  
  cp5.addSlider("tightness")
     .setPosition(40, 650)
     .setSize(200,20)
     .setRange(-7, 7)
     .setValue(1);
     
  cp5.addSlider("zoom")
     .setPosition(width/2 - 100, 50)
     .setSize(200,20)
     .setRange(1, 10)
     .setValue(1);

  cp5.getController("tightness").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("tightness").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 
  
  cp5.getController("zoom").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("zoom").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 
}

void draw()
{
  background(51);
  stroke(243);
  s = cp5.getController("zoom").getValue();
  spacing = s * 10;  
  len = spacing * 3;
  w = 5 * spacing / 10;
  strokeWeight(w);
  
  push();
  translate(width/2, height/2);
  rotate(radians(r));
  float i = 0;
  for(int k = 0; k < 6; k++)
  {
    line(i + spacing, 0, i + spacing + len, 0);
    push();
    translate(spacing + len, 0);
    rotate(-PI/3);
    line(i, 0, i + len, 0);
    push();
    translate(len, 0);
    rotate(PI/3);
    line(i, 0, i + len, 0);
    pop();
    pop();
    rotate(PI/3);
  }
  i = 2*len;
  stroke(121);
  for(int k = 0; k < 6; k++)
  {
    line(i + spacing, 0, i + spacing + len, 0);
    push();
    translate(spacing + len, 0);
    rotate(-PI/3);
    line(i, 0, i + len, 0);
    push();
    translate(len, 0);
    rotate(PI/3);
    line(i, 0, i + len, 0);
    pop();
    pop();
    rotate(PI/3);
  }
  r++;
  pop();
  
  float t = cp5.getController("tightness").getValue();
  curveTightness(t);
 
  cp5.getController("tightness").setVisible(false);
  cp5.getController("zoom").setVisible(true);
}
