import geomerative.*;
import processing.pdf.*;

Cross currCross1, currCross2;
boolean isFirst = true;
int count =420;
int spacing =2;
float density = 0.85;


float translateX = width*3;
float translateY = height/5;

int p =0;

RPolygon currShape1, currShape2,clippedShape;
RPolygon[] clippedShapes = new RPolygon[count];

void setup() {
 size(900, 900, PDF, "CrossPositionedOrigin_2.pdf");
  //size(750, 700, PDF, "crossGraphicsFinal_3.svg");
  //size(900, 900);
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
  translate(20, 20);
  for(int i = 0; i< count; i++){
     noFill();
     clippedShapes[i].draw();
  }
 
}

void eliminateIntersections() {

 for(int i=0; i<count; i+=1){
    currCross1 = new Cross(0 ,0);
    currShape1 = currCross1.makeShape(); 
    clippedShapes[i] = currShape1;
     
    currShape1.rotate(cos(i/TWO_PI*density));
    currShape1.translate(i,i);
   
    if(isFirst == false) {
       for(int j = i; j>0; j--) {
           clippedShapes[i-j] = clippedShapes[i-j].diff(clippedShapes[i]);   
       }
     } else {
        isFirst = false;
     }
   }
}
