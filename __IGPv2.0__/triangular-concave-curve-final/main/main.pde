import controlP5.*;
ControlP5 cp5;

float len = 120;
float h = len * sqrt(3) / 2;

int sliderLength = 200;
int sliderWidth = 15;

float angle = PI/6;

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
  y = height/2 + h/2;
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
      .setRange(-70, 70)
      .setColorCaptionLabel(21)
      .setColorValue(21)
      .setValue(0);

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
  // Trialgle
  line(x, y, x + len, y);
  line(x + len, y, x + len/2, y - h);
  line(x + len/2, y - h, x, y);
  
  // Supporting lines
  line(x + len/2, y - h, x + len, y + 2*-h);
  line(x + len/2, y - h, x, y + 2*-h);
  line(x, y, x - len, y);
  line(x, y, x - len/2, y + h);
  line(x + len, y, x + 2*len, y);
  line(x + len, y, x + 3*len/2, y + h);
  
  // Curve Controller Axis
  // UP
  line(x + len/2, y - h, x + len/2, y - (h + len));
  // RIGHT
  line(x + len, y, x + len + xlen, y + hlen);
  // LEFT
  line(x, y, x - xlen, y + hlen);
  
  // Curve Controller Ellipse
  noStroke();  
  ellipse(x + len/2, y - (h + y1), 8, 8);                      // UP
  ellipse(x + len + y1*cos(angle), y + y1*sin(angle), 8, 8);   // RIGHT
  ellipse(x - y1*cos(angle), y + y1*sin(angle), 8, 8);         // LEFT
  
  stroke(21, 255);
  strokeWeight(4);
  // curves
  // UP - LEFT
  noFill();
  curve(x + len/2, y - (h + y1), x + len/2, y - h, x, y, x - y1*cos(angle), y + y1*sin(angle));
  // UP - RIGHT
  curve(x + len/2, y - (h + y1), x + len/2, y - h, x + len, y, x + len + y1*cos(angle), y + y1*sin(angle));
  // LEFT - RIGHT
  curve(x - y1*cos(angle), y + y1*sin(angle), x, y, x + len, y, x + len + y1*cos(angle), y + y1*sin(angle));


 
  // cp5.getController("tightness").setVisible(false);
  // cp5.getController("zoom").setVisible(false);
}
