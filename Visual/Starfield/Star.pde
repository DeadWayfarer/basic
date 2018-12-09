class Star {
  int[] c = new int[3];
  float size;
  float x, y, z;
  float pz;
  public Star() {
    x = random(-width/2,width/2);
    y = random(-height/2,height/2);
    z = random(width);
    
    pz = z;
    
    size = random(10)+2;
    setColor();
  }
  
  void setColor() {
    if (size < 4) {
      c[0] = (int) random(40)+160;
      c[1] = 20;
      c[2] = 20;
    }
    else if (size < 5){
      c[0] = 255;
      c[1] = 255;
      c[2] = (int) random(40)+180;
    } else if (size < 6) { 
      c[0] = 220;
      c[1] = 220;
      c[2] = 255;
    }
    else{
      c[0] = 255;
      c[1] = 255;
      c[2] = 255;
    }
  }
  
  void update() {
    z -= 15;
    if (z < 1) {
      x = random(-width/2,width/2);
      y = random(-height/2,height/2);
      z = width;
      pz = z;
      size = random(10)+2;
      setColor();
    }
  }
  
  void show() {
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    float r = map(z, 0, width, size, 0);
    
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);
    
    stroke(c[0],c[1],c[2]);
    strokeWeight(r);
    line(px,py,sx,sy);
    pz = z;
  }
}
