public static final int CELL_COUNT = 10; //5 - минимум
public static final int CELL_SIZE = 500/CELL_COUNT;

public static final int SPEED = 15;
public static final boolean AUTO = false;

int[][] gameField = new int[CELL_COUNT][CELL_COUNT];
ArrayList<Point> snake = new ArrayList<Point>();
Direction direction = Direction.RIGHT;
int Timer = 0;
Point apple;
int score = 0;

enum Direction {
  UP, DOWN, LEFT, RIGHT
}

void setup () {
  //frameRate(60);
  size(500,500);
  snake.add(new Point());
  apple = new Point();
}

void draw() {
  Timer++;
  if (Timer == SPEED) {
    Timer = 0;
    paintField();
    moveSnake();
    paintSnake();
  }
}

void paintField() {
  background(240);
  stroke(150);
  for (int x = 0; x <= width; x += CELL_SIZE) {
    line(x,0,x,height);
  }
  for (int y = 0; y <= height; y += CELL_SIZE) {
    line(0,y,width,y);
  }
}

void moveSnake() {
  Point head = snake.get(0);
  Point lastBody = head.clone();
  
  if (!AUTO) {
    if (keyCode == UP & direction != Direction.DOWN) {
      direction = Direction.UP;
    } else if (keyCode == DOWN & direction != Direction.UP) {
      direction = Direction.DOWN;
    } else if (keyCode == LEFT & direction != Direction.RIGHT) {
      direction = Direction.LEFT;
    } else if (keyCode == RIGHT & direction != Direction.LEFT) {
      direction = Direction.RIGHT;
    }
  }
  else {
    if (head.y % 2 == 0) {
      direction = Direction.LEFT;
    }
    else {
      direction = Direction.RIGHT;
    }
    
    if (head.x == 0 & head.y % 2 == 0) {
      direction = Direction.DOWN;
    }
    if (head.x == CELL_COUNT-2 & head.y % 2 == 1 & head.y != CELL_COUNT-1) {
      direction = Direction.DOWN;
    }
    if ((head.x == CELL_COUNT-1) & (head.y != 0)) {
      direction = Direction.UP;
    }
  }
  
  for (int i = 1; i < snake.size(); i++) {
    Point body = snake.get(i);
    Point holder = body.clone();
    
    if(head.equals(body)) {
      gameOver();
    }
    body.set(lastBody);
    lastBody = holder;
  }
  
  if (head.equals(apple)) {
    score++;
    snake.add(apple);
    apple = new Point();
  }
  
  switch (direction) {
    case UP:
      head.y-=1;
      break;
    case DOWN:
      head.y+=1;
      break;
    case LEFT:
      head.x-=1;
      break;
    case RIGHT:
      head.x+=1;
      break;
  }
  if (head.x < 0 | head.y < 0 | head.x >= CELL_COUNT | head.y >= CELL_COUNT) {
    gameOver();
  }
}

void paintSnake() {
  fill(10,240,10); 
  for(int i = 1; i < snake.size(); i++) {
    Point p = snake.get(i);
    paintCell(p);
  }
  fill(200,10,10); 
  paintCell(apple);
  fill(0,200,0);
  paintCell(snake.get(0));
}

void paintCell(Point p) {
  rect(CELL_SIZE*p.x,CELL_SIZE*p.y,CELL_SIZE,CELL_SIZE);
}

void gameOver() {
  score = 0;
  snake = new ArrayList<Point>();
  snake.add(new Point());
}
