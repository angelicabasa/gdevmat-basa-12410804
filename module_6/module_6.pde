Walker[] walkers = new Walker[10];

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  resetWalkers();
}

void resetWalkers()
{
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
    walkers[i].mass = i + 1; 
    walkers[i].scale = walkers[i].mass * 15;

    float posY = Window.top - (i * 70) - 50; 
    walkers[i].position = new PVector(Window.left + 50, posY);
    walkers[i].c = color(random(255), random(255), random(255), 200);
  }
}

void draw()
{
  background(255); 
  
  stroke(0);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);
  
  PVector moveRight = new PVector(0.2, 0);
  int stoppedCount = 0;

  for (Walker w : walkers) 
  {
    w.applyForce(moveRight);
    
    //brake
    if (w.position.x >= 0) 
    {
      PVector friction = w.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(0.5);
      w.applyForce(friction);
    }
    
    w.update();
    w.render();

    if (w.position.x > 0 && w.velocity.mag() < 0.15) 
    {
      stoppedCount++;
    }
  }
  
  if (stoppedCount == walkers.length) 
  {
    resetWalkers();
  }
}
