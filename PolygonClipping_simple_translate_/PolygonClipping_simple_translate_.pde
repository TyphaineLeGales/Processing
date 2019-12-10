import geomerative.*;
import processing.pdf.*;

Cross currCross;
boolean isFirst = true;
boolean isLast = false;
int maxCrosses = 50;
int count = 60;
int increment = 15;
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
   translate(width/1.5,height/4);
   eliminateIntersections();
   drawShapes();
}

void drawShapes(){
  for(int i = 0; i< maxCrosses; i++){
     clippedShapes[i].draw();
  }
   
  
}

void eliminateIntersections() {

 for(int i=0; i<count; i+=increment){
   
    currCross = new Cross(i, i, 2); 
    currShape = currCross.makeShape(); 
    clippedShapes[i] = currShape;
    
      for(int j = 0; j<i; j++) {
        prevShape = clippedShapes[j];
        print(j);
        intersection = prevShape.intersection(currShape);
        
        //if polygon superior intersects a lower polygon, modify lower polygon
        if(intersection != null) {
           clippedShapes[j] = prevShape.diff(intersection);
        }      
        // Store intersections of shape with previous shapes (interation over array totalCrosses)
        // if empty draw clippedShape
        // if elements in it clippedShape = clippedShape.diff(intersection) 
      }
  }
}
