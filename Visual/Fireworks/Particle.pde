float MAX_POWER = 3;

class Particle {
  PVector pos;
  PVector acc;
  
  Particle(PVector _pos) {
    float angle = random(0,TAU);
    float particlePower = random(0,MAX_POWER);
    
    float x = particlePower*cos(angle);
    float y = particlePower*sin(angle);
    
    pos = new PVector(_pos.x,_pos.y);
    acc = new PVector(x,y);
  }
  
  void show() {
    pos.add(acc);
    acc.add(gravity);
    ellipse(pos.x, pos.y,2,2);
  }
}
