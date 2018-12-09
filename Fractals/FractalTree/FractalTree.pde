int MAX_ITTERATION = 10;
float ratio = 2/3;
float angle = PI/3;
float size = 150;

void setup() {
  size(800,800,P2D);
}

void draw() {
  strokeWeight(3);
  background(255);
  translate(width/2,height);
  tree(size,1);
}

void mouseWheel(MouseEvent e) {
  MAX_ITTERATION += e.getCount();
  if (MAX_ITTERATION < 1) {
    MAX_ITTERATION = 0;
  }
}

void mouseDragged() {
  ratio = size/ (height-mouseY);
  angle = map(mouseX,0,width,0,PI/4);
}

void tree(float size, int itteration) {
  if (itteration >= MAX_ITTERATION) {
    return;
  }
  line(0,0,0,-size);
  translate(0,-size);
  rotate(angle);
  tree(size*ratio,itteration+1);
  rotate(-angle*2);
  tree(size*ratio,itteration+1);
  rotate(angle);
  translate(0,size);
}
