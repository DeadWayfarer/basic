public class Box {
  float x,y,w,h;
  color c;
  
  public Box(float _x, float _y, float _w, float _h, color _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }
  
  public void show() {
    fill(c);
    translate(x,y);
    box(w,h,40);
    translate(-x,-y,40);
  }
}
