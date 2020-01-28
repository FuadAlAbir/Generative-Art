import java.util.*;

class polygon
{
  List<edge> edges = new ArrayList<edge>();
  List<PVector> vertices = new ArrayList<PVector>();
  
  polygon() {}
  
  void addVertex(float x, float y)
  {
    PVector a = new PVector(x, y);
    int total = vertices.size();
    if(total > 0)
    {
      PVector prev = vertices.get(total - 1);
      edge e = new edge(prev, a);
      edges.add(e);
    }
    vertices.add(a);
  }
  
  void close()
  {
    int total = vertices.size();
    PVector last = vertices.get(total - 1);
    PVector first = vertices.get(0);
    edge e = new edge(last, first);
    edges.add(e);
  }
  
           
  void hankin()
  {
    for (int i = 0; i < edges.size(); i++)
    {
      edges.get(i).hankin();
    }

    for (int i = 0; i < edges.size(); i++)
    {
      for (int j = 0; j < edges.size(); j++)
      {
        if (i != j)
        {
          edges.get(i).findEnds(edges.get(j));
        }
      }
    }
  }
  
    void show()
  {
    for(int i = 0; i < edges.size(); i++)
    {
      edges.get(i).show();
    }
  }
};
