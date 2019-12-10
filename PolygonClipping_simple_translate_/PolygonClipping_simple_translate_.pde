import geomerative.*;
import processing.pdf.*;

Cross currCross;
boolean isFirst = true;
int count = 5;
int spacing = 25;

RPolygon prevShape,currShape, intersection, clippedShape;
RPolygon[] clippedShapes = new RPolygon[50];

void setup() {
 //size(750, 700, PDF, "crossGraphicsTry_4.pdf");
  //size(750, 700, PDF, "crossGraphicsTry_3.svg");
  size(750, 700);
  RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
  eliminateIntersections();
   
}

void draw() {
   translate(width/1.5,height/4);
   drawShapes();
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
      intersection = clippedShapes[i-1].intersection(clippedShapes[i]);
      clippedShapes[i-1] = clippedShapes[i-1].diff(intersection);
      //test intersection with previous shapes => for each element of the index until currShape index
        //for(int j = 0; j<i; j++) {
          //prevShape = clippedShapes[j];
          //intersection = prevShape.intersection(currShape);
          //fill(0);
          //intersection.draw();
         //if polygon superior intersects a lower polygon, modify lower polygon
        // if(intersection != null) {
            //clippedShapes[j] = prevShape.diff(intersection);
           // print(intersection);
         // }      
       // }
     } else {
        isFirst = false;
     }
   }
}
