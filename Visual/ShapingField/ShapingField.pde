final static int SIZE = 15;
final static float BOX_SIZE = 20;
final static float MAX_DISTANCE = dist(0,0,SIZE,SIZE);

final static float SPEED = -0.07;
final static float DIFF = 8;
final static float MIN_HEIGHT = 50;
final static float MAX_HEIGHT = 150;

static float angle = 0;

float angleX = PI/3, angleZ = PI/4;

void setup() {
  size(800,800,P3D);
}

void mouseDragged() {
  float x = pmouseX - mouseX;
  float y = pmouseY - mouseY;
  
  angleX += y*0.005;
  angleZ += x*0.005;
}

void draw() {
  ortho();
  translate(width/2,height/2,-1000);
  rotateX(angleX);
  rotateZ(angleZ);
  
  lights();
  background(255);
  fill(220,220,180);
  noStroke();
  
  for(int y = -SIZE/2; y < SIZE/2; y++) {
    for(int x = -SIZE/2; x < SIZE/2; x++) {
      float offX = x*BOX_SIZE+BOX_SIZE/2;
      float offY = y*BOX_SIZE+BOX_SIZE/2;
      
      float offset = map(dist(x,y,0,0),0,MAX_DISTANCE,-DIFF,DIFF);
      float toSin = angle+offset;
      float len = map(sin(toSin),-1,1,MIN_HEIGHT,MAX_HEIGHT);
      
      translate(offX,offY);
      box(BOX_SIZE,BOX_SIZE,len);
      translate(-offX,-offY);
    }
  }
  angle+= SPEED;
}
