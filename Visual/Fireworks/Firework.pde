int LIFETIME = 60;

class Firework {
  PVector pos;
  PVector mov;
  
  color col;
  int live;
  
  ArrayList<Particle> particles;
  
  Firework() {
    reset();
    live = (int) random(-LIFETIME*2,0);
  }
  
  void show() {
    if (live < 0) {
      live++;
      return;
    }
    color c = color(red(col),green(col),blue(col),map(live,0,LIFETIME,255,0));
    fill(c);
    
    if (mov.y < 0) {
      ellipse(pos.x,pos.y,4,10);
      pos.add(mov);
      mov.add(gravity);
    }
    else {
      if (particles.size() == 0) {
        for (int i = 0; i < PARTICKE_COUNT; i++) {
          particles.add(new Particle(pos));
        }
      }
      for (Particle p : particles) {
        p.show();
      }
      live++;
      if (live == LIFETIME) {
        reset();
      }
    }
  }
  
  void reset() {
    particles = new ArrayList<Particle>();
    
    live = 0;
    pos = new PVector(random(0,width),height-20);
    mov = new PVector(0,-height/random(65,150));
    col = color(random(255),random(255),random(255));
  }
}
