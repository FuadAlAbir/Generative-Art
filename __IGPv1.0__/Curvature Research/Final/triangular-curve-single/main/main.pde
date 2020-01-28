import controlP5.*;
ControlP5 cp5;

float len = 120;
float h = len * sqrt(3) / 2;
float r = 8;

int sliderLength = 200;
int sliderWidth = 15;

float angle30 = PI/6;
float angle60 = PI/3;
float angle120 = 2*PI/3;

// slider variables
float c;
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
  println(angle30);
  println(angle60);
  x = width/2 - len/2;
  y = height/2 + h/2;
  xlen = len * cos(angle30);
  hlen = len * sin(angle30);

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
  c = cp5.getController("curvature").getValue();
  t = cp5.getController("tightness").getValue();
  curveTightness(t);
  
  // BASE - Trialgle
  stroke(21, 80);
  line(x, y, x + len, y);
  line(x + len, y, x + len/2, y - h);
  line(x + len/2, y - h, x, y);
  
  // C O N V E X   C U R V E - Supporting lines
  // C O N C A V E   C U R V E - Supporting lines
  line(x + len/2, y - h, x + len, y + 2*-h);
  line(x + len/2, y - h, x, y + 2*-h);
  line(x, y, x - len, y);
  line(x, y, x - len/2, y + h);
  line(x + len, y, x + 2*len, y);
  line(x + len, y, x + 3*len/2, y + h);
  
  // C O N V E X   C U R V E - Curve Controller Axis
  line(x + len/2, y - h, x + len/2, y - (h + len));              // UP
  line(x + len, y, x + len + xlen, y + hlen);                    // RIGHT
  line(x, y, x - xlen, y + hlen);                                // LEFT
  
  // C O N C A V E   C U R V E - Curve Controller Axis
  line(x, y, x + len/2, y + h);                                  // Down - \
  line(x + len, y, x + len/2, y + h);                            // Down - /
  line(x, y, x - len/2, y - h);                                  // Left - \
  line(x + len/2, y - h, x - len/2, y - h);                      // Left - _
  line(x + len/2, y - h, x + 3*len/2, y - h);                    // Right - _
  line(x + 3*len/2, y - h, x + len, y);                          // Right - /
  
  // C O N V E X   C U R V E -  Curve Controller Ellipse
  noStroke();  
  ellipse(x + len/2, y - (h + c), r, r);                         // UP
  ellipse(x + len + c*cos(angle30), y + c*sin(angle30), r, r);   // RIGHT
  ellipse(x - c*cos(angle30), y + c*sin(angle30), r, r);         // LEFT
  
  // C O N C A V E   C U R V E -  Curve Controller Ellipse
  noStroke();  
  ellipse(x - c*cos(angle60), y - c*sin(angle60), r, r);                                  // Up - \
  ellipse(x + c*cos(angle60), y + c*sin(angle60), r, r);                                  // Down - \
  ellipse(x + len - c*cos(angle60), y + c*sin(angle60), r, r);                            // Down - /
  ellipse(x + len + c*cos(angle60), y - c*sin(angle60), r, r);                            // Up - /
  ellipse(x + len/2 - c, y - h, r, r);                                                    // Up - _ - Left
  ellipse(x + len/2 + c, y - h, r, r);                                                    // Up - _ - Right
  
  // C O N V E X   C U R V E - curves
  stroke(21, 255);
  strokeWeight(4);
  noFill();
  curve(x + len/2, y - (h + c), x + len/2, y - h, x, y, x - c*cos(angle30), y + c*sin(angle30));                      // UP - LEFT
  curve(x + len/2, y - (h + c), x + len/2, y - h, x + len, y, x + len + c*cos(angle30), y + c*sin(angle30));          // UP - RIGHT
  curve(x - c*cos(angle30), y + c*sin(angle30), x, y, x + len, y, x + len + c*cos(angle30), y + c*sin(angle30));      // LEFT - RIGHT

  // C O N C A V E   C U R V E - curves
  stroke(21, 255);
  strokeWeight(4);
  noFill();
  curve(x + c*cos(angle120), y - c*sin(angle120), x, y, x + len, y, x + len + c*cos(angle60), y - c*sin(angle60));    // Down
  curve(x + c*cos(-angle60), y + c*sin(angle60), x, y, x + len/2, y - h, x + len/2 + c, y - h);                       // Left
  curve(x + len/2 - c, y - h, x + len/2, y - h, x + len, y, x + len - c*cos(angle60), y + c*sin(angle60));            // Right
}
