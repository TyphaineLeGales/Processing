import geomerative.*;
import processing.pdf.*;

Cross currCross;
boolean isFirst = true;
int count = 10;
int spacing = 3;

RPolygon currShape, clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
  size(250, 200, PDF, "OclludedCross.pdf");
  //size(750, 700, PDF, "crossGraphicsTry_3.svg");
  size(250, 200);
  RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
  eliminateIntersections();
   
}

void draw() {
   translate(width/1.5,height/4);
   drawShapes();
   exit();
}

void drawShapes(){
  for(int i = 0; i< count; i++){
      noFill();
     clippedShapes[i].draw();
  }
}

void eliminateIntersections() {

 for(int i=0; i<count; i+=1){
     //create shape
    currCross = new Cross(i*spacing, i*spacing); 
    currShape = currCross.makeShape(); 
    clippedShapes[i] = currShape;
    print(i);
    if(isFirst == false) {
       for(int j = i; j>0; j--) {
           clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       }
     } else {
        isFirst = false;
     }
   }
}
