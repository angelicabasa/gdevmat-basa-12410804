void setup() // the function that gets called at the very first frame
{
  size(1020, 720, P3D);
  // This camera setup centers the origin (0,0) in the middle of the screen
  camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
  background(0);
}

void draw() // the function that gets called every frame
{

  float gaussianX = randomGaussian();
  float standardDevX = 150;
  float meanX = 0;
  float x = (standardDevX * gaussianX) + meanX;

  float y = random(-height/2, height/2);

  float gaussianSize = randomGaussian();
  float standardDevSize = 10;
  float meanSize = 20;
  float circleSize = (standardDevSize * gaussianSize) + meanSize;
  
  circleSize = max(2, circleSize);

  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  noStroke();
  fill(r, g, b, a);
  circle(x, y, circleSize);
}
