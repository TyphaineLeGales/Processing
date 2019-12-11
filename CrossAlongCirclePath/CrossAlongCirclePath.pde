import geomerative.*;
import processing.pdf.*;

RPoint[] points = new RPoint[12];
RPolygon currShape, clippedShape, diff;

int count = 126;
RPolygon[] clippedShapes = new RPolygon[count];
boolean isFirst = true;
boolean isLast = false;
Cross currCross;
int cx = 250;
int cy = 250;
int r = 100;
int x;
int y;

void setup() {
  size(550, 700);
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
   noFill();
    clippedShapes[i].draw();    
  } 

     //exit();
}
 
void createShapeArray(){
  for(int t = 0; t < count; t+= 1 ) {
    currCross = new Cross((float)(cx+r*cos(t*0.05)),(float)(cy+r*sin(t*0.05))); 
    currShape = currCross.makeShape(); 
    clippedShapes[t] = currShape;
    if(isFirst == false && t< count-13) {
       for(int j = t; j>0; j--) {
           clippedShapes[t-j] = clippedShapes[t-j].diff(clippedShapes[t]);   
       }
     } else {
        isFirst = false;
     }
     
   }
   
   correctEndClipping();
       
}

void correctEndClipping () {
   for(int e = 0; e < 13; e++){
     for(int k = 13; k > 0; k--){
       clippedShapes[count-k] = clippedShapes[count-k].diff(clippedShapes[e]);   
     } 
   }
   
   for(int m = 18; m>1; m--){
     for(int n = m-1; n>1; n-- ){
       clippedShapes[count-m] = clippedShapes[count-m].diff(clippedShapes[count-n]);
     }
   }
}
