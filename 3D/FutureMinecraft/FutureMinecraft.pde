ArrayList<Block> blocks;
float rotx = -PI/4;
float roty = -PI/4;

void setup() {
  size(640, 360, P3D);
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  PImage texture = loadImage("C:\\Users\\Danil\\Desktop\\wall.png");
  blocks = new ArrayList<Block>();
  for (int x = -10; x <= 10; x++) {
    for (int y = -10; y <= 10; y++) {
      blocks.add(new Block(x,0,y,texture));
    }
  }
}

void draw() {
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  translate(0, 200, 0);
  scale(50);
  for(Block block : blocks) {
    block.show();
  }
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
