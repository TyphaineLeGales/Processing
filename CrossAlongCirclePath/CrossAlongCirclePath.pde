import geomerative.*;

RPoint[] points = new RPoint[12];
RPolygon shape;

int cx = 250;
int cy = 250;
int r = 100;

void setup() {
  size(750, 700);
   RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
  noLoop();
}

void draw() {
  
 //float t = millis()/1000.0f;
 for(float t = 0; t < 10; t+= 0.05 ) {
   int x = (int)(cx+r*cos(t));
    int y = (int)(cy+r*sin(t));
    initShape(x,y);
    shape = new RPolygon(points);
    fill(255);
    shape.draw();
   }
    
 }
  

void initShape(int x, int y){
 
  points[0] = new RPoint(0+x, 30+y);
  points[1] = new RPoint(20+x, 30+y);
  points[2] = new RPoint(20+x, 50+y);
  points[3] = new RPoint(40+x, 50+y);
  points[4] = new RPoint(40+x, 70+y);
  points[5] = new RPoint(20+x, 70+y);
  points[6] = new RPoint(20+x, 90+y);
  points[7] = new RPoint(0+x, 90+y);
  points[8] = new RPoint(0+x, 70+y);
  points[9] = new RPoint(-20+x, 70+y);
  points[10] = new RPoint(-20+x, 50+y);
  points[11] = new RPoint(0+x, 50+y); 
}