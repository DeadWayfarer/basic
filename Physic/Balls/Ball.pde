public class Ball {
  public final float SIZE;
  public static final float MAX_SPEED = 3;
  public float x, y, vx, vy;
  public int[] ballColor;
  public boolean isCollision = false;
  
  public Ball() {
    x = random(width - 50) + 25;
    y = random(height - 50) + 25;
    vx = random(MAX_SPEED)-MAX_SPEED/2;
    vy = random(MAX_SPEED)-MAX_SPEED/2;
    SIZE = random(30)+10;
    ballColor = new int[3];
    for (int i = 0; i < 3; i++) {
      ballColor[i] = (int) random(256);
    }
  }
  
  public void move() {
    x += vx;
    y += vy;
  }
  
  public void drawBall() {
    fill(ballColor[0],ballColor[1],ballColor[2]);
    ellipse(x,y,SIZE,SIZE);
  }
  
  public void checkCollision(ArrayList<Ball> balls) {
    if (x > width - SIZE/2 & vx > 0) { //wall collision
      vx *= -1;
    }
    if (x > width + SIZE) {
        vx-= +0.01;
    }
    if (y > height - SIZE/2 & vy > 0) {
      vy *= -1;
    }
    if (y > height + SIZE) {
        vy-= +0.01;
    }
    if (x < 0 + SIZE/2 & vx < 0) {
      vx *= -1;
    }
    if (y < 0 + SIZE/2 & vy < 0) {
      vy *= -1;
    }
    collision(balls);
  }
  
  public boolean collision(Ball ball) {
    if (this == ball) {
      return false;
    }
    float cx, cy;
    cx = ball.x;
    cy = ball.y;
    if (sq(cx-x) + sq(cy-y) <= sq(SIZE/2+ball.SIZE/2)) {
      return true;
    }
    else {
      return false;
    }
  }
  
  public void collision(ArrayList<Ball> balls) {
    boolean startCheck = false;
    for (Ball ball : balls) {
      if (startCheck && collision(ball)) {
        Vector vc = new Vector(x-ball.x, y - ball.y);
        Vector vv = new Vector(vx, vy);
        Vector ballvv = new Vector(ball.vx, ball.vy);
        
        float l = vv.getVectorLength() + ballvv.getVectorLength();
        float k = (SIZE + ball.SIZE);
        //l*= 0.99;  //Потеря энергии
        
        vc.scaleToLength(l*(ball.SIZE/k));
        vc.add(vv);
        vc.scaleToLength(l*(ball.SIZE/k));
        
        vx = vc.x;
        vy = vc.y;
        
        vc = new Vector(ball.x - x, ball.y - y);
        
        vc.scaleToLength(l*(SIZE/k));
        vc.add(ballvv);
        vc.scaleToLength(l*(SIZE/k));
        
        ball.vx = vc.x;
        ball.vy = vc.y;
      }
      if (ball == this) {
        startCheck = true;
      }
    }
  }
}
