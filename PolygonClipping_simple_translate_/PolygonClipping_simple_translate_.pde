import geomerative.*;
import processing.pdf.*;

Cross currCross;
boolean isFirst = true;
int count = 300;
int spacing =2;
float density = 0.35;


float translateX = width*3;
float translateY = height/5;

RPolygon currShape, clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
 size(850, 700, PDF, "RotatedOccludedCross.pdf");
  //size(750, 700, PDF, "crossGraphicsTry_3.svg");
 // size(850, 800);
  RG.init(this);
  rectMode(CENTER);
  background(255);
  noLoop();
  noFill();
  eliminateIntersections();
   
}

void draw() {
   scale(2);
   drawShapes();
   exit();
}

void drawShapes(){
  translate(width/3, 5);
  for(int i = 0; i< count; i++){
     noFill();
     clippedShapes[i].draw();
  }
 
}

void eliminateIntersections() {

 for(int i=0; i<count; i+=1){
    currCross = new Cross(0 ,0); 
    currShape = currCross.makeShape(); 
    clippedShapes[i] = currShape;
    currShape.translate(i,i);
    currShape.rotate(cos(i/TWO_PI*density));
    if(isFirst == false) {
       for(int j = i; j>0; j--) {
           clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       }
     } else {
        isFirst = false;
     }
   }
}
