class Box {
  float x,y,z;
  float size;
  
  public Box(float x, float y, float z, float size) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
  }
  
  void show() {
    translate(x, y, z);
    box(size);
    translate(-x, -y, -z);
  }
  
  void drop() {
    float newSize = size/3;
    float newX = size/2-newSize/2+x;
    float newY = size/2-newSize/2+y;
    float newZ = size/2-newSize/2+z;
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; y++) {
        for (int z = 0; z < 3; z++) {
          if (!((y == 1 & z == 1) | (y == 1 & x == 1) | (x == 1 & z == 1))) {
            newBoxes.add(new Box(newX-newSize*x,newY-newSize*y,newZ-newSize*z,newSize));
          }
        }
      }
    }
  }
}
