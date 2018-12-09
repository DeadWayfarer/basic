class Block {
  int x, y, z;
  PImage[] texture;
  public Block(int x, int y, int z, PImage pi) {
    this.x = x;
    this.y = y;
    this.z = z;
    texture = new PImage[6];
    texture[0] = pi;
  }
  
  void show() {
    translate(x*2,y*2,z*2);
    beginShape(QUADS);
    texture(texture[0]);
    vertex(-1, -1,  1, 0, 0);
    vertex( 1, -1,  1, 1, 0);
    vertex( 1,  1,  1, 1, 1);
    vertex(-1,  1,  1, 0, 1);
  
    // -Z "back" face
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 1, 0);
    vertex(-1,  1, -1, 1, 1);
    vertex( 1,  1, -1, 0, 1);
  
    // +Y "bottom" face
    vertex(-1,  1,  1, 0, 0);
    vertex( 1,  1,  1, 1, 0);
    vertex( 1,  1, -1, 1, 1);
    vertex(-1,  1, -1, 0, 1);
  
    // -Y "top" face
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1,  1, 1, 1);
    vertex(-1, -1,  1, 0, 1);
  
    // +X "right" face
    vertex( 1, -1,  1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1,  1, -1, 1, 1);
    vertex( 1,  1,  1, 0, 1);
  
    // -X "left" face
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1,  1, 1, 0);
    vertex(-1,  1,  1, 1, 1);
    vertex(-1,  1, -1, 0, 1);
  
    endShape();
    translate(x*-2,y*-2,z*-2);
  }
}
