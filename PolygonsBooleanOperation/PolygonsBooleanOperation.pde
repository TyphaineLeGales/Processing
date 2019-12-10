import geomerative.*;
RPolygon circle, polygon, intersection, finalIntersection;
RPoint[] points = new RPoint[4];
 
void setup () {
  size(500, 500);
  RG.init(this);
  noSmooth();
}
 
void draw () {
  background(12, 200, 170);
  circle = RShape.createCircle(width/2, height/2, width/2).toPolygon();
  points[0] = new RPoint(mouseX, mouseY-width/3);
  points[1] = new RPoint(mouseX+width/3, mouseY);
  points[2] = new RPoint(mouseX, mouseY+width/3);
  points[3] = new RPoint(mouseX-width/3, mouseY);
  polygon = new RPolygon(points);
  intersection = polygon.intersection(circle);
  // intersection returns rPolygon the intersection of the two polygons
  finalIntersection = circle.diff(intersection);
  //fill(255);
  //circle.draw();
  noFill();
  polygon.draw();
  //fill(0);
  //intersection.draw();
  fill(0,255,0);
  finalIntersection.draw();
}
