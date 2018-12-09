class Point {
  public int x,y;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  Point(Point p) {
    x = p.x;
    y = p.y;
  }
  
  Point() {
    x = (int) random(CELL_COUNT);
    y = (int) random(CELL_COUNT);
  }
  
  void set(Point p) {
    x = p.x;
    y = p.y;
  }
  
  boolean equals(Point p) {
    if (this.x == p.x & this.y == p.y) {
      return true;
    }
    return false;
  }
  
  Point clone() {
    return new Point(x,y);
  }
}
