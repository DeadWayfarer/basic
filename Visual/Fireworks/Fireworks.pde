PVector gravity = new PVector(0,0.1);

float FIREWORK_COUNT = 20;
float PARTICKE_COUNT = 200;

PVector pos = new PVector(0,0);
ArrayList<Firework> fireworks = new ArrayList<Firework>();

void setup() {
  size(800,800);
  noStroke();
  frameRate(60);
  
  for (int i = 0; i < FIREWORK_COUNT; i++) {
    fireworks.add(new Firework());
  }
}

void draw() {
  background(0);
  
  for (Firework fw : fireworks) {
    fw.show();
  }
}
