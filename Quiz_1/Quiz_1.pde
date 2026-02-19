float amplitude = 40;
float frequency = 0.08;
float timeSpeed = 0.5;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); 
  
}

void draw()
{
  background(0); 
  
  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  
  drawSineWave();
}

void drawCartesianPlane()
{
  color red = color(255, 0, 0);
  color white = color(255, 255, 255);
  
  fill(red);
  circle(0, 0, 10);
  
  strokeWeight(2);
  fill(white);
  stroke(white);
  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
   line( i, -2, i, 2);
   line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  // f(x) = -5x + 30
  
  color purple = color(200, 0, 255);
  fill(purple);
  stroke(purple);
  
  for (int x = -200; x <= 200; x++)
  {
   
    circle(x, (-5 * x + 30), 5);
  }
}

void drawQuadraticFunction() 
{
  // f(x) = x^2 - 15x - 3;
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+=0.1f)
  { 
  circle(x, (float)Math.pow(x, 2) - (x * 15) - 3, 5);
  }
}

void drawSineWave()
{ 
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  
  
  for (float x = -250; x <= 250; x++)
  { 
      circle(x, sin(x * frequency + frameCount * timeSpeed) * amplitude, 5);
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    amplitude += 5;
  }
  if (key == 's') 
  {
    amplitude -= 5;
  }

  if (key == 'd')
  {
    frequency += 0.01;
  }
  if (key == 'a') 
  {
    frequency -= 0.01;
  }
  
}
