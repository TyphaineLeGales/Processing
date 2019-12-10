import processing.svg.*;
import geomerative.*;
import processing.pdf.*;

int x=0;
int y=0;
int t=0;

boolean isFirst = true;

RPolygon prevShape,currShape, intersection, clippedShape;
RPoint[] points = new RPoint[12];
RPoint[] prevPoints = new RPoint[12];

void setup() {
 //size(750, 700, PDF, "crossGraphicsTry_4.pdf");
  //size(750, 700, PDF, "crossGraphicsTry_3.svg");
  size(750, 700);
   RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
 // noSmooth();
}

void draw() {

 for(int i=0; i<300; i+=2){
    //push();
    //translate(width/4, height/4);
    //translate(i,i);
    //rotate(sin(angle*i/100+radians(100)));
    // rotate(sin(i/TWO_PI*0.5+radians(10)));
    //rect(0,0, 50, 50);
    //initShape(0);
    //pop();
   
    push();
    translate(width/1.5,height/4);
    translate(-i,i);
    rotate(-sin(i/TWO_PI*0.5+radians(10)));
     
    
    initShape(0, 0);
    
    //get model x/y coord after translation
   
   if(isFirst == false) {
  fill(255);
    intersection = prevShape.intersection(currShape);
    intersection.draw();
     clippedShape = prevShape.diff(intersection);
   // fill(0,255,0);
   // intersection.draw();
    // fill(255,0,0);
   clippedShape.draw();
     
    } else {
     fill(0);
      currShape.draw();
      isFirst = false;
   }
   
   //currShape = prevShape
    prevPoints = currShape.getPoints();
    prevShape = new RPolygon(prevPoints);
    pop();

  }
 // exit();
}

void initShape(int x, int y){
  
  scale(2);
  points[0] = new RPoint(0+x, 30+x);
  points[1] = new RPoint(20+x, 30+x);
  points[2] = new RPoint(20+x, 50+x);
  points[3] = new RPoint(40+x, 50+x);
  points[4] = new RPoint(40+x, 70+x);
  points[5] = new RPoint(20+x, 70+x);
  points[6] = new RPoint(20+x, 90+x);
  points[7] = new RPoint(0+x, 90+x);
  points[8] = new RPoint(0+x, 70+x);
  points[9] = new RPoint(-20+x, 70+x);
  points[10] = new RPoint(-20+x, 50+x);
  points[11] = new RPoint(0+x, 50+x);
  currShape = new RPolygon(points); 
}
