class Bullet {
  PVector mv;
  PVector pos;
  
  Bullet(float x, float y, float vx, float vy) {
    pos = new PVector(x,y);
    mv = new PVector(vx - x,vy - y);
    mv.div(mv.dist(new PVector(0,0)));
    mv.mult(8);
  }
  
  void move() {
    pos.add(mv);
  }
}
