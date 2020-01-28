class edge
{
  PVector a;
  PVector b;
  hankin h1 = null;
  hankin h2 = null;
  
  edge(PVector a_, PVector b_)
  {
    a = a_;
    b = b_;
  };
  void show()
  {
    stroke(255);
    strokeWeight(.01);
    line(a.x, a.y, b.x, b.y);
    h1.show();
    h2.show();
  }
  
  void hankin()
  {
    PVector mid = PVector.add(a, b);
    mid.mult(0.5);
    
    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);
    PVector offset1 = mid;
    PVector offset2 = mid;
    
    if(delta >= 0)
    {
      v1.setMag(delta);
      v2.setMag(delta);
      offset1 = PVector.add(mid, v2);
      offset2 = PVector.add(mid, v1);
    }
    
    v1.normalize();
    v2.normalize();
    
    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));

    h1 = new hankin(offset1, v1);
    h2 = new hankin(offset2, v2);
  }
  
  void findEnds(edge e)
  {
    h1.findEnd(e.h1);
    h1.findEnd(e.h2);
    h2.findEnd(e.h1);
    h2.findEnd(e.h2);    
  }
};
