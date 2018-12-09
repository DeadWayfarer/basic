public class Point {
  float x,y;
  public Point(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  public Point() {
    x = random(width);
    y = random(height);
  }
  
  public void toPoint(Point p) {
    x += (p.x-x)/2;
    y += (p.y-y)/2;
  }
}
