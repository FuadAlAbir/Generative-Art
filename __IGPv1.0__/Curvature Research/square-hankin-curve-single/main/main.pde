import controlP5.*;
ControlP5 cp5;

float len = 120;
float dLen = sqrt(2) * len;

float r = 8;

int sliderLength = 200;
int sliderWidth = 15;


// slider variables
float c;        // curvature
float t;        // tightness
float angle;    // hankin angle

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

  cp5 = new ControlP5(this);
  
  cp5.addSlider("angle")
      .setPosition(width/2 - 100, height - 150)
      .setSize(sliderLength, sliderWidth)
      .setRange(0, 90)
      .setColorCaptionLabel(21)
      .setColorValue(21)
      .setValue(0);
  cp5.getController("angle").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("angle").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  cp5.addSlider("curvature")
      .setPosition(width/2 - 100, height - 100)
      .setSize(sliderLength, sliderWidth)
      .setRange(0, len)
      .setColorCaptionLabel(21)
      .setColorValue(21)
      .setValue(len/2);
  cp5.getController("curvature").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("curvature").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
  cp5.addSlider("tightness")
      .setPosition(width/2 - 100, height - 50)
      .setSize(sliderLength, sliderWidth)
      .setRange(-7, 0)
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
  angle = cp5.getController("angle").getValue();
  c = cp5.getController("curvature").getValue();
  t = cp5.getController("tightness").getValue();
  curveTightness(t);
  
  // B A S E - Square
  stroke(21, 80);
  line(x, y, x, y - len);
  line(x, y - len, x + len, y - len);
  line(x + len, y - len, x + len, y);
  line(x + len, y, x, y);
  
  xlen = len * cos(radians(angle));
  hlen = len * sin(radians(angle));
  line(x + len/2, y, x + len + xlen, y - hlen);
  /*
  // C O N C A V E   C U R V E - Supporting lines
  
  // C O N C A V E   C U R V E - Curve Controller Axis
  strokeWeight(0.2);
  line(x, y, x - len, y + len);                                // Left - Down
  line(x, y - len, x - len, y - 2*len);                        // Left - Up
  line(x + len, y - len, x + 2*len, y - 2*len);                // Right - Up
  line(x + len, y, x + 2*len, y + len);                        // Right - Down
  
  // C O N C A V E   C U R V E - Curve Controller Ellipse
  noStroke();
  ellipse(x - c, y + c, r, r);
  ellipse(x - c, y - len - c, r, r);
  ellipse(x + len + c, y - len - c, r, r);
  ellipse(x + len + c, y + c, r, r);
  
  // C O N V E X   C U R V E - Curve Controller Ellipse
  // Have to be here, else Concave curves will cover the points
  noStroke();
  ellipse(x + c, y + c, r, r);                // Down - \
  ellipse(x + len - c, y + c, r, r);          // Down - /
  ellipse(x + c, y - len - c, r, r);          // Up - /
  ellipse(x + len - c, y - len - c, r, r);    // Up - \
  ellipse(x - c, y - c, r, r);                // Left - \
  ellipse(x - c, y - len + c, r, r);          // Left - /
  ellipse(x + len + c, y - c, r, r);          // Right - /
  ellipse(x + len + c, y - len + c, r, r);    // Right - \
  */
  
  /*
  // C O N C A V E   C U R V E - Curves
  stroke(21, 255);
  strokeWeight(4);
  // curves
  noFill();
  // fill(255, 0, 0);
  curve(x - c, y + c, x, y, x, y - len, x - c, y - len - c);
  curve(x - c, y - len - c, x, y - len, x + len, y - len, x + len + c, y - len - c);
  curve(x + len + c, y - len - c, x + len, y - len, x + len, y, x + len + c, y + c);
  curve(x + len + c, y + c, x + len, y, x, y, x - c, y + c);
  */
  /*
  // C O N C A V E   C U R V E - Supporting lines

  // C O N V E X   C U R V E - Curve Controller Axis
  strokeWeight(.02);
  line(x, y, x + len, y + len);                // Down - \
  line(x, y - len, x + len, y - 2*len);        // Up - /
  line(x + len, y - len, x, y - 2*len);        // Up - \
  line(x + len, y, x, y + len);                // Down - /
  line(x, y, x - len, y - len);                // Left - \
  line(x, y - len, x - len, y);                // Left - /
  line(x + len, y - len, x + 2*len, y);        // Right - \
  line(x + len, y, x + 2*len, y - len);        // Right - /
  */
  /*
  // C O N V E X   C U R V E - Curves
  stroke(21, 255);
  strokeWeight(4);
  noFill();
  // fill(0, 0, 255);
  curve(x + c, y + c, x, y, x, y - len, x + c, y - len - c);                            // LEFT
  curve(x - c, y - len + c, x, y - len, x + len, y - len, x + len + c, y - len + c);    // UP
  curve(x + len - c, y - len - c, x + len, y - len, x + len, y, x + len - c, y + c);    // RIGHT
  curve(x - c, y - c, x, y, x + len, y, x + len + c, y - c);                            // DOWN
  */
}
