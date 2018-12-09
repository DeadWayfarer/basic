public class Vector {
  public float x, y;
  public Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void scaleToLength(float l) {
    float k = l/getVectorLength();
    x *= k;
    y *= k;
  }
  
  public float getVectorLength() {
    return sqrt(sq(x)+sq(y));
  }
  
  public void add(Vector v) {
    x += v.x;
    y += v.y;
  }
}
