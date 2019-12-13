import geomerative.*;
import processing.pdf.*;

Cross currCross1, currCross2;
boolean isFirst = true;
int count =300;
int spacing =2;
float density = 0.55;


float translateX = width*3;
float translateY = height/5;

int p =0;

RPolygon currShape1, currShape2,clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
 //size(900, 800, PDF, "CrossFinal.pdf");
  //size(750, 700, PDF, "crossGraphicsFinal_3.svg");
  size(900, 800);
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
    currCross1 = new Cross(0 ,0);
    currCross2 = new Cross(0 ,0); 
    currShape1 = currCross1.makeShape(); 
    currShape2 = currCross1.makeShape();
    clippedShapes[i] = currShape1;
    
    currShape1.rotate(sin(i/TWO_PI*density));
    currShape1.translate(i+70,i);
    if(isFirst == false) {
       for(int j = i; j>0; j--) {
           clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       }
     } else {
        isFirst = false;
     }
   }
}
