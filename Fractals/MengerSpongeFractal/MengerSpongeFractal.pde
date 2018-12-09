float a = -1.5;
public ArrayList<Box> boxes = new ArrayList<Box>();
public ArrayList<Box> newBoxes = new ArrayList<Box>();

void setup() {
  size(500, 500, P3D);
  frameRate(60);
  boxes.add(new Box(0,0,0,200));
} 

void draw() {
  background(200);
  noStroke();
  fill(255);
  lights();
  
  translate(width/2,height/2,0);
  rotateX(a);
  rotateY(a*0.6);
  rotateZ(a*0.2);
  for(Box box : boxes) {
    box.show();
  }
  
  a+= 0.01;
}

void mousePressed() {
  for(Box box : boxes) {
    box.drop();
  }
  boxes = newBoxes;
  newBoxes = new ArrayList<Box>();
}
