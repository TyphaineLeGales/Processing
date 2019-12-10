import geomerative.*;
boolean isFirst = true;
float density = 0.35;
int count = 10;
int spacing =5;
RPoint[] points = new RPoint[12];
RPolygon shape, clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
  size(750, 700);
  RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
  noLoop();
  eliminateIntersections();
}

void draw() {
   for(int i = 0; i< count; i++){
     noFill();
     
     clippedShapes[i].draw();
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

void eliminateIntersections() {

 for(int i=0; i<count; i+=1){
    initShape(i*spacing,i*spacing);
    shape = new RPolygon(points);
    clippedShapes[i] = shape;
    //if(isFirst == false) {
       //for(int j = i; j>0; j--) {
          //// clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       //}
    // } else {
        //isFirst = false;
    // }
   }
}