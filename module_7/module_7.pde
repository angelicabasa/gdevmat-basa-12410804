Walker[] walkers = new Walker[10];
Liquid ocean;
PVector wind = new PVector(0.1, 0);

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
    
    float posX = (Window.widthPx / 10.0f) * (i - 4.5f);
    walkers[i].position = new PVector(posX, 400);
    
    walkers[i].mass = walkers.length - i; 
    walkers[i].scale = walkers[i].mass * 20;
    
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = 200; 
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker w : walkers) 
  {
    PVector gravity = new PVector(0, -0.15f * w.mass);
    
    w.applyForce(wind);
    w.applyForce(gravity);
    
    if (ocean.isCollidingWith(w)) 
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
    
    w.update();
    w.bounce();
    w.render();
  }
}
