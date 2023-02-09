
PShader worley;

PVector[] points;

void setup() {
  //size(800, 800, P2D);
  fullScreen(P2D);
  worley = loadShader("worley.glsl");

  points = new PVector[64];
  for (int i=0; i<points.length; i++) {
    points[i] = new PVector(random(1), random(1), random(1));
  }
  points[0].set(0.5,0.5,0.5);
}

void draw() {
  background(0);
  
  worley.set("totalPoints", points.length);
  for (int i=0; i<points.length; i++) {
    PVector point = points[i];
    worley.set("points["+i+"]", point.x, point.y, point.z);
  }
  float z = (float)mouseX/width;
  worley.set("z", z);
  
  //points[0].set((float)mouseX/width, 1.0-(float)mouseY/height);
  
  filter(worley);
  
  noFill();
  strokeWeight(8);
  for (int i=0; i<points.length; i++) {
    PVector point = points[i];
    stroke(point.x*255, point.y*255, point.z*255);
    point(point.x*width, (1.0-point.y)*height);
  }
}
