Walker[] walkers = new Walker[8];

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeWalkers();
}

void initializeWalkers()
{
  int n = walkers.length;
  for (int i = 0; i < n; i++) 
  {
    walkers[i] = new Walker();
    
    float posY = (Window.windowHeight / (float)n) * ( (i + 0.5f) - (n / 2.0f) );
    
    walkers[i].position = new PVector(Window.left + 50, posY * -1);
    
    walkers[i].mass = i + 1; 
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].c = color(random(255), random(255), random(255));

    walkers[i].velocity = new PVector(0,0);
  }
}

void mousePressed() 
{
  initializeWalkers();
}

void draw()
{
  background(255);

  stroke(0);
  line(0, Window.top, 0, Window.bottom);
  
  for (Walker w : walkers) 
  {
    PVector accelerationForce = new PVector(0.2f * w.mass, 0);
    w.applyForce(accelerationForce);

    float mew = 0.01f;
    if (w.position.x >= 0) 
    {
      mew = 0.4f;
    }
    
    if (w.velocity.mag() > 0) 
    {
      PVector friction = w.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(mew * w.mass); 
      w.applyForce(friction);
    }
    
    w.update();
    w.render();
  }
}
