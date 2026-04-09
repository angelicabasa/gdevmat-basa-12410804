Walker[] walkers = new Walker[100];
PVector holePosition;

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  spawnHole();
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
  }
}

void spawnHole() 
{
  holePosition = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
}

void draw() 
{
  background(0); 
  
  int suckedInCount = 0;
  
  for (Walker w : walkers) 
  {
    w.update(holePosition);
    w.render();
    
    if (PVector.dist(w.position, holePosition) < 10) 
    {
      w.isSuckedIn = true;
    }
    
    if (w.isSuckedIn) suckedInCount++;
  }
  
  fill(255);
  noStroke();

  fill(255, 255, 255, 100);
  circle(holePosition.x, holePosition.y, 70); 
  fill(255);
  circle(holePosition.x, holePosition.y, 50);
  
  //reset
  if (suckedInCount == walkers.length) 
  {
    spawnHole();
    for (Walker w : walkers) 
    {
      w.reset();
    }
  }
}
