float PLAYER_SPEED = 1;
float PLAYER_FRICTION = 0.8;

PVector mv = new PVector(0,0);
PVector p = new PVector(0,0);

ArrayList<Integer> pressedKeys = new ArrayList<Integer>();

ArrayList<Bullet> bullets = new ArrayList<Bullet>(); 

void setup() {
  size(500,500); 
  frameRate(60);
}

void draw() {
  fill(255);
  background(255);
  translate(width/2-p.x,height/2-p.y);
  rect(0,0,10,10);
  ellipse(p.x,p.y,20,20);
  for(Integer i : pressedKeys) {
    switch(i) {
      case 87:
        mv.y -= PLAYER_SPEED;
        break;
      case 83:
        mv.y += PLAYER_SPEED;
        break;
      case 65:
        mv.x -= PLAYER_SPEED;
        break;
      case 68:
        mv.x += PLAYER_SPEED;
        break;
    }
  }
  p.add(mv);
  mv.mult(PLAYER_FRICTION);
  
  for (Bullet bullet : bullets) {
    bullet.move();
    fill(255,0,0);
    ellipse(bullet.pos.x,bullet.pos.y,5,5);
  }
}

void keyPressed() {
  if (!pressedKeys.contains(keyCode)) {
    pressedKeys.add(keyCode);
  }
}

void keyReleased() {
  if (pressedKeys.contains(keyCode)) {
    int index = pressedKeys.indexOf(keyCode);
    pressedKeys.remove(index);
  }
}

void mousePressed() {
  bullets.add(new Bullet(p.x,p.y,mouseX - width/2 + p.x,mouseY - height/2 + p.y));
}
