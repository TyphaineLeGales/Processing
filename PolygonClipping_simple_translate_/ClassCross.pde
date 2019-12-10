import geomerative.*;

class Cross {
  //data
  float x;
  float y;
  float Scale;
  RPoint[] points = new RPoint[12];
  
  //constructor
  Cross(float x,float y) {
    setPoints(x, y);
  }

  //methods
  void setPoints(float x, float y) {
    points[0] = new RPoint(0+x, 30+y);
    points[1] = new RPoint(20+x, 30+y);
    points[2] = new RPoint(20+x, 50+y);
    points[3] = new RPoint(40+x, 50+y);
    points[4] = new RPoint(40+x, 70+y);
    points[5] = new RPoint(20+x, 70+y);
    points[6] = new RPoint(20+x, 90+y);
    points[7] = new RPoint(0+x, 90+y);
    points[8] = new RPoint(0+x, 70+y);
    points[9] = new RPoint(-20+x, 70+y);
    points[10] = new RPoint(-20+x, 50+y);
    points[11] = new RPoint(0+x, 50+y);
  }
  
  public RPoint[] getPoints(){
    return points;
  }
  
  public RPolygon makeShape(){
    return currShape = new RPolygon(points); 
  }
}
