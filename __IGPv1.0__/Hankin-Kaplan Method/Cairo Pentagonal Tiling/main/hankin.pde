class hankin
{
  PVector a;
  PVector v;
  PVector b;
  
  hankin(PVector a_, PVector v_)
  {
    a = a_;
    v = v_;
    strokeWeight(2);
    b = PVector.add(v, a);
  }
  
  void show()
  {
    stroke(255);
    strokeWeight(1);
    line(a.x, a.y, b.x, b.y);
  }
};
