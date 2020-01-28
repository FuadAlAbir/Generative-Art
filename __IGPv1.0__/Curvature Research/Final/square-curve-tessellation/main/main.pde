import controlP5.*;
ControlP5 cp5;

float len = 90;
float dLen = sqrt(2) * len;



float r = 8;

int sliderLength = 200;
int sliderWidth = 15;

float angle = PI/4;

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
  size(800, 600);
  background(243);
  
  //x = width/2 - len/2;
  //y = height/2 + len/2;
  x = -len/2; 
  y = len/2;
  xlen = len * cos(angle);
  hlen = len * sin(angle);

  cp5 = new ControlP5(this);
  
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
  int counterI = 0;
  int counterJ = 0;
  for(float j = 0; j <= height + 2*len; j += len)
  {
    counterJ++;
    counterI = 0;
    for(float i = 0; i <= width + 2*len; i += len)
    {
      counterI++;
      
      //For squareTessellation#02
      if(counterI % 2 == 0 && counterJ % 2 == 0 || counterJ % 2 != 0 && counterI % 2 != 0)
      {
        continue;
      }
      
      fill(21);
      strokeWeight(3);
      c = cp5.getController("curvature").getValue();
      t = cp5.getController("tightness").getValue();
      curveTightness(t);
      /*
      // B A S E - Square
      stroke(21, 80);
      line(x + i, y + j, x + i, y - len + j);
      line(x + i, y - len + j, x + len + i, y - len + j);
      line(x + len + i, y - len + j, x + len + i, y + j);
      line(x + len + i, y + j, x + i, y + j);
      */
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
      noFill();
      curve(x - c + i, y + c + j, x + i, y + j, x + i, y - len + j, x - c + i, y - len - c + j);
      curve(x - c + i, y - len - c + j, x + i, y - len + j, x + len + i, y - len + j, x + len + c + i, y - len - c + j);
      curve(x + len + c + i, y - len - c + j, x + len + i, y - len + j, x + len + i, y + j, x + len + c + i, y + c + j);
      curve(x + len + c + i, y + c + j, x + len + i, y + j, x + i, y + j, x - c + i, y + c + j);
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
      
      // C O N V E X   C U R V E - Curves
      stroke(21, 255);
      strokeWeight(4);
      noFill();
      curve(x + c + i, y + c + j, x + i, y + j, x + i, y - len + j, x + c + i, y - len - c + j);                            // LEFT
      curve(x - c + i, y - len + c + j, x + i, y - len + j, x + len + i, y - len + j, x + len + c + i, y - len + c + j);    // UP
      curve(x + len - c + i, y - len - c + j, x + len + i, y - len + j, x + len + i, y + j, x + len - c + i, y + c + j);    // RIGHT
      curve(x - c + i, y - c + j, x + i, y + j, x + len + i, y + j, x + len + c + i, y - c + j);                            // DOWN
     
    }
  }
}
