class edge
{
  PVector a;
  PVector b;
  hankin h1;
  hankin h2;
  float sides;
  edge(PVector a_, PVector b_)
  {
    a = a_;
    b = b_;
  }
  void hankin(float alpha)
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
    
    float elen_2 = v1.mag();

    v1.rotate(radians(angle));
    v2.rotate(radians(-angle));
    
    // law of sine
    // float interior = (sides - 2) * PI / sides;
    // float alpha = interior * 0.5;
    alpha = alpha / 2;
    float beta = PI - alpha - radians(angle);
    float hlen = (elen_2 + delta) * sin(alpha) / sin(radians(beta));
    v1.setMag(hlen);
    v2.setMag(hlen);
    
    h1 = new hankin(offset1, v1);
    h2 = new hankin(offset2, v2);
  }
  
  void findEnds(edge edge)
  {
    h1.findEnd(edge.h1);
    h1.findEnd(edge.h2);
    h2.findEnd(edge.h1);
    h2.findEnd(edge.h2);
  }

  void show()
  {
    stroke(255);
    strokeWeight(.2);
    line(a.x, a.y, b.x, b.y);
    h1.show();
    h2.show();
  }
};
