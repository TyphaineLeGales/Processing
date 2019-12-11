import geomerative.*;
import processing.pdf.*;

RPoint[] points = new RPoint[12];
RPolygon currShape, clippedShape;

int count = 125;
RPolygon[] clippedShapes = new RPolygon[count];
boolean isFirst = true;
Cross currCross;
int cx = 250;
int cy = 250;
int r = 100;
int x;
int y;

void setup() {
  size(750, 700);
   //size(750, 700, PDF, "CrossAlongCircle.pdf");
  RG.init(this);
  rectMode(CENTER);
  background(255);
  noFill();
  noLoop();
  createShapeArray();
 

}

void draw() {
    
  for(int i=0; i<count; i+=1){
    clippedShapes[i].draw();    
  } 
     //exit();
}
 
void createShapeArray(){
  for(int t = 0; t < count; t+= 1 ) {
    currCross = new Cross((float)(cx+r*cos(t*0.05)),(float)(cy+r*sin(t*0.05))); 
    currShape = currCross.makeShape(); 
    clippedShapes[t] = currShape;
    if(isFirst == false) {
       for(int j = t; j>0; j--) {
           clippedShapes[t-j] = clippedShapes[t-j].diff(clippedShapes[t]);   
       }
     } else {
        isFirst = false;
     }
     
   }
   
 }
  
