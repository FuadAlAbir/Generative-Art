import controlP5.*;
ControlP5 cp5;

float len = 120;
float dLen = sqrt(2) * len;

float r = 8;

int sliderLength = 200;
int sliderWidth = 15;

float angle = PI/4;

// slider variables
float y1;
float t;

// for orientation at the centre
float x;
float y;

// for two supporting angular lines
float xlen;
float hlen;

void setup()
{
  size(720, 600);
  background(243);
  
  x = width/2 - len/2;
  y = height/2 + len/2;
  xlen = len * cos(angle);
  hlen = len * sin(angle);

  cp5 = new ControlP5(this);
  
  cp5.addSlider("curvature")
      .setPosition(width/2 - 100, height - 120)
      .setSize(sliderLength, sliderWidth)
      .setRange(0, len)
      .setColorCaptionLabel(21)
      .setColorValue(21)
      .setValue(len/2);
  cp5.getController("curvature").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("curvature").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
  cp5.addSlider("tightness")
      .setPosition(width/2 - 100, height - 60)
      .setSize(sliderLength, sliderWidth)
      .setRange(-7, 0)
      .setColorCaptionLabel(21)
      .setColorValue(21)
      .setValue(-3.5);

  cp5.getController("tightness").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("tightness").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 

  /*   
  cp5.addSlider("zoom")
     .setPosition(width/2 - 100, 50)
     .setSize(sliderLength, sliderWidth)
     .setRange(1, 10)
     .setValue(1);
  
  cp5.getController("zoom").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("zoom").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0); 
  */  
}

void draw()
{
  background(243);
  fill(21);
  strokeWeight(3);
  y1 = cp5.getController("curvature").getValue();
  t = cp5.getController("tightness").getValue();
  curveTightness(t);
  
  stroke(21, 80);
  // Square
  line(x, y, x, y - len);
  line(x, y - len, x + len, y - len);
  line(x + len, y - len, x + len, y);
  line(x + len, y, x, y);
  
  // Supporting lines

  // Curve Controller Axis
  line(x, y, x - len, y + len);                                // Left - Down
  line(x, y - len, x - len, y - 2*len);                        // Left - Up
  line(x + len, y - len, x + 2*len, y - 2*len);                // Right - Up
  line(x + len, y, x + 2*len, y + len);                        // Right - Down
  
  // Curve Controller Ellipse
  noStroke();
  ellipse(x - y1, y + y1, r, r);
  ellipse(x - y1, y - len - y1, r, r);
  ellipse(x + len + y1, y - len - y1, r, r);
  ellipse(x + len + y1, y + y1, r, r);
  
  
  stroke(21, 255);
  strokeWeight(4);
  // curves
  noFill();
  curve(x - y1, y + y1, x, y, x, y - len, x - y1, y - len - y1);
  curve(x - y1, y - len - y1, x, y - len, x + len, y - len, x + len + y1, y - len - y1);
  curve(x + len + y1, y - len - y1, x + len, y - len, x + len, y, x + len + y1, y + y1);
  curve(x + len + y1, y + y1, x + len, y, x, y, x - y1, y + y1);

 
  // cp5.getController("tightness").setVisible(false);
  // cp5.getController("zoom").setVisible(false);
}
