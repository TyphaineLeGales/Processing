import geomerative.*;
import processing.pdf.*;

int x=0;
int y=0;
int t=0;
Cross currCross;
boolean isFirst = true;
boolean isLast = false;
int count = 60;
RPolygon prevShape,currShape, intersection, clippedShape;
//Cross[] totalPolygons = new Cross[count];

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

 for(float i=0; i<count; i+=25){
    
   
   
    push();
    translate(width/1.5,height/4);
    currCross = new Cross(i, i, 2); 
    currShape = currCross.makeShape(); 
    fill(0);
    currShape.draw();
  // if(isFirst == false && isLast == false) {
   // intersection = prevShape.intersection(currShape);
    // clippedShape = prevShape.diff(intersection);
   // intersection.draw();
    // fill(255,0,0);
   //  clippedShape.draw();
     
   // } else {
    //  isFirst = false;
   //}
   
   // prevShape = new RPolygon(currShape);
    pop();

  }
 // exit();
}
