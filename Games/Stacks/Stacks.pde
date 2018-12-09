static final float ANIMATION_SPEED = 0.15f;
static final float BOX_SPEED = 2;
static final float BOX_SPEED_UP = 0.25;
float boxSpeed;
float scale = 1;


float heightOffet = 0;
PVector moveUp = new PVector(0,0);
PVector moveBox = new PVector(0,0);
Direction moveDirect = Direction.RIGHTUP;
color current;
int score;

enum Direction {
  RIGHTUP,LEFTDOWN,RIGHTDOWN,LEFTUP
}

Box lastBox;
ArrayList<Box> boxes;

void setup() {
  size(500,500,P3D);
  frameRate(60);
  reset();
  noStroke();
  textSize(50);
}

void mouseWheel(MouseEvent e) {
  int a = e.getCount();
  if (a > 0) {
    scale*=2;
  }
  else {
    scale/=2;
  }
}

void draw() {
  scale(scale);
  background(135,206,250);
  ortho();
  lights();
  
  fill(0);
  text(score,5/scale,height/scale-10);
  translate(width/2/scale,(height/1.5/scale+heightOffet),-heightOffet);
  rotateX(PI/4);
  rotateZ(PI/4);

  for (Box box : boxes) {
    box.show();
  }
  
  if (moveDirect == Direction.RIGHTUP) {
    moveBox.x += boxSpeed;
    if (moveBox.x >= 250) {
      moveDirect = Direction.LEFTDOWN;
    }
  }
  else if (moveDirect == Direction.LEFTDOWN) {
    moveBox.x -= boxSpeed;
    if (moveBox.x <= -250) {
      moveDirect = Direction.RIGHTUP;
    }
  }
  
  if (moveDirect == Direction.RIGHTDOWN) {
    moveBox.y += boxSpeed;
    if (moveBox.y >= 250) {
      moveDirect = Direction.LEFTUP;
    }
  }
  else if (moveDirect == Direction.LEFTUP) {
    moveBox.y -= boxSpeed;
    if (moveBox.y <= -250) {
      moveDirect = Direction.RIGHTDOWN;
    }
  }
  
  fill(current);
  translate(moveBox.x,moveBox.y);
  box(lastBox.w,lastBox.h,40);
  
  if (moveUp.y > 0.1) {
    heightOffet += moveUp.y * ANIMATION_SPEED;
    moveUp.y *= 1-ANIMATION_SPEED;
  }
  else if (moveUp.y != 0) {
    //heightOffet=40*(boxes.size()-1);
    heightOffet += moveUp.y;
    moveUp.y = 0;
  }
}

void setCurrentColor() {
  float r = red(current) + random(-10,10);
  float g = green(current) + random(-10,10);
  float b = blue(current) + random(-10,10);
  if (r > 255) {
    r = 255;
  }
  if (g > 255) {
    g = 255;
  }
  if (b > 255) {
    b = 255;
  }
  if (r < 0) {
    r = 0;
  }
  if (g < 0) {
    g = 0;
  }
  if (b < 0) {
    b = 0;
  }
  current = color(r,g,b);
}

void mouseClicked() {
  score++;
  boxSpeed += BOX_SPEED_UP;
  if (moveDirect == Direction.LEFTUP || moveDirect == Direction.RIGHTDOWN) {
    moveDirect = Direction.LEFTDOWN;
  }
  else {
    moveDirect = Direction.LEFTUP;
  }
  
  float boxX = (moveBox.x + lastBox.x) / 2;
  float boxY = (moveBox.y + lastBox.y) / 2;
  float boxW = lastBox.w - abs(moveBox.x - lastBox.x);
  float boxH = lastBox.h - abs(moveBox.y - lastBox.y);
  
  moveBox.x = boxX;
  moveBox.y = boxY;
  
  if (boxW <= 0 | boxH <= 0) {
    reset();
    return;
  }
  
  Box newBox = new Box(boxX,boxY,boxW,boxH,current);
  boxes.add(newBox);
  lastBox = newBox;
  setCurrentColor();
  
  moveUp.add(new PVector(0,27));
}

void reset() {
  score = 0;
  current = color(random(255),random(255),random(255));
  lastBox = new Box(0,0,250,250,current);
  boxes = new ArrayList<Box>();
  boxes.add(lastBox);
  setCurrentColor();
  heightOffet = 0;
  moveBox = new PVector(0,0);
  boxSpeed = BOX_SPEED;
}
