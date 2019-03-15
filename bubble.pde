/*-----------------------------
    I N T R O D U C T I O N
-------------------------------
Author:         Fuad Al Abir
Dated:          March 15, 2019
Project Name:   Bubbles
Source:         https://www.youtube.com/watch?v=Y1bPsh1mFUI
*/

class Ball {
  int radius;
  color col;
  PVector position;
  PVector velocity;
  
  Ball()
  {
    this.radius = randomRadius();
    this.col = randomColor();
    this.position = randomPosition();
    this.velocity = randomVelocity();
  }
  
  void draw()
  {
    noStroke();
    fill(this.col);
    ellipse(this.position.x, this.position.y, this.radius, this.radius);
  }
  
  void update()
  {
    this.position.add(this.velocity);
    
    if(this.position.x - this.radius/2 < 0 || this.position.x + this.radius/2 > width)
    {
      this.velocity.x = -this.velocity.x;
    }
    
    if(this.position.y - this.radius/2 < 0 || this.position.y + this.radius/2 > height)
    {
      this.velocity.y = -this.velocity.y;
    }
  }
  
  PVector randomPosition()
  {
    return new PVector(random(0 + this.radius*2, width - this.radius*2), random(0 + this.radius*2, height - this.radius*2));
  }
  PVector randomVelocity()
  {
    return new PVector(random(-3, 3), random(-3, 3));
  }
  int randomRadius()
  {
    return (int) random(11, 36);
  }
  int randomColor()
  {
    return color(random(153, 243), random(153, 243), random(153, 243));
  }
}

int nBalls = 20;
Ball[] balls = new Ball[nBalls];

void setup()
{
  size(640, 480);
  for(int i = 0; i < balls.length; i++)
  {
    balls[i] = new Ball();
  }
}

void draw()
{
  background(21);
  for(int i = 0; i < balls.length; i++)
  {
    balls[i].update();
    balls[i].draw();
  }
}
