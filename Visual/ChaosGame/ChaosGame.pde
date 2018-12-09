ArrayList<Point> points = new ArrayList<Point>(); 
Point p;

void setup() {
  size(800,800);
  reset();
}

void reset() {
  for(int i = 0; i < 3; i++) {
    points.add(new Point());
  }
  
  beginShape();
  for(int i = 0; i < points.size()-1; i++) {
    Point p1 = points.get(i);
    Point p2 = points.get(i+1);
    
    vertex(p1.x,p1.y,p2.x,p2.y);
  }
  endShape(CLOSE);
  
  p = new Point();
}

void draw() {
  
  for(int i = 0; i < 50; i++) {
    ellipse(p.x,p.y,1,1);
    
    int s = (int) random(0,points.size());
    p.toPoint(points.get(s));
    
  }
}
