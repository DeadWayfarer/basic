import javax.swing.JOptionPane;

static int BALLS_COUNT;

ArrayList <Ball> balls;
String command;

void setup() {
  size(500,500);
  //fullScreen();
  frameRate(60);
  smooth(5);
  init();
}

void init() {
  try {
    command = JOptionPane.showInputDialog(null,"Сколько шариков запустить?");
    if (command == null) {
      command = "";
    }
    BALLS_COUNT = 100;
    int count = Integer.valueOf(command);
    if (count > 0) {
      BALLS_COUNT = count;
    }
  }
  catch (Exception e) {}  
  
  balls = new ArrayList<Ball>(BALLS_COUNT);
  for (int i = 0; i < BALLS_COUNT; i++) {
    balls.add(new Ball());
  }
  
  if (command.equals("test")) {
    BALLS_COUNT = 2;
    balls = new ArrayList<Ball>(2);
    Ball ball1= new Ball();
    ball1.x = 20;
    ball1.y = height-20;
    ball1.vx = 1;
    ball1.vy = -1;
    
    Ball ball2= new Ball();
    ball2.x = (width-20)/4*3;
    ball2.y = (height-20)/4*3;
    ball2.vx = -0.5;
    ball2.vy = -0.5;
    
    balls.add(ball1);
    balls.add(ball2);
  }
}

void mouseClicked() {
  init();
}

void draw() {
  background(255);
  fill(0);
  line(width,0,width,height);
  line(0,height,width,height);
  for (Ball ball : balls) {
    ball.drawBall();
    ball.move();
    ball.checkCollision(balls);
  }
}

void mouseWheel(MouseEvent e)
{
  if (height < 200 & e.getCount() == -1f) {
    return;
  }
  height += 100 * e.getCount();
  width += 100 * e.getCount();
}
