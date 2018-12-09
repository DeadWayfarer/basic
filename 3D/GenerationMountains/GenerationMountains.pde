int cols,rows;
int scale = 20;
int w = 1000;
int h = 1000;
float[][] heightMap;
float fly = 0;

float rotateX = 0;
float rotateY = 0;
float len = 0;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
  
  cols = w/scale;
  rows = h/scale;
  
  heightMap = new float[cols][rows];
  
}

void mouseDragged() 
{
  rotateY+=0.01*(pmouseX-mouseX);
  rotateX+=0.01*(pmouseY-mouseY);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  len += e*5;
}

void draw() {
  //fly -=0.05;
  float yoff = fly;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      heightMap[x][y] = map(noise(xoff/(20/scale),yoff/(20/scale)),0,1,-100,200);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(127,199,255);
  stroke(255);
  noStroke();
  lights();
  
  //noFill();
  
  translate(width/2,height/2,len);
  rotateX(PI/3 + rotateX);
  rotateZ(rotateY);
  translate(-w/2,-h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      if (heightMap[x][y] > 100) {
        fill(230,255,230);
      }
      else if (heightMap[x][y] > 20) {
        fill(100,100,100);
      }
      else {
        fill(20,180,20);
      }
      vertex(x*scale,y*scale, heightMap[x][y]);
      vertex(x*scale,(y+1)*scale, heightMap[x][y+1]);
    }
    endShape();
  }
}
