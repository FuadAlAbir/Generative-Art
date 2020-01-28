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
float angle150 = 5*PI/6;

// slider variables
float c;
float t;

// for orientation at the centre
float x;
float y;

// for supporting angular line pairs
float xlen30;
float hlen30;
float xlen150;
float hlen150;

void setup()
{
  size(720, 600);
  background(243);

  x = width/2 - len/2;
  y = height/2 + h/2;
  xlen30 = len * cos(angle30);
  hlen30 = len * sin(angle30);
  xlen150 = len * cos(angle150);
  hlen150 = len * sin(angle150);

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
  
  /*
  // BASE - Hexagon
  stroke(21, 80);
  strokeWeight(3);
  line(x, y, x - len/2, y - h);                //1
  line(x - len/2, y - h, x, y - 2*h);          //2
  line(x, y - 2*h, x + len, y - 2*h);          //3
  line(x + len, y - 2*h, x + 3*len/2, y - h);  //4
  line(x + 3*len/2, y - h, x + len, y);        //5
  line(x + len, y, x, y);                      //6
  
  // BASE SUPPORT - Diagons
  line(x, y, x + len/2, y - h);                //1
  line(x - len/2, y - h, x + len/2, y - h);    //2
  line(x, y - 2*h, x + len/2, y - h);          //3
  line(x + len, y - 2*h, x + len/2, y - h);    //4
  line(x + 3*len/2, y - h, x + len/2, y - h);  //5
  line(x + len, y, x + len/2, y - h);          //6
  
  // C O N V E X   C U R V E - Supporting lines
  strokeWeight(1);
  line(x, y, x + len/2, y + h);
  line(x, y, x - len/2, y + h);
  line(x, y, x - len, y);
  
  line(x - len/2, y - h, x - len, y);
  line(x - len/2, y - h, x - 3*len/2, y - h);
  line(x - len/2, y - h, x - len, y - 2*h);
  
  line(x, y - 2*h, x - len, y - 2*h);
  line(x, y - 2*h, x - len/2, y - 3*h);
  line(x, y - 2*h, x + len/2, y - 3*h);
  
  line(x + len, y - 2*h, x + len/2, y - 3*h);
  line(x + len, y - 2*h, x + 3*len/2, y - 3*h);
  line(x + len, y - 2*h, x + 2*len, y - 2*h);
  
  line(x + 3*len/2, y - h, x + 2*len, y - 2*h);
  line(x + 3*len/2, y - h, x + 5*len/2, y - h);
  line(x + 3*len/2, y - h, x + 2*len, y);
  
  line(x + len, y, x + 2*len, y);
  line(x + len, y, x + 3*len/2, y + h);
  line(x + len, y, x + len/2, y + h);
  
  // C O N C A V E   C U R V E - Supporting lines

  // C O N V E X   C U R V E - Curve Controller Axis
  stroke(255, 0, 0);
  line(x, y, x, y + h);
  line(x, y, x + xlen150, y + hlen150);
  line(x - len/2, y - h, x - len/2 + xlen150, y - h + hlen150);
  line(x - len/2, y - h, x - len/2 + xlen150, y - h - hlen150);
  line(x, y - 2*h, x + xlen150, y - 2*h - hlen150);
  line(x, y - 2*h, x, y - 3*h);
  line(x + len, y - 2*h, x + len, y - 3*h);
  line(x + len, y - 2*h, x + len + xlen30, y - 2*h - hlen30);
  line(x + 3*len/2, y - h, x + 3*len/2 + xlen30, y - h - hlen30);
  line(x + 3*len/2, y - h, x + 3*len/2 + xlen30, y - h + hlen30);
  line(x + len, y, x + len + xlen30, y + hlen30);
  line(x + len, y, x + len, y + h);

  // C O N C A V E   C U R V E - Curve Controller Axis
  
  // C O N V E X   C U R V E - Curve Controller Ellipse

  // C O N C A V E   C U R V E - Curve Controller Ellipse
  */

  // C O N V E X   C U R V E - curves
  stroke(21, 255);
  strokeWeight(4);
  noFill();
  curve(x - len/2 + c*cos(angle150), y - h - c*sin(angle150), x - len/2, y - h, x, y, x, y + c);
  curve(x, y - 2*h - c, x, y - 2*h, x - len/2, y - h, x - len/2 + c*cos(angle150), y - h + c*sin(angle150));
  curve(x + c*cos(angle150), y - 2*h - c*sin(angle150), x, y - 2*h, x + len, y - 2*h, x + len + c*cos(angle30), y - 2*h - c*sin(angle30));
  curve(x + len, y - 2*h - c, x + len, y - 2*h, x + 3*len/2, y - h, x + 3*len/2 + c*cos(angle30), y - h + c*sin(angle30));
  curve(x + len, y + c, x + len, y, x + 3*len/2, y - h, x + 3*len/2 + c*cos(angle30), y - h - c*sin(angle30));
  curve(x - c*cos(angle30), y + c*sin(angle30), x, y, x + len, y, x + len + c*cos(angle30), y + c*sin(angle30));

  // C O N C A V E   C U R V E - curves
  stroke(21, 255);
  strokeWeight(4);
  noFill();
  curve(x + c*cos(angle30), y + c*sin(angle30), x, y, x - len/2, y - h, x - len/2, y - h - c);
  curve(x - len/2, y - h + c, x - len/2, y - h, x, y - 2*h, x + c*cos(angle30), y - 2*h - c*sin(angle30));
  curve(x + c*cos(angle150), y - 2*h + c*sin(angle150), x, y - 2*h, x + len, y - 2*h, x + len + c*cos(angle30), y - 2*h + c*sin(angle30));
  curve(x + len + c*cos(angle150), y - 2*h - c*sin(angle150), x + len, y - 2*h, x + 3*len/2, y - h, x + 3*len/2, y - h + c);
  curve(x + 3*len/2, y - h - c, x + 3*len/2, y - h, x + len, y, x + len + c*cos(angle150), y + c*sin(angle150));
  curve(x - c*cos(angle30), y - c*sin(angle30), x, y, x + len, y, x + len + c*cos(angle30), y - c*sin(angle30));
}
