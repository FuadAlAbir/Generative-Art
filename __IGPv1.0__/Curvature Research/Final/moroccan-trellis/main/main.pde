float len = 30;
// shape length and height
float l;
float h;

float r = 4;

// for orientation
float x;
float y;


float ylen;
float ylenP;
void setup()
{
  size(720, 600);
  background(243);
  
  x = -len/2;
  y = len/2;
  ylen = len * 1.3;
  ylenP = len * .3;
  l = 2*len;
  h = 2*len + 0.3*2*len;
}

void draw()
{
  // background(243);
  noFill();
  strokeWeight(2);
  // B A S E - Square
  //stroke(21, 80);
  //line(x, y + ylenP, x, y - ylen);
  //line(x, y - ylen, x + len, y - ylen);
  //line(x + len, y - ylen, x + len, y + ylenP);
  //line(x + len, y + ylenP, x, y + ylenP);
  
  stroke(21);
  arc(x, y - len/2, len, len, HALF_PI, PI + HALF_PI);
  arc(x + len, y - len/2, len, len, PI + HALF_PI, 2 * PI + HALF_PI);
  arc(x, y - 3*len/2 - ylenP, len, len, 0, HALF_PI);
  arc(x + len, y - 3*len/2 - ylenP, len, len, HALF_PI, PI);
  arc(x, y + ylenP + len/2, len, len, PI + HALF_PI, 2 * PI);
  arc(x + len, y + ylenP + len/2, len, len, PI, PI + HALF_PI);
  line(x, y - len, x, y - len - ylenP);
  line(x + len, y - len, x + len, y - len - ylenP);
  line(x, y, x, y + ylenP);
  line(x + len, y, x + len, y + ylenP);
  
  //noStroke();
  //fill(21);
  //ellipse(x, y, r, r);
  //ellipse(x, y - len, r, r);
  //ellipse(x + len, y - len, r, r);
  //ellipse(x + len, y, r, r);
  
  x = x + l;
  if(x > width + 2*l)
  {
    x = -len/2;
    y = y + h;
    if(y > height + 2*h)
      return;
  }
}
