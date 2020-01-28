import java.util.*;

class Polygon {
  List<PVector> vertices = new ArrayList<PVector>();
  List<Edge> edges = new ArrayList<Edge>();
  
  Polygon() {}

  void addVertex(float x, float y) {
    PVector a = new PVector(x, y);
    int total = vertices.size();
    if (total > 0) {
      PVector prev = vertices.get(total - 1);
      Edge edge = new Edge(prev, a);
      edges.add(edge);
    }
    vertices.add(a);
  }

  void close() {
    int total = vertices.size();
    PVector last = vertices.get(total - 1);
    PVector first = vertices.get(0);
    Edge edge = new Edge(last, first);
    edges.add(edge);
  }

  void hankin() {
    for (int i = 0; i < edges.size(); i++) {
      edges.get(i).hankin();
    }

    for (int i = 0; i < edges.size(); i++) {
      for (int j = 0; j < edges.size(); j++) {
        if (i != j) {
          edges.get(i).findEnds(edges.get(j));
        }
      }
    }
  }

  void show() {
    for (int i = 0; i < edges.size(); i++) {
      edges.get(i).show();
    }
  }
};

class Edge {
    PVector a;
    PVector b;
    Hankin h1 = null;
    Hankin h2 = null;

  Edge(PVector a_, PVector b_) {
    a = a_;
    b = b_;
  }
  
  void show() {
    stroke(255, 50);
    //line(a.x, a.y, b.x, b.y);
    h1.show();
    h2.show();
  }

  void hankin() {
    PVector mid = PVector.add(a, b);
    mid.mult(0.5);

    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);
    PVector offset1 = mid;
    PVector offset2 = mid;
    if (delta > 0) {
      v1.setMag(delta);
      v2.setMag(delta);
      offset1 = PVector.add(mid, v2);
      offset2 = PVector.add(mid, v1);
    }
    
    v1.normalize();
    v2.normalize();

    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));

    h1 = new Hankin(offset1, v1);
    h2 = new Hankin(offset2, v2);
  }

  void findEnds(Edge edge) {
    h1.findEnd(edge.h1);
    h1.findEnd(edge.h2);
    h2.findEnd(edge.h1);
    h2.findEnd(edge.h2);
  }
};


class Hankin {
    PVector a;
    PVector v;
    PVector b;
    PVector end = null;
    float prevD;

  Hankin(PVector a_, PVector v_) {
      a = a_;
      v = v_;
      b = PVector.add(a, v);
    }

  void show() {
    stroke(255, 0, 255);
    line(a.x, a.y, end.x, end.y);
    // fill(255);
    // ellipse(this.a.x, this.a.y, 8);
    // if (this.end) {
    //   fill(255, 255, 0);
    //   ellipse(this.end.x, this.end.y, 8);
    // }
  }

  void findEnd(Hankin other) {
    // line line intersection???
    // this.a, this.v  (P1, P2-P1)
    // other.a, other.v (P3, P4-P3)

    // From: http://paulbourke.net/geometry/pointlineplane/
    float den = (other.v.y * v.x) - (other.v.x * v.y);
    //if (!den) {
    //  return;
    //}
    if (den == 0.0) {
      return;
    }
    float numa = (other.v.x * (this.a.y - other.a.y)) - (other.v.y * (this.a.x - other.a.x));
    float numb = (this.v.x * (this.a.y - other.a.y)) - (this.v.y * (this.a.x - other.a.x));
    float ua = numa / den;
    float ub = numb / den;
    float x = this.a.x + (ua * this.v.x);
    float y = this.a.y + (ua * this.v.y);

    if (ua > 0 && ub > 0) {
      PVector candidate = new PVector(x, y);
      float d1 = PVector.dist(candidate, this.a);
      float d2 = PVector.dist(candidate, other.a);
      float d = d1 + d2;
      float diff = abs(d1 - d2);
      if (diff < 0.001) {
        if (end == null) {
          end = candidate;
          prevD = d;
        } else if (d < this.prevD) {
          prevD = d;
          end = candidate;
        }
      }
    }
  }
};

class Slider {
  float x;
  float y;
  float min;
  float max;
  float value;
  float increment;
  
  float w = 200;
  float h = 20;
  float controlSize = 7;
  
  Boolean isDragging = false;
  
  Slider(float x_, float y_, float min_, float max_, float start_, float increment_) {
    x = x_;
    y = y_;
    min = min_;
    max = max_;
    value = start_;
    increment = increment_;
  }
  
  float value() {
    return value;
  }
  
  void handleInteractions() {
    if (isDragging) {
      if (mousePressed) {
        float x1 = screenX(xPosition(value), y);
        float d = mouseX - x1;
        float change = d * (max - min) / w;
        value += change;
        value -= value % increment;
        value = min(max, max(min, value));
      } else {
        isDragging = false;
        println("end drag");
      }
    } else {
      float x1 = xPosition(value);
      if (mousePressed && mouseY >= screenY(x1, y) && mouseY <= screenY(x1, y+h) && mouseX >= screenX(x1-controlSize/2,y) && mouseX <= screenX(x1+controlSize/2,y)) {
        println("start drag");
        isDragging = true;
      }
    }
  }
  
  float xPosition(float val) {
    return min(x+w, max(x, map(val, min, max, x, x+w)));
  }
  
  void show() {
    handleInteractions();
    
    stroke(255);
    fill(0);
    rect(x, y + h/3, w, h/3, 2);
    
    float x1 = xPosition(value);
    stroke(200, 200, 200);
    fill(128, 128, 128);
    rect(x1-controlSize/2, y, controlSize, h, 2);
  }
};

//CC_054_StarPatterns.pde
// Islamic Star Patterns
// Video Part 1: https://youtu.be/sJ6pMLp_IaI
// Video Part 2: [coming soon]
// Based on: http://www.cgl.uwaterloo.ca/csk/projects/starpatterns/
// Processing transcription: Chuck England

// Repo with more tiling patterns and features
// https://github.com/CodingTrain/StarPatterns

List<Polygon> polys = new ArrayList<Polygon>();

float angle = 75;
float delta = 10;

Slider deltaSlider;
Slider angleSlider;

void setup() {
  size(600, 600);
  //angleMode(DEGREES);
  background(51);
  deltaSlider = new Slider(20, height - 40, 10, 25, 10, 1);
  angleSlider = new Slider((width / 2) + 20, height - 40, 75, 90, 75, 1);

  int inc = 100;
  for (int x = 0; x < width; x += inc) {
    for (int y = 0; y < height; y += inc) {
      Polygon poly = new Polygon();
      poly.addVertex(x, y);
      poly.addVertex(x + inc, y);
      poly.addVertex(x + inc, y + inc);
      poly.addVertex(x, y + inc);
      poly.close();
      polys.add(poly);
    }
  }
}

void draw() {
  background(51);
  angle = angleSlider.value();
  delta = deltaSlider.value();
  //println(angle, delta);
  for (int i = 0; i < polys.size(); i++) {
    polys.get(i).hankin();
    polys.get(i).show();
  }
  
  angleSlider.show();
  deltaSlider.show();
}
