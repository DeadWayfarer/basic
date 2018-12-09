void setup() {
  size(500,500);
}

void draw() {
  translate(width/2,height/2);
  
  float angle = 0;
  long timeNow = System.currentTimeMillis();
  timeNow /= 1000;
  long second = timeNow%60;
  timeNow /= 60;
  long minute = timeNow%60;
  timeNow /= 60;
  long hour = timeNow%24;
  hour += 7;
  if (hour > 24) {
    hour -= 24;
  }
  
  noFill();
  background(255);
  
  strokeWeight(3);
  stroke(139,0,139);
  angle = map(second,0,60,0,TAU)-HALF_PI;
  
  arc(0,0,width-40,height-40,-HALF_PI,angle);
  
  strokeWeight(2);
  line(0,0,(width/2-40)*cos(angle),(height/2-40)*sin(angle));
  
  angle = map(minute,0,60,0,TAU)-HALF_PI;
  strokeWeight(3);
  stroke(0,230,0);
  
  arc(0,0,width-25,height-25,-HALF_PI,angle);
  
  strokeWeight(4);
  line(0,0,width/3*cos(angle),height/3*sin(angle));
  
  angle = map(hour,0,24,0,TAU)-HALF_PI;
  strokeWeight(3);
  stroke(255,36,0);
  
  arc(0,0,width-10,height-10,-HALF_PI,angle);
  
  strokeWeight(6);
  line(0,0,width/4*cos(angle),height/4*sin(angle));
  
  stroke(0);
  strokeWeight(1);
  for (float a = 0; a < TAU; a += TAU/60) {
    line((width/2-10)*cos(a),(height/2-10)*sin(a),(width/2-20)*cos(a),(height/2-20)*sin(a));
  }
  strokeWeight(3);
  for (float a = 0; a < TAU; a += TAU/24) {
    line((width/2-10)*cos(a),(height/2-10)*sin(a),(width/2-25)*cos(a),(height/2-25)*sin(a));
  }
}
