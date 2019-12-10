import geomerative.*;
import processing.pdf.*;

Cross currCross;
boolean isFirst = true;
float density = 0.35;
int count = 50;
int spacing =3;

RPolygon currShape, clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
  //size(250, 200, PDF, "OclludedCross.pdf");
  //size(750, 700, PDF, "crossGraphicsTry_3.svg");
  size(1240, 1240);
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
   //exit();
}

void drawShapes(){
  for(int i = 0; i< count; i++){
     noFill();
     clippedShapes[i].draw();
  }
}

void eliminateIntersections() {

 for(int i=0; i<count; i+=1){
   //apply tranformation matrix to coord
   // rotate(-sin(i/TWO_PI*density));
   
    currCross = new Cross(-i*spacing+ width/3, i*spacing+height/4); 
    currShape = currCross.makeShape(); 
    clippedShapes[i] = currShape;
    if(isFirst == false) {
       for(int j = i; j>0; j--) {
           clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       }
     } else {
        isFirst = false;
     }
   }
}
